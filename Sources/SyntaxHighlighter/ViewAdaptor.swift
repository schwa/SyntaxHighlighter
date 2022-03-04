import SwiftUI

#if os(macOS)
    import AppKit

    struct ViewAdaptor<ViewType>: View where ViewType: NSView {
        let make: () -> ViewType
        let update: (ViewType) -> Void

        init(make: @escaping () -> ViewType, update: @escaping (ViewType) -> Void) {
            self.make = make
            self.update = update
        }

        var body: some View {
            Representation(make: make, update: update)
        }

        struct Representation: NSViewRepresentable {
            let make: () -> ViewType
            let update: (ViewType) -> Void

            func makeNSView(context _: Context) -> ViewType {
                make()
            }

            func updateNSView(_ nsView: ViewType, context _: Context) {
                update(nsView)
            }
        }
    }

#elseif os(iOS)
    import UIKit

    struct ViewAdaptor<ViewType>: View where ViewType: UIView {
        let make: () -> ViewType
        let update: (ViewType) -> Void

        init(make: @escaping () -> ViewType, update: @escaping (ViewType) -> Void) {
            self.make = make
            self.update = update
        }

        public var body: some View {
            Representation(make: make, update: update)
        }

        struct Representation: UIViewRepresentable {
            let make: () -> ViewType
            let update: (ViewType) -> Void

            func makeUIView(context _: Context) -> ViewType {
                make()
            }

            func updateUIView(_ uiView: ViewType, context _: Context) {
                update(uiView)
            }
        }
    }
#endif
