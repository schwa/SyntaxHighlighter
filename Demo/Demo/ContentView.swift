import SwiftTreeSitter
import SwiftUI
import SyntaxHighlighter
import UniformTypeIdentifiers

struct ContentView: View {
    @State
    var source = Source(type: .cPlusPlusSource, text: "", selection: [])

    @State
    var theme: Theme? = Theme.BuiltIn.defaultLight

    @State
    var type: UTType = .cPlusPlusSource

    var body: some View {
        VStack {
            SyntaxEditorView(source: $source, theme: theme!)
        }
        .toolbar {
            LoadButton(allowedContentTypes: [.cPlusPlusHeader, UTType(filenameExtension: "metal")!, .swiftSource]) { result in
                if case let .success(url) = result {
                    self.source.text = try! String(contentsOf: url)
                    self.source.type = UTType(filenameExtension: url.pathExtension)!
                }
            }
            Menu("Examples") {
                Button("Swift") {
                    self.source.text = #"""
                        import Foundation

                        @main
                        struct Demo {
                            static func main() async throws {
                                print("hello world"
                            }
                        }
                        """#
                    self.source.type = .swiftSource
                }

            }
            Picker("Theme", selection: $theme) {
                ForEach(Theme.BuiltIn.allCases, id: \.self) {
                    Text($0.name).tag(Optional($0))
                }
            }
        }
        .onAppear {
            self.source.text = #"""
                #include <stdio.h>

                int main(int argc, char **argv) {
                    printf("Hello world\n");
                }
                """#
            self.type = .cPlusPlusSource
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
