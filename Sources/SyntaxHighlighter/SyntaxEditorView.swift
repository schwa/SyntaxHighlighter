#if os(macOS)
    import SwiftUI
    // import Everything
    import UniformTypeIdentifiers

    public struct SyntaxEditorView: View {
        class Model: NSObject, ObservableObject, NSTextStorageDelegate, NSTextViewDelegate {

            var syntaxHighlighter: SyntaxHighlighter?
            var theme = Theme.BuiltIn.defaultLight

            var textDidChange: ((String) -> Void)?
            var selectionDidChange: (([Range<String.Index>]) -> Void)?

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

        @Binding
        public var text: String

        @Binding
        public var selection: [Range<String.Index>]

        @StateObject
        var model = Model()

        let type: UTType
        let theme: Theme

        public init(text: Binding<String>, selection: Binding<[Range<String.Index>]>, type: UTType, theme: Theme) {
            _text = text
            _selection = selection
            self.type = type
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
                textView.textStorage!.delegate = model
                textView.delegate = model
                scrollView.documentView = textView
                return scrollView
            } update: { view in
                guard let scrollView = view as? NSScrollView, let textView = scrollView.documentView as? NSTextView else {
                    fatalError()
                }
                model.textDidChange = { text in
                    Task {
                        if self.text != text {
                            self.text = text
                        }
                    }
                }
                model.syntaxHighlighter = SyntaxHighlighter(type: type)
                model.theme = theme
                if textView.string != text {
                    textView.string = text
                    try! model.syntaxHighlighter?.highlight(text, highlighted: textView.textStorage!, theme: theme)
                }
            }
        }
    }
#endif
