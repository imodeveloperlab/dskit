//
//  NotificationExtension.swift
//  DSKit
//
//  Created by Borinschi Ivan on 30.11.2020.
//  Copyright © 2021 Borinschi Ivan. All rights reserved.
//

import UIKit

public extension Notification {
    
    /// Get keyboard final frame and animation duration
    /// - Returns: frame: CGRect, duration: Double)
    func frameAndDuration() -> (frame: CGRect, duration: Double)? {
        
        guard let keyboardFrame = userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect,
            let duration = userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double else {
                return nil
        }
        
        return (frame: keyboardFrame, duration: duration)
    }
}
