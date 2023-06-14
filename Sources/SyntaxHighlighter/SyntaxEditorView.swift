#if os(macOS)
    import SwiftUI
    // import Everything

    public struct SyntaxEditorView: View {
        class Model: NSObject, ObservableObject, NSTextStorageDelegate, NSTextViewDelegate {

            var updateText: ((String) -> Void)?
            var syntaxHighlighter: SyntaxHighlighter?

            func textStorage(_ textStorage: NSTextStorage, didProcessEditing _: NSTextStorageEditActions, range _: NSRange, changeInLength _: Int) {
                try! syntaxHighlighter?.highlight(textStorage.string, highlighted: textStorage, theme: .BuiltIn.defaultLight)
                updateText?(textStorage.string)
            }

            func textView(_: NSTextView, willChangeSelectionFromCharacterRange _: NSRange, toCharacterRange newSelectedCharRange: NSRange) -> NSRange {
                newSelectedCharRange
            }
        }

        @Binding
        public var text: String

        @StateObject
        var model = Model()

        let syntaxHighlighter: SyntaxHighlighter

        public init(text: Binding<String>, highlighter: SyntaxHighlighter) {
            _text = text
            syntaxHighlighter = highlighter
        }

        public var body: some View {
            textView
            .onChange(of: syntaxHighlighter) { syntaxHighlighter in
                model.syntaxHighlighter = syntaxHighlighter
            }
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
                textView.font = NSFont(name: "Menlo-Regular", size: 11)
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
                model.updateText = {
                    self.text = $0
                }
                model.syntaxHighlighter = syntaxHighlighter

                let view = view as! NSScrollView
                guard let textView = view.documentView as? NSTextView else {
                    fatalError()
                }
                if textView.string != text {
                    textView.string = text
                }
            }
        }
    }
#endif
