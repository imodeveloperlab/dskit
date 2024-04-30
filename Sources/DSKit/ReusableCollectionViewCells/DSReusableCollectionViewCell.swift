//
//  ReusableCollectionViewCell.swift
//  DSKit
//
//  Created by Borinschi Ivan on 10.12.2020.
//  Copyright © 2021 Borinschi Ivan. All rights reserved.
//
//

import UIKit
import Cartography

class DSReusableCollectionViewCell: UICollectionViewCell {
    
    /// Reusable uiview
    var reusableUIView: UIView?
    
    /// Reusable view
    var reusableView: DSReusableUIView?
    
    /// Reusable view
    var bottomSideView: DSReusableUIView?
    
    /// Reusable view
    var topSideView: DSReusableUIView?
    
    /// Reusable view
    var leftSideView: DSReusableUIView?
    
    /// Reusable view
    var rightSideView: DSReusableUIView?
    
    /// Supplementary reusable views
    var supplementaryReusableViews: [DSReusableUIView]?
    
    /// Constraint group, used to update view insets for each view model if need
    let constraintGroup = ConstraintGroup()
    
    /// View model currently displayed
    var viewModel: DSViewModel?
    
    var section: DSSection?
    
    /// View index in section
    var viewIndex: Int?
    
    /// This method is called every time collection view will display a reusable copy of ReusableCollectionViewCell
    /// - Parameter source: ReusableCollectionViewCellSource
    public func setUpWith(viewModel: DSViewModel, section: DSSection, viewIndex: Int) {
        
        self.viewModel = viewModel
        self.viewModel?.prepareToDisplay()
        self.viewIndex = viewIndex
        self.section = section
        
        guard let viewModel = self.viewModel else {
            return
        }
        
        // If reusableView is nil then we will add
        // new view to the reusable collection view cell
        if reusableView == nil {
            
            reusableView = viewModel.viewRepresentation()
            
            if let view = reusableView?.view {
                
                let result = viewModel.viewRepresentationWithSideViews(with: view)
                reusableUIView = result.view
                
                leftSideView = result.leftSideView
                rightSideView = result.rightSideView
                topSideView = result.topSideView
                bottomSideView = result.bottomSideView
            }
            
            contentView.addCustomSubview(view: reusableUIView, group: constraintGroup)
            setUpSupplementaryViewsFor(viewModel)
        }
        
        // Set view style
        setReusableViewStyle(model: viewModel)
        
        // Insets
        let insets = viewModel.style.displayStyle.viewInsets()
        
        // Update edge insets
        contentView.updateUIEdgeInsets(view: reusableUIView, insets: insets, group: constraintGroup)
        
        setSupplementaryViewsViewModelIfNeed(viewModel)
        
        // Set up reusable view
        reusableView?.setUpWith(viewModel: viewModel)
        
        if let vm = viewModel.leftSideView?.viewModel {
            leftSideView?.setUpWith(viewModel: vm)
        }
        
        if let vm = viewModel.topSideView?.viewModel {
            topSideView?.setUpWith(viewModel: vm)
        }
        
        if let vm = viewModel.rightSideView?.viewModel {
            rightSideView?.setUpWith(viewModel: vm)
        }
        
        if let vm = viewModel.bottomSideView?.viewModel {
            bottomSideView?.setUpWith(viewModel: vm)
        }
    }
    
    /// This method is called each time this reusable view cell is prepared to be displayed on screen
    /// here we calculate the view width and height
    /// - Parameter layoutAttributes: UICollectionViewLayoutAttributes
    /// - Returns: UICollectionViewLayoutAttributes
    override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
        
        if let model = self.viewModel, let section = self.section {
            
            let width = model.width(nil, section: section)
            let height = model.height(nil, section: section)
            
            if width.isAbsolute && height.isAbsolute {
                
                return absoluteWidthAbsoluteHeight(layoutAttributes, width, height)
                
            } else if width.isAbsolute && height.isEstimated {
                
                return absoluteWidthEstimatedHeight(model, section, layoutAttributes, width)
                
            } else if width.isEstimated && height.isAbsolute {
                
                return estimatedWidthAbsoluteHeight(model, section, layoutAttributes, height)
                
            } else if width.isEstimated && height.isEstimated {
                
                return estimatedWidthEstimatedHeight(model, section, layoutAttributes)
                
            } else {
                
                return defaultLayout(model, section, layoutAttributes)
            }
        }
        
