//
//  DSImageDisplayStyle.swift
//  DSKit
//
//  Created by Borinschi Ivan on 21.01.2021.
//  Copyright © 2021 Borinschi Ivan. All rights reserved.
//

import UIKit

public enum DSImageDisplayStyle: Equatable, Hashable {
    
    case `default`
    case circle
    case themeCornerRadius
    
    public var rawValue: String {
        switch self {
        case .default:
            return "DisplayStyleDefault"
        case .circle:
            return "DisplayStyleCircle"
        case .themeCornerRadius:
            return "DesignableViewColors"
        }
    }
}

extension UIImageView {
    
    func setImageDisplayStyle(_ style: DSImageDisplayStyle,
                              size: DSImageSize,
                              cornerRadius: CGFloat) {
        
        self.clipsToBounds = true
        
        switch style {
        case .default:
            self.layer.cornerRadius = 0
        case .circle:
            
            switch size {
            case .size(let size):
                self.layer.cornerRadius = size.width / 2
            case .unknown:
                
                self.layer.cornerRadius = self.bounds.width / 2
                
                DispatchQueue.main.after(0.001) {
                    self.layer.cornerRadius = self.bounds.width / 2
                }
                
                DispatchQueue.main.after(0.1) {
                    self.layer.cornerRadius = self.bounds.width / 2
                }
            }
            
        case .themeCornerRadius:
            self.layer.cornerRadius = cornerRadius
        }
    }
}
