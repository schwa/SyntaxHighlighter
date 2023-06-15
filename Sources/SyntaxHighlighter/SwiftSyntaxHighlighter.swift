import Foundation
import SwiftSyntax
import SwiftParser

struct SwiftSyntaxHighlighter: SyntaxHighlighterProtocol {

    static let scopeMap: [(Set<SyntaxEnum.Meta>, Scope)] = [
        ([.importDecl], .keyword),
        ([.identifierExpr], .macro),
        ([.variableDecl], .variable),
//        ([], .systemVariable),
        ([.classDecl, .structDecl], .`class`),
//        ([], .`systemClass`),
//        ([], .comment),
//        ([], .doc),
//        ([], .macro),
//        ([], .macroSystem),
        ([.stringLiteralExpr], .string),
//        ([], .constant),
//        ([], .systemConstant),
//        ([], .otherDeclaration),
//        ([], .typeDeclaration),
//        ([], .systemTypeDeclaration),
//        ([], .mark),
//        ([], .url),
//        ([], .keyword),
//        ([], .attribute),
//        ([], .number),
//        ([], .functionIdentifier),
//        ([], .functionIdentifierSystem),
//        ([], .functionSystem),
//        ([], .plain),
//        ([], .markupAsideKind),
//        ([], .character),
//        ([], .commentDocKeyword),
//        ([], .markupCode),
//        ([], .typeIdentifier),
//        ([], .typeIdentifierSystem),
//        ([], .preprocessor),
    ]

    

    func highlight(_ source: String, highlighted: NSMutableAttributedString, theme: Theme) throws {
        let root = Parser.parse(source: source)

        highlighted.setAttributes(theme.attributesForScope[.plain], range: NSRange(location: 0, length: highlighted.string.count))

        root.walk { syntax, _ in
            guard let syntax = syntax.as(Syntax.self) else {
                fatalError()
            }
            let type = SyntaxEnum.Meta(syntax.as(SyntaxEnum.self))
            guard let scope = Self.scopeMap.first(where: { $0.0.contains(type) })?.1 else {
                return
            }
            guard let attributes = theme.attributesForScope[scope] else {
                return
            }
            let range = NSRange(syntax.range(in: highlighted.string), in: highlighted.string)
            highlighted.setAttributes(attributes, range: range)
        }
    }
}

extension SyntaxProtocol {

    func range(in string: String) -> Range<String.Index> {
        let utf = string.utf8
        let start = utf.index(utf.startIndex, offsetBy: positionAfterSkippingLeadingTrivia.utf8Offset)
        let end = utf.index(start, offsetBy: contentLength.utf8Length)
        return start ..< end
    }

    func walk(_ visitor: (_ node: SyntaxProtocol, _ skip: inout Bool) throws -> Void) rethrows {
        var skip = false
        try visitor(self, &skip)
        if skip {
            return
        }
        for child in children(viewMode: .all) {
            try child.walk(visitor)
        }
    }

}
