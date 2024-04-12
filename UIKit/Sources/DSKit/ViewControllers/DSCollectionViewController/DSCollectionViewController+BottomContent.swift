//
//  DSCollectionViewController+BottomContent.swift
//  DSKit
//
//  Created by Borinschi Ivan on 15.02.2021.
//  Copyright © 2021 Borinschi Ivan. All rights reserved.
//

import UIKit
import Cartography

extension DSCollectionViewController {
    
    // Bottom collection view
    func setUpBottomCollectionView() {
        
        bottomCollectionView = DSCollectionView(position: .bottom)
        bottomCollectionView.view.bounces = false
        bottomCollectionViewHolder = UIView()
        view.addSubview(bottomCollectionViewHolder)
        bottomCollectionViewHolder.addSubview(bottomCollectionView)
        
        addBottomShadow()
        setUpBottomCollectionConstraints()
        bottomContentSizeDidUpdateHandler()
    }
    
    /// Set up bottom collection constraints
    func setUpBottomCollectionConstraints() {
        
        constrain(bottomCollectionViewHolder, bottomCollectionView, view) { bottomCollectionViewHolder, bottomCollectionView, view in
            
            bottomCollectionViewHolder.left == view.left
            bottomCollectionViewHolder.right == view.right
            
            bottomCollectionView.top == bottomCollectionViewHolder.top
            bottomCollectionView.left == bottomCollectionViewHolder.left
            bottomCollectionView.right == bottomCollectionViewHolder.right
            bottomCollectionView.height == self.view.bounds.height
        }
        
        constrain(bottomCollectionViewHolder, view, bottomCollectionView,
                  replace: bottomCollectionViewHolderHeightConstraintGroup) { bottomCollectionViewHolder, view, bottomCollectionView in
            
            bottomCollectionViewHolder.height == 0
            bottomCollectionViewHolder.bottom == view.bottom
        }
    }
    
    /// Bottom content size handler
    fileprivate func bottomContentSizeDidUpdateHandler() {
        
        bottomCollectionView.contentSizeDidUpdate = { [weak  self] size in
            if size.height != self?.collectionView.additionalBottomContentSpace {
                self?.adaptBottomContentToNewHeight(height: size.height)
            }
        }
    }
    
    /// Adapt bottom content to new height
    /// - Parameter height: CGFloat
    func adaptBottomContentToNewHeight(height: CGFloat) {
        updateCenterContentWithBottomContentHeight(height)
        updateBottomShadowWithBottomContentHeight(height)
        updateBottomContentPosition(height)
    }
    
    /// Update bottom shadow with current bottom content height
    func updateBottomShadowWithCurrentBottomContentHeight() {
        
        let bottomContentHeight = bottomCollectionView.view.contentSize.height
        updateBottomShadowWithBottomContentHeight(bottomContentHeight)
    }
    
    /// Update bottom shadow with bottom content height
    /// - Parameter bottomContentHeight: CGFloat
    fileprivate func updateBottomShadowWithBottomContentHeight(_ bottomContentHeight: CGFloat) {
        
        let centerContentHeight = collectionView.view.contentSize.height - bottomContentHeight
        
        if bottomContentHeight > 0 {
            
            let bottomContentHeight = bottomContentHeight + (appearance.groupMargins * 2) + view.safeAreaInsets.bottom + view.safeAreaInsets.top + 20
            
            if centerContentHeight >= (collectionView.view.frame.height - bottomContentHeight) {
                showBottomShadow()
            } else {
                hideBottomShadow()
            }
        } else {
            hideBottomShadow()
        }
    }
    
    /// Update center content with bottom content height
    /// - Parameter bottomContentHeight: CGFloat
    fileprivate func updateCenterContentWithBottomContentHeight(_ bottomContentHeight: CGFloat) {
        collectionView.setBottomAdditionalSpace(space: bottomContentHeight)
    }
    
    /// Update bottom content position
    /// - Parameter bottomContentHeight: CGFloat
    fileprivate func updateBottomContentPosition(_ bottomContentHeight: CGFloat) {
        
        constrain(bottomCollectionViewHolder, view, bottomCollectionView, replace: bottomCollectionViewHolderHeightConstraintGroup) { bottomCollectionViewHolder, view, bottomCollectionView in
            
            bottomCollectionViewHolder.height == bottomContentHeight
            
            if bottomContentHeight > 0 {
                bottomCollectionViewHolder.bottom == view.bottomMargin
            } else {
                bottomCollectionViewHolder.bottom == view.bottom
            }
        }
        
        updateLayout(animated: true)
    }
}
