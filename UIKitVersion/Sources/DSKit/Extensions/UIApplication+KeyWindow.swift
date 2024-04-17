//
//  UIApplication+KeyWindow.swift
//  DSKit
//
//  Created by Borinschi Ivan on 29.01.2021.
//  Copyright © 2021 Borinschi Ivan. All rights reserved.
//

import UIKit

public extension UIApplication {
    
    func getKeyWindow() -> UIWindow? {
        
        UIApplication.shared.connectedScenes
                .filter({$0.activationState == .foregroundActive})
                .map({$0 as? UIWindowScene})
                .compactMap({$0})
                .first?.windows
                .filter({$0.isKeyWindow}).first
    }
    
    var isRTL: Bool {
        UIApplication.shared.getKeyWindow()?.effectiveUserInterfaceLayoutDirection == .rightToLeft
    }
}
