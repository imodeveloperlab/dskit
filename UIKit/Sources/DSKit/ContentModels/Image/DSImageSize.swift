//
//  File.swift
//  DSKit
//
//  Created by Borinschi Ivan on 21.01.2021.
//  Copyright © 2021 Borinschi Ivan. All rights reserved.
//

import UIKit
import Cartography

public enum DSImageSize: Equatable, Hashable {
    
    case size(CGSize)
    case unknown
    
    public var rawValue: String {
        switch self {
        case .size(let size):
            return "ImageSize_\(size.width)x\(size.height)"
        case .unknown:
            return "UnknownSize"
        }
    }
    
    var width: CGFloat? {
        switch self {
        case .size(let size):
            return size.width
        case .unknown:
            return nil
        }
    }
    
    var height: CGFloat? {
        switch self {
        case .size(let size):
            return size.height
        case .unknown:
            return nil
        }
    }
}

extension UIImageView {
    
    func setImageSize(_ size: DSImageSize) {
        
        switch size {
        case .size(let size):
            
            constrain(self) { (imageView) in
                imageView.width == size.width
                imageView.height == size.height
            }
            
        case .unknown:
            
            constrain(self) { (imageView) in
                imageView.width >= 0
                imageView.height >= 0
            }
        }
    }
}
