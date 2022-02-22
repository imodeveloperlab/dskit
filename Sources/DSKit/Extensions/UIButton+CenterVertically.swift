//
//  ButtonExtension.swift
//  DSKit
//
//  Created by Borinschi Ivan on 13.12.2020.
//  Copyright © 2021 Borinschi Ivan. All rights reserved.
//

import UIKit

public extension UIButton {
    
    func centerVertically(padding: CGFloat = 3.0) {
        
        if  let imageViewSize = self.imageView?.frame.size,
            let titleLabelSize = self.titleLabel?.frame.size {
            
            let imageHeight: CGFloat = 30
            let totalHeight = imageHeight + titleLabelSize.height + padding
            let topMargin = (totalHeight) / 3
            
            self.imageEdgeInsets = UIEdgeInsets(
                top: -(totalHeight - imageHeight - topMargin),
                left: 0.0,
                bottom: 0.0,
                right: -titleLabelSize.width
            )
            
            self.titleEdgeInsets = UIEdgeInsets(
                top: 0.0,
                left: -imageViewSize.width,
                bottom: -(totalHeight - titleLabelSize.height + (topMargin / 2)),
                right: 0.0
            )
            
            self.contentEdgeInsets = UIEdgeInsets(
                top: 0.0,
                left: 0.0,
                bottom: titleLabelSize.height,
                right: 0.0
            )
        }
    }
}


