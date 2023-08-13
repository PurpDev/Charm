import SwiftUI

/// A simple struct representing a charm.
///
/// A charm contains a text string.
public struct Charm {
    /// The text stored in the charm.
    public private(set) var text = "Hello, World!"

    /// Creates a new Charm instance.
    public init() {
    }
}

/// A ViewModifier that adds a sparkling animation to the content.
public struct Sparkle: ViewModifier {
    /// Controls the animation state.
    @State public var isAnimating = false
    
    public func body(content: Content) -> some View {
        content
            .overlay(
                ZStack {
                    ForEach(0..<10) { i in
                        Circle()
                            .fill(Color.white)
                            .frame(width: 5, height: 5)
                            .offset(x: CGFloat.random(in: -50...50), y: CGFloat.random(in: -50...50))
                            .opacity(isAnimating ? 0 : 1)
                            .animation(Animation.easeInOut(duration: 1).repeatForever().delay(Double(i) / 10))
                    }
                }
            )
            .onAppear {
                isAnimating = true
            }
    }
}

extension View {
    /// Applies the Sparkle animation to the view.
    ///
    /// Use this modifier to add a sparkling animation to the content of the view.
    public func sparkle() -> some View {
        modifier(Sparkle())
    }
}
