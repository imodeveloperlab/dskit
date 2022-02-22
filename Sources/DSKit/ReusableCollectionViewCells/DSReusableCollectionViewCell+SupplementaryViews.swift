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

extension DSReusableCollectionViewCell {
    
    func setUpSupplementaryViewsFor(_ viewModel: DSViewModel) {
        
        if let items = viewModel.supplementaryItems {
            
            supplementaryReusableViews = [DSReusableUIView]()
            
            for item in items {
                
                let viewModelView = item.view.viewRepresentation()
                supplementaryReusableViews?.append(viewModelView)
                
                switch item.background {
                case .clear:
                    contentView.addSubview(viewModelView.view)
                    constraintsFor(viewModelView, item, holder: viewModelView.view)
                case .primary:
                    
                    let holderView = UIView()
                    
                    let subView = viewModelView.view
                    
                    holderView.addSubview(subView)
                    constraintsForHolderViewAndViewModel(holderView, subView, item)
                    holderView.backgroundColor = DSAppearance.shared.main.primaryView.background
                    contentView.addSubview(holderView)
                    constraintsFor(viewModelView, item, holder: holderView)
                    
                case .secondary:
                    
                    let holderView = UIView()
                    holderView.addSubview(viewModelView.view)
                    constraintsForHolderViewAndViewModel(holderView, viewModelView.view, item)
                    holderView.backgroundColor = DSAppearance.shared.main.secondaryView.background
                    contentView.addSubview(holderView)
                    constraintsFor(viewModelView, item, holder: holderView)
                    
                case .lightBlur:
                    
                    let effectView = UIVisualEffectView(effect: UIBlurEffect(style: UIBlurEffect.Style.systemUltraThinMaterialLight))
                    
                    let holderView = UIView()
                    
                    holderView.addSubview(effectView)
                    holderView.clipsToBounds = true
            
                    constrain(holderView, effectView) { holderView, effectView in
                        effectView.edges == holderView.edges
                    }
                    
                    holderView.addSubview(viewModelView.view)
                    constraintsForHolderViewAndViewModel(holderView, viewModelView.view, item)
                    holderView.backgroundColor = .clear
                    contentView.addSubview(holderView)
                    constraintsFor(viewModelView, item, holder: holderView)
                    
                case .darkBlur:
                    
                    let effectView = UIVisualEffectView(effect: UIBlurEffect(style: UIBlurEffect.Style.dark))
                    
                    let holderView = UIView()
                    
                    holderView.addSubview(effectView)
                    holderView.clipsToBounds = true
            
                    constrain(holderView, effectView) { holderView, effectView in
                        effectView.edges == holderView.edges
                    }
                    
                    holderView.addSubview(viewModelView.view)
                    constraintsForHolderViewAndViewModel(holderView, viewModelView.view, item)
                    holderView.backgroundColor = .clear
                    contentView.addSubview(holderView)
                    constraintsFor(viewModelView, item, holder: holderView)
                    
                case .white:
                    
                    let holderView = UIView()
                    let subView = viewModelView.view
                    holderView.addSubview(subView)
                    constraintsForHolderViewAndViewModel(holderView, subView, item)
                    holderView.backgroundColor = UIColor.white
                    contentView.addSubview(holderView)
                    constraintsFor(viewModelView, item, holder: holderView)
                    
                case .black:
                    
                    let holderView = UIView()
                    let subView = viewModelView.view
                    holderView.addSubview(subView)
                    constraintsForHolderViewAndViewModel(holderView, subView, item)
                    holderView.backgroundColor = UIColor.black
                    contentView.addSubview(holderView)
                    constraintsFor(viewModelView, item, holder: holderView)
                    
                case .custom(let color):
                    
                    let holderView = UIView()
                    let subView = viewModelView.view
                    holderView.addSubview(subView)
                    constraintsForHolderViewAndViewModel(holderView, subView, item)
                    holderView.backgroundColor = color
                    contentView.addSubview(holderView)
                    constraintsFor(viewModelView, item, holder: holderView)
                }
            }
        }
    }
    
    func setSupplementaryViewsViewModelIfNeed(_ viewModel: DSViewModel) {
        
        if let items = viewModel.supplementaryItems {
            
            for (index, item) in items.enumerated() {
                if let view = supplementaryReusableViews?[index] {
                    view.setUpWith(viewModel: item.view)
                }
            }
        }
    }
    
    fileprivate func constraintsForHolderViewAndViewModel(_ holderView: UIView, _ subview: UIView, _ item: DSSupplementaryView) {
        
        switch item.cornerRadius {
        case .primary:
            holderView.layer.cornerRadius = DSAppearance.shared.main.primaryView.cornerRadius
        case .secondary:
            holderView.layer.cornerRadius = DSAppearance.shared.main.primaryView.cornerRadius
        case .custom(let radius):
            holderView.layer.cornerRadius = radius
        }
        
        constrain(holderView, subview) { superView, subview in
            
            switch item.insets {
            
            case .interItemSpacing:
                
                let spacing = DSAppearance.shared.main.interItemSpacing
                
                subview.left == superView.left + spacing
                subview.top == superView.top + spacing
                subview.bottom == superView.bottom - spacing
                subview.right == superView.right - spacing
                
            case .groupMargins:
                
                let spacing = DSAppearance.shared.main.groupMargins
                
                subview.left == superView.left + spacing
                subview.top == superView.top + spacing
                subview.bottom == superView.bottom - spacing
                subview.right == superView.right - spacing
                
            case .insets(let insets):
                
                subview.left == superView.left + insets.left
                subview.top == superView.top + insets.top
                subview.bottom == superView.bottom - insets.bottom
                subview.right == superView.right - insets.right
            case .small:
                
                subview.left == superView.left + 5
                subview.top == superView.top + 5
                subview.bottom == superView.bottom - 5
                subview.right == superView.right - 5
            }
        }
    }
    
    fileprivate func constraintsFor(_ viewModelView: DSReusableUIView, _ item: DSSupplementaryView, holder: UIView) {
        
        constrain(contentView, holder) { superView, view in
            
            switch item.position {
            case .leftTop:
                view.left == superView.left + item.offset.cgPoint().x
                view.top == superView.top + item.offset.cgPoint().y
            case .leftBottom:
                view.left == superView.left + item.offset.cgPoint().x
                view.bottom == superView.bottom - item.offset.cgPoint().y
            case .rightTop:
                view.right == superView.right - item.offset.cgPoint().x
                view.top == superView.top + item.offset.cgPoint().y
            case .rightBottom:
                view.right == superView.right - item.offset.cgPoint().x
                view.bottom == superView.bottom - item.offset.cgPoint().y
            case .rightCenter:
                view.right == superView.right - item.offset.cgPoint().x
                view.centerY == superView.centerY
            case .center:
                view.centerX == superView.centerX - item.offset.cgPoint().x
                view.centerY == superView.centerY - item.offset.cgPoint().y
            }
        }
        
        let height = item.view.height(nil, section: DSSection())
        let width = item.view.width(nil, section: DSSection())
        
        if height.isAbsolute {
            constrain(holder) { holder in
                holder.height == height.dimension().dimension
            }
        }
        
        if width.isAbsolute {
            constrain(holder) { holder in
                holder.width == width.dimension().dimension
            }
        }
    }
}
