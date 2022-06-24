//
//  DSViewController+DecorationIcon.swift
//  DSKit
//
//  Created by Borinschi Ivan on 06.03.2021.
//  Copyright © 2021 Borinschi Ivan. All rights reserved.
//

import UIKit
import Cartography

public struct DSDecorationIcon {
    
    internal init(name: String? = nil,
                  position: DSDecorationIconPosition = .topRight,
                  size: CGSize = CGSize(width: 50, height: 50),
                  offset: CGPoint = CGPoint(x: 0, y: 0),
                  alpha: CGFloat = 1.0,
                  color: UIColor = .blue) {
        
        self.name = name
        self.position = position
        self.size = size
        self.offset = offset
        self.color = color
    }
    
    public init(name: String,
                  position: DSDecorationIconPosition,
                  size: CGSize,
                  offset: CGPoint,
                  alpha: CGFloat = 1.0,
                  color: UIColor) {
        
        self.name = name
        self.position = position
        self.size = size
        self.offset = offset
        self.alpha = alpha
        self.color = color
    }
    
    var name: String? = nil
    var position: DSDecorationIconPosition = .topRight
    var size: CGSize = CGSize(width: 50, height: 50)
    var offset: CGPoint = CGPoint(x: 0, y: 0)
    var alpha: CGFloat = 1.0
    var color: UIColor
}

public enum DSDecorationIconPosition {
    case topLeft
    case topRight
}

extension DSViewController {
    
    func updateDecorationIconView() {
        
        decorationIconView?.removeFromSuperview()
        decorationIconView = nil
        
        guard let decorationIconName = decorationIcon.name else {
            return
        }
        
        self.decorationIconView = UIImageView(image: UIImage.symbolImage(with: decorationIconName))
        self.decorationIconView?.tintColor = decorationIcon.color
        self.decorationIconView?.alpha = decorationIcon.alpha
        self.decorationIconView?.contentMode = .scaleAspectFit
        
        guard let decorationIconView = self.decorationIconView else {
            return
        }
        
        self.view.insertSubview(decorationIconView, belowSubview: collectionView)
        
        let offset = decorationIcon.offset
        let size = decorationIcon.size
        
        constrain(decorationIconView, self.view) { icon, view in
            
            icon.width == size.width
            icon.height == size.height
            
            switch decorationIcon.position {
            case .topLeft:
                icon.left == view.left + offset.x
                icon.top == view.top + offset.y
            case .topRight:
                icon.right == view.right + offset.x
                icon.top == view.top + offset.y
            }
        }
    }
}
