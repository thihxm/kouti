//
//  AnimationTest.swift
//  Kouti
//
//  Created by Marco Zulian on 29/06/21.
//
import SwiftUI
import Foundation


struct AnimationTest: View {

    @State private var introTextOpacity = 1.0
    @State private var monsterOpacity = 0.0
    @State private var spinSpeed = 1.0
    @Binding var spinX: Bool
    @Binding var done: Bool
    let monster: Int
    let rotation = 720.0

    var body: some View {
        VStack {
            ZStack {
                Text("?")
                    .font(.system(size: 144, weight: .bold, design: .rounded))
                    .foregroundColor(Color("dark3"))
                    .background(
                        Circle()
                            .fill(Color("grayAddButton"))
                            .frame(width: 190, height: 190)
                    )
                    .opacity(introTextOpacity)
                    .rotation3DEffect(
                        .degrees(spinX ? rotation * spinSpeed : 1),
                        axis: (x: 0, y: spinX ? 1 : 0, z: 0)
                    )
                    .onAnimationCompleted(for: spinSpeed) {
                        introTextOpacity = 0.0
                    }
                Image("monster#\(monster)")
                    .opacity(monsterOpacity)
                    .onAnimationCompleted(for: spinSpeed) {
                        withAnimation(.easeIn(duration: 0.05)) {
                            monsterOpacity = 1.0
                        }
                        delayCompleteness()
                    }
            }
        }.onChange(of: spinX, perform: { _ in
            withAnimation(.easeIn(duration: 2)) {
                spinSpeed = 5
            }
        })
    }
    
    private func delayCompleteness() {
        // Delay of 2 seconds
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            done = true
        }
    }
}

/// An animatable modifier that is used for observing animations for a given animatable value.
struct AnimationCompletionObserverModifier<Value>: AnimatableModifier where Value: VectorArithmetic {

    /// While animating, SwiftUI changes the old input value to the new target value using this property. This value is set to the old value until the animation completes.
    var animatableData: Value {
        didSet {
            notifyCompletionIfFinished()
        }
    }

    /// The target value for which we're observing. This value is directly set once the animation starts. During animation, `animatableData` will hold the oldValue and is only updated to the target value once the animation completes.
    private var targetValue: Value

    /// The completion callback which is called once the animation completes.
    private var completion: () -> Void

    init(observedValue: Value, completion: @escaping () -> Void) {
        self.completion = completion
        self.animatableData = observedValue
        targetValue = observedValue
    }

    /// Verifies whether the current animation is finished and calls the completion callback if true.
    private func notifyCompletionIfFinished() {
        guard animatableData == targetValue else { return }

        /// Dispatching is needed to take the next runloop for the completion callback.
        /// This prevents errors like "Modifying state during view update, this will cause undefined behavior."
        DispatchQueue.main.async {
            self.completion()
        }
    }

    func body(content: Content) -> some View {
        /// We're not really modifying the view so we can directly return the original input value.
        return content
    }
}

extension View {

    /// Calls the completion handler whenever an animation on the given value completes.
    /// - Parameters:
    ///   - value: The value to observe for animations.
    ///   - completion: The completion callback to call once the animation completes.
    /// - Returns: A modified `View` instance with the observer attached.
    func onAnimationCompleted<Value: VectorArithmetic>(for value: Value, completion: @escaping () -> Void) -> ModifiedContent<Self, AnimationCompletionObserverModifier<Value>> {
        return modifier(AnimationCompletionObserverModifier(observedValue: value, completion: completion))
    }
}

//struct IntroView_Previews: PreviewProvider {
//    static var previews: some View {
//        AnimationTest(monster: 2)
//    }
//}

