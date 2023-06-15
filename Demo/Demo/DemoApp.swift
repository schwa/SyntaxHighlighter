//
//  DemoApp.swift
//  Demo
//
//  Created by Jonathan Wight on 6/13/23.
//

import SwiftUI
import SyntaxHighlighter

@main
struct DemoApp: App {

    @FocusedBinding(\.selectedSource)
    private var selectedSource

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .commands {
            CommandGroup(after: .textEditing) {
                Button("Shift Left") {
                    selectedSource?.shiftLeft()
                }
                .keyboardShortcut(KeyEquivalent("["), modifiers: .command)
                Button("Shift Right") {
                    selectedSource?.shiftRight()
                }
                .keyboardShortcut(KeyEquivalent("]"), modifiers: .command)
            }
        }
    }
}
