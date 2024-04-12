//
//  DSKitExtension.swift
//  DSKit
//
//  Created by Borinschi Ivan on 12/5/16.
//  Copyright © 2016 Borinschi Ivan. All rights reserved.
//

import UIKit

public extension DSCollectionView {
    
    /// Should or not adjust table content offset when keyboard appears on screen
    ///
    /// - Parameter should: Bool
    func adjustContentInsetsForKeyboard(_ should: Bool) {
        
        if should {
            addKeyboardObservers()
        } else {
            removeKeyboardObservers()
        }
    }
    
    /// Add observers
    func addKeyboardObservers() {
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillShow),
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: nil)
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillHide),
                                               name: UIResponder.keyboardWillHideNotification,
                                               object: nil)
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardDidChangeFrame),
                                               name: UIResponder.keyboardDidChangeFrameNotification,
                                               object: nil)
    }
    
    /// Remove keyboard notifications observers
    func removeKeyboardObservers() {
        NotificationCenter.default.removeObserver(self)
    }
    
    /// Keyboard will show notification
    ///
    /// - Parameter notification: Notification
    @objc func keyboardWillShow(_ notification: Notification) {
        
        if isKeyboardOnScreen == false {
            storedContentInset = self.view.contentInset
            isKeyboardOnScreen = true
            adjustScroll(for: notification)
        }
    }
    
    /// Keyboard will hide notification
    ///
    /// - Parameter notification: Notification
    @objc func keyboardWillHide(_ notification: Notification) {
        
        isKeyboardOnScreen = false
        adjustScroll(for: notification)
    }
    
    /// Keyboard will hide notification
    ///
    /// - Parameter notification: Notification
    @objc func keyboardDidChangeFrame(_ notification: Notification) {
        adjustScroll(for: notification)
    }
    
    /// Adjust scroll for notification
    ///
    /// - Parameter notification: Notification
    func adjustScroll(for notification: Notification) {
        
        if let frameAndDuration = self.frameAndDuration(for: notification) {
            
            let frame = frameAndDuration.frame
            let duration = frameAndDuration.duration
            let newTableInsets = insets(for: frame)            
            
            // Delay is important here
            DispatchQueue.main.after(0.1) {
                UIView.animate(withDuration: duration, animations: {
                    self.view.contentInset = newTableInsets
                    self.view.scrollIndicatorInsets = newTableInsets
                })
            }
        }
    }
    
    /// Get keyboard frame and animation duration from notification
    ///
    /// - Parameter notification: Notification
    /// - Returns: (frame: CGRect, duration: Double)?
    func frameAndDuration(for notification: Notification) -> (frame: CGRect, duration: Double)? {
        
        guard let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect,
              let duration = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double else {
            return nil
        }
        
        return (frame: keyboardFrame, duration: duration)
    }
    
    /// Get UIEdgeInsets for keyboardFrame
    ///
    /// - Parameter keyboardFrame: CGRect
    /// - Returns: UIEdgeInsets
    func insets(for keyboardFrame: CGRect) -> UIEdgeInsets {
        
        if isKeyboardOnScreen {
            
            guard let view = self.superview,
                  let mainWindowView = mainWindowView() else {
                return self.view.contentInset
            }
            
            let tableFrame = self.view.frame
            let convertedTableFrame = view.convert(tableFrame, to: view)
            let inset = keyboardFrame.intersection(convertedTableFrame).height
            let currentTableInsets = self.view.contentInset
            let topMargin = view.frame.size.height - (self.frame.size.height + self.frame.origin.y)
            let difference = mainWindowView.frame.size.height - self.frame.size.height - topMargin
            
            var bottomSafeArea: CGFloat = 0
            
            if #available(iOS 11.0, *) {
                if let bottom = superview?.safeAreaInsets.bottom {
                    bottomSafeArea = bottom
                }
            }
            
            let insets = UIEdgeInsets(top: currentTableInsets.top,
                                      left: currentTableInsets.left,
                                      bottom: (inset + difference - bottomSafeArea) + DSAppearance.shared.main.margins,
                                      right: currentTableInsets.right)
            return insets
            
        } else {
            
            if let storedContentInset = self.storedContentInset {
                return storedContentInset
            }
            
            return self.view.contentInset
        }
    }
    
    /// Get top view from window
    ///
    /// - Returns: most top view from window
    func mainWindowView() -> UIView? {
        
        guard let controller = UIApplication.shared.getKeyWindow()?.rootViewController else {
            return nil
        }
        
        guard (controller.navigationController != nil) else {
            return controller.view
        }
        
        return controller.navigationController?.view
    }
}

extension DSCollectionView {
    
    /// Hide keyboard when user scrolls to bottom of table
    @objc func hideKeyboardWhenHitBottom() {
        
        scrollViewDidScrollForKeyboard = { [weak self] scrollView in
            guard let _self = self else {
                return
            }
            let bottom = scrollView.contentSize.height - scrollView.contentOffset.y - scrollView.frame.size.height + scrollView.contentInset.bottom
            if bottom < -80 {
                _self.hideKeyboard()
            }
        }
    }
    
    /// Helper used when we need forced keyboard closing
    @objc func hideKeyboard() {
        self.view.endEditing(true)
    }
}

extension DSCollectionView: UIGestureRecognizerDelegate {
    
    /// Hide keyboard
    /// - Parameter cancelsTouchesInView: Bool
    func hideKeyboardWhenTappedAround(cancelsTouchesInView: Bool = false) {
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
        tap.cancelsTouchesInView = cancelsTouchesInView
        tap.delegate = self
        self.addGestureRecognizer(tap)
    }
    
    /// Gesture recognizer
    /// - Parameters:
    ///   - gestureRecognizer: UIGestureRecognizer
    ///   - touch: UITouch
    /// - Returns: Bool
    public func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer,
                                  shouldReceive touch: UITouch) -> Bool {

        if touch.view is UIButton {
            return false
        }

        return true
    }
    
    /// Hide keyboard when swipe up or down
    /// - Parameter cancelsTouchesInView: Bool
    func hideKeyboardWhenSwipeUpDown(cancelsTouchesInView: Bool = false) {
        
        let swipeUp: UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
        swipeUp.direction = .up
        
        let swipeDown: UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
        swipeDown.direction = .down
        
        swipeDown.cancelsTouchesInView = cancelsTouchesInView
        swipeUp.cancelsTouchesInView = cancelsTouchesInView
        
        self.addGestureRecognizer(swipeUp)
        self.addGestureRecognizer(swipeDown)
    }
    
    /// Dismiss keyboard
    @objc public func dismissKeyboard() {
        self.endEditing(true)
    }
}


public extension DSCollectionView {
    
    
    func scrollToBottom(animated: Bool) {
        
        //        if let lastSection = self.content.last,
        //           let lastSource = lastSection.allSources().last {
        //            scrollToCell(source: lastSource, at: .bottom, animated: animated)
        //        }
    }
}
