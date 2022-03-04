#if os(macOS)
    import SwiftUI
    // import Everything

    public struct SyntaxEditorView: View {
        class Model: NSObject, ObservableObject, NSTextStorageDelegate, NSTextViewDelegate {
            @Published
            var text: String = ""

            var updateText: ((String) -> Void)?
            var update: Bool = true
            var syntaxHighlighter = try! SyntaxHighlighter()

            func textStorage(_ textStorage: NSTextStorage, didProcessEditing _: NSTextStorageEditActions, range _: NSRange, changeInLength _: Int) {
                if update {
                    try! syntaxHighlighter.highlight(textStorage.string, highlighted: textStorage)
                    updateText?(textStorage.string)
                }
            }

            func textView(_: NSTextView, willChangeSelectionFromCharacterRange _: NSRange, toCharacterRange newSelectedCharRange: NSRange) -> NSRange {
                newSelectedCharRange
            }
        }

        @Binding
        public var text: String

        @StateObject
        var model = Model()

        public init(text: Binding<String>, highlighter: SyntaxHighlighter? = nil) {
            _text = text
            if let highlighter {
                model.syntaxHighlighter = highlighter
            }
        }

        public var body: some View {
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

                textView.string = text

                model.updateText = {
                    self.text = $0
                }

                return scrollView
            } update: { view in
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