        return update(layoutAttributes)
    }
    
    /// Estimated width & Absolute height
    /// - Parameters:
    ///   - model: DSViewModel
    ///   - section: DSSection
    ///   - layoutAttributes: UICollectionViewLayoutAttributes
    ///   - height: DSViewModelHeight
    /// - Returns: UICollectionViewLayoutAttributes
    fileprivate func estimatedWidthAbsoluteHeight(_ model: DSViewModel,
                                                  _ section: DSSection,
                                                  _ layoutAttributes: UICollectionViewLayoutAttributes, _
                                                    height: DSViewModelHeight) -> UICollectionViewLayoutAttributes {
        // Estimated width & Absolute height
        
        if let width = DSReusableCollectionViewsHeightManager.shared.widthFor(viewModel: model, in: section) {
            
            var newFrame = layoutAttributes.frame
            newFrame.size.width = width
            layoutAttributes.frame = newFrame
            return layoutAttributes
            
        } else {
            
            let layoutAttributes = update(layoutAttributes, absoluteHeight: height.dimension().dimension)
            let width = layoutAttributes.frame.size.width
            
            DSReusableCollectionViewsHeightManager.shared.setFor(width: width, viewModel: model, in: section)
            return layoutAttributes
        }
    }
    
    /// Absolute width & estimated height UICollectionViewLayoutAttributes
    /// - Parameters:
    ///   - model: DSViewModel
    ///   - section: DSSection
    ///   - layoutAttributes: UICollectionViewLayoutAttributes
    ///   - width: DSViewModelWidth
    /// - Returns: UICollectionViewLayoutAttributes
    fileprivate func absoluteWidthEstimatedHeight(_ model: DSViewModel,
                                                  _ section: DSSection,
                                                  _ layoutAttributes: UICollectionViewLayoutAttributes, _
                                                    width: DSViewModelWidth) -> UICollectionViewLayoutAttributes {
        
        if let height = DSReusableCollectionViewsHeightManager.shared.heightFor(viewModel: model, in: section) {
            
            var newFrame = layoutAttributes.frame
            newFrame.size.height = height
            layoutAttributes.frame = newFrame
            return layoutAttributes
            
        } else {
            
            let layoutAttributes = update(layoutAttributes, absoluteWidth: width.dimension().dimension)
            let height = layoutAttributes.frame.size.height
            DSReusableCollectionViewsHeightManager.shared.setFor(height: height, viewModel: model, in: section)
            return layoutAttributes
        }
    }
    
    /// Estimated width & Estimated height
    /// - Parameters:
    ///   - model: DSViewModel
    ///   - section: DSSection
    ///   - layoutAttributes: UICollectionViewLayoutAttributes
    /// - Returns: UICollectionViewLayoutAttributes
    fileprivate func estimatedWidthEstimatedHeight(_ model: DSViewModel,
                                                   _ section: DSSection,
                                                   _ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
        // Estimated width & Estimated height
        
        if let width = DSReusableCollectionViewsHeightManager.shared.widthFor(viewModel: model, in: section),
           let height = DSReusableCollectionViewsHeightManager.shared.heightFor(viewModel: model, in: section) {
            
            var newFrame = layoutAttributes.frame
            newFrame.size.width = width
            newFrame.size.height = height
            layoutAttributes.frame = newFrame
            return layoutAttributes
            
        } else {
            
            let layoutAttributes = updateEstimatedWidthAndHeight(layoutAttributes)
            let width = layoutAttributes.frame.size.width
            let height = layoutAttributes.frame.size.height
            
            DSReusableCollectionViewsHeightManager.shared.setFor(width: width, viewModel: model, in: section)
            
            DSReusableCollectionViewsHeightManager.shared.setFor(height: height, viewModel: model, in: section)
            
            return layoutAttributes
        }
    }
    
    /// Absolute width & Absolute height
    /// - Parameters:
    ///   - layoutAttributes: UICollectionViewLayoutAttributes
    ///   - width: DSViewModelWidth
    ///   - height: DSViewModelHeight
    /// - Returns: UICollectionViewLayoutAttributes
    fileprivate func absoluteWidthAbsoluteHeight(_ layoutAttributes: UICollectionViewLayoutAttributes, _ width: DSViewModelWidth, _ height: DSViewModelHeight) -> UICollectionViewLayoutAttributes {
        // Absolute width & Absolute height
        var newFrame = layoutAttributes.frame
        newFrame.size.width = width.dimension().dimension
        newFrame.size.height = height.dimension().dimension
        layoutAttributes.frame = newFrame
        
        return layoutAttributes
    }
    
    /// Default layout
    /// - Parameters:
    ///   - model: DSViewModel
    ///   - section: DSSection
    ///   - layoutAttributes: UICollectionViewLayoutAttributes
    /// - Returns: UICollectionViewLayoutAttributes
    fileprivate func defaultLayout(_ model: DSViewModel, _ section: DSSection, _ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
        // If we already have calculated height, then update UICollectionViewLayoutAttributes
        // and return it, else update view layout and return new UICollectionViewLayoutAttributes
        if let height = DSReusableCollectionViewsHeightManager.shared.heightFor(viewModel: model, in: section) {
            
            var newFrame = layoutAttributes.frame
            newFrame.size.height = height
            layoutAttributes.frame = newFrame
            return layoutAttributes
            
        } else {
            
            let layoutAttributes = update(layoutAttributes)
            let height = layoutAttributes.frame.size.height
            DSReusableCollectionViewsHeightManager.shared.setFor(height: height, viewModel: model, in: section)
            return layoutAttributes
        }
    }
}
