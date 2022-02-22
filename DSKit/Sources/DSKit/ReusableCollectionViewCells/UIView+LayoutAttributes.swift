//
//  UIView+LayoutAttributes.swift
//  DSKit
//
//  Created by Borinschi Ivan on 02.02.2021.
//  Copyright © 2021 Borinschi Ivan. All rights reserved.
//

import UIKit

extension UIView {
    
    /// Update view layout and update UICollectionViewLayoutAttributes to new height
    /// - Parameter layoutAttributes: UICollectionViewLayoutAttributes
    /// - Returns: UICollectionViewLayoutAttributes
    func update(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
        
        setNeedsLayout()
        layoutIfNeeded()
        
        let size = systemLayoutSizeFitting(layoutAttributes.size)
        var newFrame = layoutAttributes.frame
        newFrame.size.width = layoutAttributes.size.width
        newFrame.size.height = size.height
        layoutAttributes.frame = newFrame
        
        return layoutAttributes
    }
    
    /// Update view layout and update UICollectionViewLayoutAttributes to new height
    /// - Parameter layoutAttributes: UICollectionViewLayoutAttributes
    /// - Returns: UICollectionViewLayoutAttributes
    func updateEstimatedWidthAndHeight(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
        
        setNeedsLayout()
        layoutIfNeeded()
        
        let size = systemLayoutSizeFitting(CGSize(width: 10000, height: 10000))
        var newFrame = layoutAttributes.frame
        newFrame.size.width = size.width
        newFrame.size.height = size.height
        layoutAttributes.frame = newFrame
        
        return layoutAttributes
    }
    
    /// Update view layout and update UICollectionViewLayoutAttributes
    /// - Parameter layoutAttributes: UICollectionViewLayoutAttributes
    /// - Returns: UICollectionViewLayoutAttributes
    func update(_ layoutAttributes: UICollectionViewLayoutAttributes, absoluteHeight: CGFloat) -> UICollectionViewLayoutAttributes {
        
        setNeedsLayout()
        layoutIfNeeded()
        
        let size = systemLayoutSizeFitting(.init(width: .infinity, height: absoluteHeight))
        var newFrame = layoutAttributes.frame
        newFrame.size.width = size.width
        newFrame.size.height = absoluteHeight
        layoutAttributes.frame = newFrame
        
        return layoutAttributes
    }
    
    /// Update view layout and update UICollectionViewLayoutAttributes
    /// - Parameter layoutAttributes: UICollectionViewLayoutAttributes
    /// - Returns: UICollectionViewLayoutAttributes
    func update(_ layoutAttributes: UICollectionViewLayoutAttributes, absoluteWidth: CGFloat) -> UICollectionViewLayoutAttributes {
        
        setNeedsLayout()
        layoutIfNeeded()
        
        let size = systemLayoutSizeFitting(.init(width: absoluteWidth, height: .infinity))
        var newFrame = layoutAttributes.frame
        newFrame.size.height = size.height
        newFrame.size.width = absoluteWidth
        layoutAttributes.frame = newFrame
        
        return layoutAttributes
    }
}
