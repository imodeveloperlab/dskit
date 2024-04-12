//
//  UIButton+EdgeInsets.swift
//  
//
//  Created by Zalan Mergl on 2022. 06. 10..
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
    
    func moveImageEdgeInset(by delta: CGFloat) {
        imageEdgeInsets = UIEdgeInsets(top: 0, left: delta, bottom: 0, right: -delta)
    }
    
    func moveTitleEdgeInset(by delta: CGFloat) {
        titleEdgeInsets = UIEdgeInsets(top: 0, left: delta, bottom: 0, right: -delta)
    }
}
