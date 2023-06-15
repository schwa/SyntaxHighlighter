#if os(macOS)
    import AppKit
    import Foundation
    import os
    import SwiftTreeSitter

    let logger: Logger? = Logger(subsystem: "TODO", category: "TODO")

public class TreeSitterSyntaxHighlighter: SyntaxHighlighterProtocol {

        let language: STSLanguage
        let parser: STSParser
        var tree: STSTree?
        let scopeMap: LanguageToScopeMap

        required public init() throws {
            language = try STSLanguage(fromPreBundle: .cpp)
            parser = STSParser(language: language)
            scopeMap = cppLanguageToScopeMap
        }

        public static func == (lhs: TreeSitterSyntaxHighlighter, rhs: TreeSitterSyntaxHighlighter) -> Bool {
            return lhs.language == rhs.language
        }


        public func highlight(_ source: String, highlighted: NSMutableAttributedString, theme: Theme) throws {
            guard let tree = parser.parse(string: source, oldTree: nil) else {
                fatalError()
            }
            self.tree = tree

            tree.rootNode.walk { node, _ in
                guard !scopeMap.ignored.contains(node.type) else {
                    return
                }
                let result = scopeMap.mapping.first { path, _ in
                    node.path.hasSuffix(path)
                }
                guard let scope = result?.1 else {
                    //logger?.warning("No scope for \"\(node.path, privacy: .public)\"")
                    return
                }
                guard let attributes = theme.attributesForScope[scope] else {
                    logger?.warning("No attributes for scope.")
                    return
                }
                highlighted.setAttributes(attributes, range: node.range)
            }
        }
    }

    extension STSNode {
        var range: NSRange {
            NSRange(location: Int(startByte), length: Int(endByte - startByte))
        }

        var path: String {
            if type != "translation_unit" {
                return parent().path + "." + type
            } else {
                return type
            }
        }

        func walk(_ visitor: (_ node: STSNode, _ skip: inout Bool) throws -> Void) rethrows {
            var skip = false
            try visitor(self, &skip)
            if skip {
                return
            }
            for child in children() {
                try child.walk(visitor)
            }
        }
    }

    let cppLanguageToScopeMap = LanguageToScopeMap(
        mapping: [
            (".function_definition.function_declarator.identifier", "xcode.syntax.identifier.function"),
            ("preproc_def", "xcode.syntax.preprocessor"),
            ("#include", "xcode.syntax.preprocessor"),
            ("class_specifier", "xcode.syntax.identifier.class"),
            ("class", "xcode.syntax.keyword"),
            ("comment", "xcode.syntax.comment"),
            ("enum", "xcode.syntax.keyword"),
            ("field_identifier", "xcode.syntax.identifier.type"),
            ("identifier", "xcode.syntax.identifier.variable"),
            ("namespace", "xcode.syntax.keyword"),
            ("number_literal", "xcode.syntax.character"),
            ("primitive_type", "xcode.syntax.identifier.type.system"),
            ("return", "xcode.syntax.keyword"),
            ("string_literal", "xcode.syntax.string"),
            ("struct", "xcode.syntax.keyword"),
            ("system_lib_string", "xcode.syntax.preprocessor"),
            ("type_identifier", "xcode.syntax.identifier.type"),
            ("using", "xcode.syntax.keyword"),
        ],
        ignored: [
            "\n", "-", ",", ";", ".", "(", ")", "[[", "]]", "{", "}", "*", "&", "+", "=", "argument_list", "assignment_expression", "attribute", "attribute_declaration", "attributed_declarator", "binary_expression", "call_expression", "compound_statement", "declaration", "enum_specifier", "enumerator", "enumerator_list", "ERROR", "expression_statement", "field_declaration", "field_declaration_list", "field_expression", "function_declarator", "function_definition", "init_declarator", "parameter_declaration", "parameter_list", "parenthesized_expression", "preproc_include", "reference_declarator", "return_statement", "struct_specifier", "translation_unit", "using_declaration",
            "pointer_expression", "/", "initializer_list",
        ]
    )
#endif
