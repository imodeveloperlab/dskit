//
//  DSCollectionViewController+TopContent.swift
//  DSKit
//
//  Created by Borinschi Ivan on 15.02.2021.
//  Copyright © 2021 Borinschi Ivan. All rights reserved.
//

import UIKit
import Cartography

extension DSCollectionViewController {
    
    /// Set up top collection view
    func setUpTopCollectionView() {
        
        topCollectionView = DSCollectionView(position: .top)
        topCollectionView.view.bounces = false
        topCollectionViewHolder = UIView()
        topCollectionViewHolder.clipsToBounds = true
        view.addSubview(topCollectionViewHolder)
        
        topCollectionViewHolder.addSubview(topCollectionView)
        addTopShadow()
        setUpTopCollectionConstraints()
        topContentSizeDidUpdateHandler()
    }
    
    /// Set up top collection constraints
    fileprivate func setUpTopCollectionConstraints() {
        
        constrain(topCollectionViewHolder, topCollectionView, view) { topCollectionViewHolder, topCollectionView, view in
            
            topCollectionViewHolder.left == view.left
            topCollectionViewHolder.right == view.right
            
            topCollectionView.left == topCollectionViewHolder.left
            topCollectionView.right == topCollectionViewHolder.right
            topCollectionView.height == self.view.bounds.height
            topCollectionView.top == topCollectionViewHolder.top
        }
        
        constrain(topCollectionViewHolder, view, replace: topCollectionViewHolderHeightConstraintGroup) { topCollectionViewHolder, view in
            topCollectionViewHolder.height == 0
            topCollectionViewHolder.top == view.top
        }
    }
    
    /// Top content size did update handler
    fileprivate func topContentSizeDidUpdateHandler() {
        
        topCollectionView.contentSizeDidUpdate = { [weak  self] size in
            if size.height != self?.collectionView.additionalTopContentSpace {
                self?.adaptTopContentToNewHeight(height: size.height)
            }
        }
    }
    
    /// Adapt top content to new height
    /// - Parameter height: CGFloat
    func adaptTopContentToNewHeight(height: CGFloat) {
        
        self.updateCenterContentWithTopContentHeight(height)
        self.updateTopContentHeight(height)
        self.updateTopShadowWithBottomContentHeight(height)
    }
    
    /// Update top content height
    /// - Parameter height: CGFloat
    func updateTopContentHeight(_ height: CGFloat) {
        
        constrain(topCollectionViewHolder, view, replace: topCollectionViewHolderHeightConstraintGroup) { topCollectionViewHolder, view in
            
            topCollectionViewHolder.height == height
            
            if height > 0 {
                topCollectionViewHolder.top == view.topMargin
            } else {
                topCollectionViewHolder.top == view.top
            }
        }
        
        self.updateLayout(animated: true)
    }
    
    /// Update top shadow
    /// - Parameter topContentHeight: CGFloat
    fileprivate func updateTopShadowWithBottomContentHeight(_ topContentHeight: CGFloat) {
        
        if topContentHeight > 0 {
            showTopShadow()
        } else {
            hideTopShadow()
        }
    }
    
    /// Update center content with top content height
    /// - Parameter topContentSize: CGFloat
    fileprivate func updateCenterContentWithTopContentHeight(_ topContentSize: CGFloat) {
        collectionView.setTopAdditionalSpace(space: topContentSize)
    }
}
