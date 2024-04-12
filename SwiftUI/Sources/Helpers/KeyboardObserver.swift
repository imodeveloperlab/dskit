//
//  KeyboardObserver.swift
//  DSKit
//
//  Created by Ivan Borinschi on 08.02.2023.
//

import SwiftUI
import Combine

public final class KeyboardObserver: ObservableObject {
    
    public static let shared = KeyboardObserver()
    
    @Published public var height: CGFloat = 0
    @Published public var isDisplayed: Bool = false
    @Published public var animationDuration: TimeInterval = 0.25
    @Published public var animationCurve: Animation = .easeInOut
    
    private var cancellables = Set<AnyCancellable>()
    private var debounceTimer: Timer?

    public init() {
        // Listen for keyboard will show notification
        NotificationCenter.default.publisher(for: UIResponder.keyboardWillShowNotification)
            .sink { [weak self] notification in
                guard let self = self else { return }
                let height = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue.height ?? 0
                let duration = (notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? NSNumber)?.doubleValue ?? 0.25
                let curveValue = (notification.userInfo?[UIResponder.keyboardAnimationCurveUserInfoKey] as? NSNumber)?.intValue ?? UIView.AnimationCurve.easeInOut.rawValue
                let curve = self.mapCurveToAnimation(curveValue: curveValue)
                self.updateKeyboardState(height: height, duration: duration, curve: curve)
            }
            .store(in: &cancellables)

        // Listen for keyboard will hide notification
        NotificationCenter.default.publisher(for: UIResponder.keyboardWillHideNotification)
            .sink { [weak self] notification in
                guard let self = self else { return }
                let duration = (notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? NSNumber)?.doubleValue ?? 0.25
                self.updateKeyboardState(height: 0, duration: duration, curve: .easeInOut)
            }
            .store(in: &cancellables)
    }
    
    private func mapCurveToAnimation(curveValue: Int) -> Animation {
        guard let curve = UIView.AnimationCurve(rawValue: curveValue) else { return .easeInOut }
        switch curve {
        case .easeIn:
            return .easeIn(duration: animationDuration)
        case .easeOut:
            return .easeOut(duration: animationDuration)
        case .easeInOut:
            return .easeInOut(duration: animationDuration)
        case .linear:
            return .linear(duration: animationDuration)
        @unknown default:
            return .easeInOut(duration: animationDuration)
        }
    }
    
    private func updateKeyboardState(height: CGFloat, duration: TimeInterval, curve: Animation) {
        withAnimation(curve) {
            self.height = height
            self.isDisplayed = height > 0
            self.animationDuration = duration
            self.animationCurve = curve
        }
    }
}
