import AppKit
import Foundation
import RegexBuilder

public struct LanguageToScopeMap {
    public let mapping: [(String, String)]
    public let ignored: Set<String>
}

public struct Theme {
    public let name: String
    public let attributesForScope: [String: [NSAttributedString.Key: Any]]

    public init(url: URL) throws {
        name = url.deletingPathExtension().lastPathComponent
        let data = try Data(contentsOf: url)
        let xcColorTheme = try PropertyListDecoder().decode(XCColorTheme.self, from: data)
        attributesForScope = Dictionary(uniqueKeysWithValues: xcColorTheme.sourceTextSyntaxColors.map { key, color -> (String, [NSAttributedString.Key: Any]) in
            let font = xcColorTheme.sourceTextSyntaxFonts[key]!
            return (key, [.foregroundColor: color, .font: font])
        })
    }

    public init(named name: String, bundle: Bundle = .main) throws {
        guard let url = bundle.url(forResource: name, withExtension: "xccolortheme") else {
            fatalError()
        }
        self = try Theme(url: url)
    }

    public enum BuiltIn: CaseIterable {
        public static let allCases: [Theme] = [
            Self.bare,
            Self.basic,
            Self.civic,
            Self.classicDark,
            Self.classicLight,
            Self.defaultDark,
            Self.defaultLight,
            Self.dusk,
            Self.highContrastDark,
            Self.highContrastLight,
            Self.lowKey,
            Self.midnight,
            Self.presentationDark,
            Self.presentationLight,
            Self.presentationLargeDark,
            Self.presentationLargeLight,
            Self.printing,
            Self.spartan,
            Self.sunset,
        ]

        public static let bare = try! Theme(named: "Bare", bundle: Bundle.module)
        public static let basic = try! Theme(named: "Basic", bundle: Bundle.module)
        public static let civic = try! Theme(named: "Civic", bundle: Bundle.module)
        public static let classicDark = try! Theme(named: "Classic (Dark)", bundle: Bundle.module)
        public static let classicLight = try! Theme(named: "Classic (Light)", bundle: Bundle.module)
        public static let defaultDark = try! Theme(named: "Default (Dark)", bundle: Bundle.module)
        public static let defaultLight = try! Theme(named: "Default (Light)", bundle: Bundle.module)
        public static let dusk = try! Theme(named: "Dusk", bundle: Bundle.module)
        public static let highContrastDark = try! Theme(named: "High Contrast (Dark)", bundle: Bundle.module)
        public static let highContrastLight = try! Theme(named: "High Contrast (Light)", bundle: Bundle.module)
        public static let lowKey = try! Theme(named: "Low Key", bundle: Bundle.module)
        public static let midnight = try! Theme(named: "Midnight", bundle: Bundle.module)
        public static let presentationDark = try! Theme(named: "Presentation (Dark)", bundle: Bundle.module)
        public static let presentationLight = try! Theme(named: "Presentation (Light)", bundle: Bundle.module)
        public static let presentationLargeDark = try! Theme(named: "Presentation Large (Dark)", bundle: Bundle.module)
        public static let presentationLargeLight = try! Theme(named: "Presentation Large (Light)", bundle: Bundle.module)
        public static let printing = try! Theme(named: "Printing", bundle: Bundle.module)
        public static let spartan = try! Theme(named: "Spartan", bundle: Bundle.module)
        public static let sunset = try! Theme(named: "Sunset", bundle: Bundle.module)
    }
}

public struct XCColorTheme: Decodable {
    enum CodingKeys: String, CodingKey {
        case sourceTextBackground = "DVTSourceTextBackground"
        case sourceTextBlockDimBackgroundColor = "DVTSourceTextBlockDimBackgroundColor"
        case sourceTextCurrentLineHighlightColor = "DVTSourceTextCurrentLineHighlightColor"
        case sourceTextInsertionPointColor = "DVTSourceTextInsertionPointColor"
        case sourceTextInvisiblesColor = "DVTSourceTextInvisiblesColor"
        case sourceTextSelectionColor = "DVTSourceTextSelectionColor"
        case sourceTextSyntaxColors = "DVTSourceTextSyntaxColors"
        case sourceTextSyntaxFonts = "DVTSourceTextSyntaxFonts"
    }

    let sourceTextBackground: NSColor?
    let sourceTextBlockDimBackgroundColor: NSColor?
    let sourceTextCurrentLineHighlightColor: NSColor?
    let sourceTextInsertionPointColor: NSColor?
    let sourceTextInvisiblesColor: NSColor?
    let sourceTextSelectionColor: NSColor?
    let sourceTextSyntaxColors: [String: NSColor]
    let sourceTextSyntaxFonts: [String: NSFont]

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        sourceTextBackground = try container.decodeIfPresent(String.self, forKey: .sourceTextBackground).map(stringToColor)
        sourceTextBlockDimBackgroundColor = try container.decodeIfPresent(String.self, forKey: .sourceTextBlockDimBackgroundColor).map(stringToColor)
        sourceTextCurrentLineHighlightColor = try container.decodeIfPresent(String.self, forKey: .sourceTextCurrentLineHighlightColor).map(stringToColor)
        sourceTextInsertionPointColor = try container.decodeIfPresent(String.self, forKey: .sourceTextInsertionPointColor).map(stringToColor)
        sourceTextInvisiblesColor = try container.decodeIfPresent(String.self, forKey: .sourceTextInvisiblesColor).map(stringToColor)
        sourceTextSelectionColor = try container.decodeIfPresent(String.self, forKey: .sourceTextSelectionColor).map(stringToColor)
        sourceTextSyntaxColors = (try container.decodeIfPresent([String: String].self, forKey: .sourceTextSyntaxColors) ?? [:]).mapValues(stringToColor)
        sourceTextSyntaxFonts = (try container.decodeIfPresent([String: String].self, forKey: .sourceTextSyntaxFonts) ?? [:]).mapValues(stringToFont)
    }
}

// MARK: Utilities

private func stringToColor(_ string: String) -> NSColor {
    let channels = string.split(separator: " ").map { Double($0)! }
    return NSColor(deviceRed: channels[0], green: channels[1], blue: channels[2], alpha: channels[3])
}

private func stringToFont(_ string: String) -> NSFont {
    let expression = Regex {
        Anchor.startOfLine
        Capture {
            OneOrMore(.any)
        }
        " - "
        Capture {
            OneOrMore(
                ChoiceOf {
                    One(.digit)
                    "."
                })
        }
        Anchor.endOfLine
    }
    guard let match = string.firstMatch(of: expression) else {
        fatalError()
    }
    let fontName = String(match.1)
    let fontSize = Double(match.2)!
    guard let font = NSFont(name: fontName, size: fontSize) else {
        return NSFont(name: "Menlo-Regular", size: fontSize)!
    }
    return font
}
