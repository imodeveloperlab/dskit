//
//  DSReusableCollectionSupplementaryView.swift
//  DSKit
//
//  Created by Borinschi Ivan on 10.12.2020.
//  Copyright © 2021 Borinschi Ivan. All rights reserved.
//
//

import UIKit
import Cartography

class DSReusableCollectionSupplementaryView: UICollectionReusableView {
    
    var reusableView: DSReusableUIView?
    let constraintGroup = ConstraintGroup()
    var viewModel: DSViewModel?
    var section: DSSection?
    
    /// This method is called every time collection view will display a reusable copy of ReusableCollectionViewCell
    /// - Parameter source: ReusableCollectionViewCellSource
    public func setUpWith(viewModel: DSViewModel, section: DSSection, kind: String) {
        
        self.viewModel = viewModel
        self.section = section
        
        // If reusableView is nil then we will add
        // new view to the reusable collection view cell
        if reusableView == nil {
            reusableView = viewModel.viewRepresentation()
            self.addCustomSubview(view: reusableView?.view, group: constraintGroup)
        }
        
        // Set view style
        setReusableViewStyle(model: viewModel)
        
        // Insets
        let insets = viewModel.style.displayStyle.supplementaryViewInsets(section: section, kind: kind)
        updateUIEdgeInsets(view: reusableView?.view, insets: insets, group: constraintGroup)
        
        reusableView?.setUpWith(viewModel: viewModel)
    }
    
    /// This method is called each time this reusable supplementary view is prepared to be displayed on screen
    /// here we calculate the view width and height
    /// - Parameter layoutAttributes: UICollectionViewLayoutAttributes
    /// - Returns: UICollectionViewLayoutAttributes
    override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
        
        if let model = self.viewModel, let section = self.section {
            
            // If we already have calculated height, then update UICollectionViewLayoutAttributes
            // and return it, else update view layout and return new UICollectionViewLayoutAttributes
            if let heightForHash = DSReusableCollectionViewsHeightManager.shared.heightFor(viewModel: model, in: section) {
                
                var newFrame = layoutAttributes.frame
                newFrame.size.height = heightForHash
                layoutAttributes.frame = newFrame
                return layoutAttributes
                
            } else {
                
                let layoutAttributes = update(layoutAttributes)
                let height = layoutAttributes.frame.size.height
                DSReusableCollectionViewsHeightManager.shared.setFor(height: height, viewModel: model, in: section)
                return layoutAttributes
            }
        }
        
        return update(layoutAttributes)
    }
}
