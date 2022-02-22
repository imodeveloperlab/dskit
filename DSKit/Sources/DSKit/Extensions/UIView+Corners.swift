//
//  UIView+Corners.swift
//  DSKit
//
//  Created by Borinschi Ivan on 25.01.2021.
//  Copyright © 2021 Borinschi Ivan. All rights reserved.
//

import UIKit

extension UIView {
    
    public func setTopLeftRightCorner(radius: CGFloat) {
        
        let radius: CGFloat = radius
        let path = UIBezierPath(roundedRect: self.bounds,
                                byRoundingCorners: [.topRight, .topLeft],
                                cornerRadii: CGSize(width: radius, height: radius))
        
        let maskLayer = CAShapeLayer()
        maskLayer.path = path.cgPath
        self.layer.mask = maskLayer
    }
}

public enum RoundType {
    case top
    case none
    case bottom
    case all
}

public extension UIView {
    
    func roundCorner(with type: RoundType, radius: CGFloat = 3.0, delay: Double = 0.1) {
        
        var corners: UIRectCorner
        
        switch type {
        case .top:
            corners = [.topLeft, .topRight]
        case .none:
            corners = []
        case .bottom:
            corners = [.bottomLeft, .bottomRight]
        case .all:
            corners = [.allCorners]
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
            let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
            let mask = CAShapeLayer()
            mask.path = path.cgPath
            self.layer.mask = mask
        }
    }
}
