import SwiftTreeSitter
import SwiftUI
import SyntaxHighlighter
import UniformTypeIdentifiers

struct ContentView: View {
    @State
    var text: String = #"""
    #include <stdio.h>

    int main(int argc, char **argv) {
        printf("Hello world\n");
    }
    """#

    @State
    var schemeName: String = "Default (Light)"

    var body: some View {
        LoadButton(allowedContentTypes: [.cPlusPlusHeader, UTType(filenameExtension: "metal")!]) { result in
            if case let .success(url) = result {
                self.text = try! String(contentsOf: url)
            }
        }
        Picker("Theme", selection: $schemeName) {
            ForEach(Theme.BuiltIn.allCases.map(\.name), id: \.self) {
                Text($0)
            }
        }
        .padding()
        SyntaxEditorView(text: $text)
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
