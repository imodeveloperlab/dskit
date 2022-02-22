//
//  BaseVCSuccessHudExtension.swift
//  DSKit
//
//  Created by Borinschi Ivan on 30.11.2020.
//  Copyright © 2021 Borinschi Ivan. All rights reserved.
//

import UIKit

public extension DSBaseViewController {
    
    func setUpMessageHud() {
        
        /// If we are at the moment in an `navigationController`
        /// then we will check if we already have an `DSMessageHUD` instance
        /// on current view, if exist we will set it as instance to `successHud`
        if let navigationController = self.navigationController {
            
            for view in navigationController.view.subviews where view.tag == messageHUDTag {
                
                guard let view = view as? DSMessageHUD else {
                    return
                }
                
                messageHud = view
            }
            
            /// If we did not have already an instance of `SuccessHUD` then we will create
            /// one on current navigation `controller view`
            if messageHud == nil {
                messageHud = DSMessageHUD(onView: navigationController.view)
            }
            
        } else {
            
            ///Init an `SuccessHUD` on current view
            messageHud = DSMessageHUD(onView: self.view)
        }
    }
    
    /// Show and message with an icon in a small popup on center of the screen
    /// usually shown to confirm some success actions, like payment, or completed task
    /// - Parameters:
    ///   - message: Short message to display
    ///   - successColor: bg color popup
    ///   - timeOut: time to display
    ///   - icon: Optional icon
    ///   - completion: Closure called when popup is closed
    func show(message: String, type: DSMessageType = .default, timeOut: Double = 1.5, icon: UIImage? = nil, completion: (() -> Void)? = nil) {
        
        if let successHud = self.messageHud {
            successHud.show(message: message,
                            type: type,
                            timeOut: timeOut,
                            icon: icon,
                            completion: completion)
        }
    }
}
