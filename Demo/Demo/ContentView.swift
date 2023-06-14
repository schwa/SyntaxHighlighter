import SwiftTreeSitter
import SwiftUI
import SyntaxHighlighter
import UniformTypeIdentifiers

struct ContentView: View {
    @State
    var text: String = ""

    @State
    var schemeName: String = "Default (Light)"

    @State
    var type: UTType?

    @State
    var highlighter: SyntaxHighlighter?

    var body: some View {
        VStack {
            if let highlighter {
                SyntaxEditorView(text: $text, highlighter: highlighter)
            }
        }
        .toolbar {
            LoadButton(allowedContentTypes: [.cPlusPlusHeader, UTType(filenameExtension: "metal")!, .swiftSource]) { result in
                if case let .success(url) = result {
                    self.text = try! String(contentsOf: url)
                    self.type = UTType(filenameExtension: url.pathExtension)
                }
            }
            Menu("Examples") {
                Button("Swift") {
                    self.text = #"""
                        import Foundation

                        @main
                        struct Demo {
                            static func main() async throws {
                                print("hello world"
                            }
                        }

                        """#
                    self.type = .swiftSource

                }

            }
            Picker("Theme", selection: $schemeName) {
                ForEach(Theme.BuiltIn.allCases.map(\.name), id: \.self) {
                    Text($0)
                }
            }
        }
        .onAppear {
            self.text = #"""
                #include <stdio.h>

                int main(int argc, char **argv) {
                    printf("Hello world\n");
                }
                """#
            self.type = .cPlusPlusSource
        }
        .onChange(of: type) {
            guard let type else {
                return
            }
            self.highlighter = SyntaxHighlighter(type: type)
            print(self.highlighter)
        }

    }
}

struct LoadButton: View {
    @State
    var presented = false

    let allowedContentTypes: [UTType]
    let onCompletion: (Result<URL, Error>) -> Void

    init(allowedContentTypes: [UTType], onCompletion: @escaping (Result<URL, Error>) -> Void) {
        self.allowedContentTypes = allowedContentTypes
        self.onCompletion = onCompletion
    }

    var body: some View {
        Button("Load") {
            presented = true
        }
        .fileImporter(isPresented: $presented, allowedContentTypes: allowedContentTypes, onCompletion: onCompletion)
    }
}
