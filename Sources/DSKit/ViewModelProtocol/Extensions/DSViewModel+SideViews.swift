//
//  DSViewModel+SideViews.swift
//  DSKit
//
//  Created by Borinschi Ivan on 16.03.2021.
//  Copyright © 2021 Borinschi Ivan. All rights reserved.
//

import UIKit
import Cartography

extension DSViewModel {
    
    func viewRepresentationWithSideViews(with mainView: UIView) -> (view: UIView,
                                                                    bottomSideView: DSReusableUIView?,
                                                                    topSideView: DSReusableUIView?,
                                                                    leftSideView: DSReusableUIView?,
                                                                    rightSideView: DSReusableUIView?) {
        let holderView = UIView()
        holderView.backgroundColor = .clear
        holderView.addSubview(mainView)
        
        let bottomSideView = setUpBottomConstraintIfNeed(holderView, mainView)
        let topSideView = setUpTopConstraintIfNeed(holderView, mainView)
        let leftSideView = setUpLeftConstraintIfNeed(holderView, mainView)
        let rightSideView = setUpRightConstraintIfNeed(holderView, mainView)
        
        addMissingConstraintsForMainView(holderView, mainView)
        
        return (view: holderView,
                bottomSideView: bottomSideView,
                topSideView: topSideView,
                leftSideView: leftSideView,
                rightSideView: rightSideView)
    }
    
    fileprivate func addMissingConstraintsForMainView(_ holderView: UIView, _ mainView: UIView) {
        
        constrain(holderView, mainView) { holderView, mainView in
            
            if self.bottomSideView == nil {
                mainView.bottom == holderView.bottom
            }
            
            if self.leftSideView == nil {
                mainView.left == holderView.left
            }
            
            if self.rightSideView == nil {
                mainView.right == holderView.right
            }
            
            if self.topSideView == nil {
                mainView.top == holderView.top
            }
        }
    }
    
    fileprivate func setUpBottomConstraintIfNeed(_ holderView: UIView, _ mainView: UIView) -> DSReusableUIView? {
        
        if let bottomSideView = self.bottomSideView {
            
            let reusableView = bottomSideView.viewModel.viewRepresentation()
            
            let sideView = reusableView.view
            holderView.addSubview(sideView)
            
            let space = DSAppearance.shared.main.interItemSpacing
            
            constrain(holderView, mainView, sideView) { holderView, mainView, sideView in
                sideView.bottom == holderView.bottom
                sideView.left == holderView.left
                sideView.right == holderView.right
                sideView.top == mainView.bottom + space
            }
            
            let height = bottomSideView.viewModel.height(nil, section: DSSection())
            
            if height.isAbsolute {
                constrain(sideView) { sideView in
                    sideView.height == height.dimension().dimension
                }
            }
            
            return reusableView
        }
        
        return nil
    }
    
    fileprivate func setUpTopConstraintIfNeed(_ holderView: UIView, _ mainView: UIView) -> DSReusableUIView? {
        
        if let topSideView = self.topSideView {
            
            let reusableView = topSideView.viewModel.viewRepresentation()
            
            let sideView = reusableView.view
            holderView.addSubview(sideView)
            
            let space = DSAppearance.shared.main.interItemSpacing
            
            constrain(holderView, mainView, sideView) { holderView, mainView, sideView in
                sideView.bottom == mainView.top + space
                sideView.left == holderView.left
                sideView.right == holderView.right
                sideView.top == holderView.top
            }
            
            let height = topSideView.viewModel.height(nil, section: DSSection())
            
            if height.isAbsolute {
                constrain(sideView) { sideView in
                    sideView.height == height.dimension().dimension
                }
            }
            
            return reusableView
        }
        
        return nil
    }
    
    fileprivate func setUpLeftConstraintIfNeed(_ holderView: UIView, _ mainView: UIView) -> DSReusableUIView? {
        
        if let leftSideView = self.leftSideView {
            
            let space = DSAppearance.shared.main.interItemSpacing
            
            let reusableView = leftSideView.viewModel.viewRepresentation()
            
            let sideView = reusableView.view
            holderView.addSubview(sideView)
            
            constrain(holderView, mainView, sideView) { holderView, mainView, sideView in
                sideView.centerY == holderView.centerY
                sideView.left == holderView.left
                sideView.right == mainView.left - space
            }
            
            let width = leftSideView.viewModel.width(nil, section: DSSection())
            
            if width.isAbsolute {
                constrain(sideView) { sideView in
                    sideView.width == width.dimension().dimension
                }
            }
            
            let height = leftSideView.viewModel.height(nil, section: DSSection())

            if height.isAbsolute {
                constrain(sideView) { sideView in
                    sideView.height == height.dimension().dimension
                }
            }
            
            return reusableView
        }
        
        return nil
    }
    
    fileprivate func setUpRightConstraintIfNeed(_ holderView: UIView, _ mainView: UIView) -> DSReusableUIView?  {
        
        if let rightSideView = self.rightSideView {
            
            let reusableView = rightSideView.viewModel.viewRepresentation()
            
            let sideView = reusableView.view
            holderView.addSubview(sideView)
            
            let space = DSAppearance.shared.main.interItemSpacing
            
            constrain(holderView, mainView, sideView) { holderView, mainView, sideView in
                sideView.left == mainView.right + space
                sideView.right == holderView.right
                sideView.centerY == holderView.centerY
            }
            
            let width = rightSideView.viewModel.width(nil, section: DSSection())
            
            if width.isAbsolute {
                constrain(sideView) { sideView in
                    sideView.width == width.dimension().dimension
                }
            }
            
            let height = rightSideView.viewModel.height(nil, section: DSSection())
            
            if height.isAbsolute {
                constrain(sideView) { sideView in
                    sideView.height == height.dimension().dimension
                }
            }
            
            return reusableView
        }
        
        return nil
    }
}
