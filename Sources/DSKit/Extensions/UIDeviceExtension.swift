//
//  UIDeviceExtension.swift
//  DSKit
//
//  Created by Borinschi Ivan on 30.11.2020.
//  Copyright © 2021 Borinschi Ivan. All rights reserved.
//

import UIKit

public extension UIDevice {
    
    /// Tell if current device is an iphone or not.
    var iPhone: Bool { return UIDevice.current.userInterfaceIdiom == .phone }
    
    enum ScreenType: String {
        case iPhone4
        case iPhone5
        case iPhone6
        case iPhone6Plus
        case iPhoneX
        case iPhoneXR_11
        case unknown
    }
    
    /// Return a screen type of the iphone.
    var screenType: ScreenType {
        guard iPhone else { return .unknown }
        switch UIScreen.main.nativeBounds.height {
        case 960:  return .iPhone4
        case 1136: return .iPhone5
        case 1334: return .iPhone6
        case 2208, 1920: return .iPhone6Plus
        case 2436: return .iPhoneX
        case 1792: return .iPhoneXR_11
        default:   return .unknown
        }
    }
    
    /// Tell if it is small device(iPhone4, iPhone5) or no.
    var isSmallDevice: Bool {
        switch self.screenType {
        case .iPhone4, .iPhone5: return true
        default: return false
        }
    }
    
    var isIPhone4: Bool {
        switch self.screenType {
        case .iPhone4: return true
        default: return false
        }
    }
    
    var isIPhone5: Bool {
        switch self.screenType {
        case .iPhone5: return true
        default: return false
        }
    }
    
    var isIPhoneX: Bool {
        switch self.screenType {
        case .iPhoneX: return true
        default: return false
        }
    }
    
    var iPhoneXR_11: Bool {
        switch self.screenType {
        case .iPhoneXR_11: return true
        default: return false
        }
    }
    
    var isIPhonePlus: Bool {
        switch self.screenType {
        case .iPhone6Plus: return true
        default: return false
        }
    }
    
    /// Tell if it is small device(iPhone4, iPhone5) or no.
    var isMediumDevice: Bool {
        switch self.screenType {
        case .iPhone6: return true
        default: return false
        }
    }
    
}

public extension UIDevice {
    
    var containsSafeArea: Bool {
        if (UIApplication.shared.getKeyWindow()?.safeAreaInsets.bottom ?? 0) > 0 {
            return true
        }
        return false
    }
    
    var contentAreaHeigh: CGFloat {
        
        let window = UIApplication.shared.windows[0]
        let topPadding = window.safeAreaInsets.top
        let bottomPadding = window.safeAreaInsets.bottom
        
        let area = window.bounds.height - topPadding - bottomPadding
        return area
    }
}
