import Foundation
import UniformTypeIdentifiers

public protocol SyntaxHighlighterProtocol {
    // TODO: Get rid of reliance on NSMutableAttributedString
    func highlight(_ source: String, highlighted: NSMutableAttributedString, theme: Theme) throws
}

public struct SyntaxHighlighter: SyntaxHighlighterProtocol {

    let type: UTType
    let baseHighter: any SyntaxHighlighterProtocol

    public init?(type: UTType) {
        self.type = type
        switch type {
        case .swiftSource:
            self.baseHighter = SwiftSyntaxHighlighter()
        case .cPlusPlusSource:
            self.baseHighter = try! TreeSitterSyntaxHighlighter()
        default:
            return nil
        }
    }

    public func highlight(_ source: String, highlighted: NSMutableAttributedString, theme: Theme) throws {
        try baseHighter.highlight(source, highlighted: highlighted, theme: theme)
    }
}

extension SyntaxHighlighter: Equatable {
    public static func == (lhs: SyntaxHighlighter, rhs: SyntaxHighlighter) -> Bool {
        lhs.type == rhs.type
    }
}
