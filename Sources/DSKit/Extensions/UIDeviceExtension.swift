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
        case iPhone5_SE
        case iPhone6_7_8_SE2
        case iPhone6Plus_7Plus_8Plus
        case iPhoneX_XS_11Pro
        case iPhoneXR_11
        case iPhoneXSMax_11ProMax
        case iPhone12_12Pro_13_13Pro
        case iPhone12ProMax_13ProMax
        case iPhone12Mini_13Mini
        case unknown
    }
    
    /// Return a screen type of the iphone.
    var screenType: ScreenType {
        guard iPhone else { return .unknown }
        switch UIScreen.main.nativeBounds.height {
        case 960:  return .iPhone4
        case 1136: return .iPhone5_SE
        case 1334: return .iPhone6_7_8_SE2
        case 2208, 1920: return .iPhone6Plus_7Plus_8Plus
        case 2436: return .iPhoneX_XS_11Pro
        case 2688: return .iPhoneXSMax_11ProMax
        case 1792: return .iPhoneXR_11
        case 2532: return .iPhone12_12Pro_13_13Pro
        case 2778: return .iPhone12ProMax_13ProMax
        case 2340: return .iPhone12Mini_13Mini
        default:   return .unknown
        }
    }
    
    /// Tell if it is small device(iPhone4, iPhone5) or no.
    var isSmallDevice: Bool {
        switch self.screenType {
        case .iPhone4, .iPhone5_SE: return true
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
        case .iPhone5_SE: return true
        default: return false
        }
    }
    
    var isIPhoneX: Bool {
        switch self.screenType {
        case .iPhoneX_XS_11Pro: return true
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
        case .iPhone6Plus_7Plus_8Plus: return true
        default: return false
        }
    }
    
    /// Tell if it is small device(iPhone4, iPhone5) or no.
    var isMediumDevice: Bool {
        switch self.screenType {
        case .iPhone6_7_8_SE2: return true
        default: return false
        }
    }
    
    var isMaxDevice: Bool {
        switch self.screenType {
        case .iPhoneXSMax_11ProMax,
             .iPhone12ProMax_13ProMax:
            return true
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
