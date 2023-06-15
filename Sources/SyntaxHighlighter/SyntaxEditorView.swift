#if os(macOS)
    import SwiftUI
    // import Everything
    import UniformTypeIdentifiers
    import Observation

    public struct SyntaxEditorView: View {
        @Observable
        class Model: NSObject, NSTextViewDelegate {

            var syntaxHighlighter: SyntaxHighlighter? = nil
            var theme = Theme.BuiltIn.defaultLight

            var textDidChange: ((String) -> Void)? = nil
            var selectionDidChange: (([Range<String.Index>]) -> Void)? = nil

            func textStorage(_ textStorage: NSTextStorage, didProcessEditing _: NSTextStorageEditActions, range _: NSRange, changeInLength _: Int) {
                try! syntaxHighlighter?.highlight(textStorage.string, highlighted: textStorage, theme: theme)
                textDidChange?(textStorage.string)
            }

            func textDidChange(_ notification: Notification) {
                guard let view = notification.object as? NSTextView, let textStorage = view.textStorage else {
                    return
                }
                let selectedRanges = view.selectedRanges
                try! syntaxHighlighter?.highlight(textStorage.string, highlighted: textStorage, theme: theme)
                textDidChange?(textStorage.string)
                view.selectedRanges = selectedRanges
            }

            func textViewDidChangeSelection(_ notification: Notification) {
                guard let view = notification.object as? NSTextView, let string = view.textStorage?.string else {
                    return
                }
                let selection = view.selectedRanges.compactMap {
                    Range($0.rangeValue, in: string)
                }
                selectionDidChange?(selection)
            }
        }

        private var model = Model()

        @Binding
        private var source: Source
        private let theme: Theme

        public init(source: Binding<Source>, theme: Theme) {
            _source = source
            self.theme = theme
        }

        public var body: some View {
            textView
        }

        @ViewBuilder
        var textView: some View {
            ViewAdaptor {
                let scrollView = NSScrollView()
                scrollView.borderType = .noBorder
                scrollView.hasVerticalRuler = true
                scrollView.hasHorizontalScroller = false

                let textView = NSTextView()
                textView.autoresizingMask = .width
                textView.font = NSFont.monospacedSystemFont(ofSize: 13, weight: .regular)
                textView.importsGraphics = false
                textView.isAutomaticDashSubstitutionEnabled = false
                textView.isAutomaticQuoteSubstitutionEnabled = false
                textView.isAutomaticSpellingCorrectionEnabled = false
                textView.isEditable = true
                textView.isHorizontallyResizable = false
                textView.isRichText = true
                textView.isVerticallyResizable = true
                textView.maxSize = CGSize(width: .max, height: .max)
                textView.minSize = CGSize(width: 0, height: 0)
                textView.textContainer!.widthTracksTextView = true
//                textView.textStorage!.delegate = model
                textView.delegate = model
                scrollView.documentView = textView
                return scrollView
            } update: { view in
                guard let scrollView = view as? NSScrollView, let textView = scrollView.documentView as? NSTextView else {
                    fatalError()
                }
                model.textDidChange = { text in
                    Task {
                        if self.source.text != text {
                            self.source.text = text
                        }
                    }
                }
                model.syntaxHighlighter = SyntaxHighlighter(type: source.type)
                model.theme = theme
                if textView.string != source.text {
                    textView.string = source.text
                    try! model.syntaxHighlighter?.highlight(source.text, highlighted: textView.textStorage!, theme: theme)
                }
            }
            .focusedSceneValue(\.selectedSource, $source)
        }

    }
#endif

public struct Source {
    public var type: UTType
    public var text: String
    public var selection: [Range<String.Index>]

    public init(type: UTType, text: String, selection: [Range<String.Index>]) {
        self.type = type
        self.text = text
        self.selection = selection
    }

}

struct TextEditingFocusKey: FocusedValueKey {
    typealias Value = Binding<Source>
}

public extension FocusedValues {
    var selectedSource: Binding<Source>? {
        get { self[TextEditingFocusKey.self] }
        set { self[TextEditingFocusKey.self] = newValue }
    }
}

public extension Source {
    mutating func shiftLeft() {
        text.lines = text.lineRanges.map { range in
            let line = text[range]
            if !selection.isEmpty {
                let overlaps = selection.contains { selection in
                    range.overlaps(selection)
                }
                guard overlaps else {
                    return line
                }
            }
            return line.trimmingPrefix(#/(\t|    |)/#)
        }
    }
    mutating func shiftRight() {
        text.lines = text.lineRanges.map { range in
            let line = text[range]
            if !selection.isEmpty {
                let overlaps = selection.contains { selection in
                    range.overlaps(selection)
                }
                guard overlaps else {
                    return line
                }
            }
            return "    " + line
        }
    }
}

extension String {
    var lineRanges: [Range<String.Index>] {
        var lineRanges: [Range<String.Index>] = []
        enumerateSubstrings(in: startIndex ..< endIndex, options: [.byLines]) { substring, substringRange, enclosingRange, stop in
            lineRanges.append(substringRange)
        }
        return lineRanges

    }

    var lines: [Substring] {
        get {
            return lineRanges.map { self[$0] }
        }
        set {
            self = newValue.joined(separator: "\n")
        }
    }
}
