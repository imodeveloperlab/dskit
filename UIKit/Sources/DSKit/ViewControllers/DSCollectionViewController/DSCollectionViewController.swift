//
//  BaseCollectionViewController.swift
//  DSKit
//
//  Created by Borinschi Ivan on 07.12.2020.
//  Copyright © 2021 Borinschi Ivan. All rights reserved.
//

import UIKit
import Cartography

open class DSCollectionViewController: DSBaseViewController {
    
    // Shadows
    var bottomShadow: UIView?
    var topShadow: UIView?
    var collectionView: DSCollectionView!
    
    // Bottom collection
    var bottomCollectionView: DSCollectionView!
    var bottomCollectionViewHolder: UIView!
    var bottomCollectionViewHolderHeightConstraintGroup = ConstraintGroup()
    
    // Top collection
    var topCollectionView: DSCollectionView!
    var topCollectionViewHolder: UIView!
    var topCollectionViewHolderHeightConstraintGroup = ConstraintGroup()
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        setUpCollectionView()
        setUpBottomCollectionView()
        setUpTopCollectionView()
        setUpCollectionViewAppearance()
    }
    
    open override func appearanceDidUpdate() {
        super.appearanceDidUpdate()
        updateCollectionsAppearance()
    }
    
    open override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        collectionView.adjustContentInsetsForKeyboard(true)
        self.view.sendSubviewToBack(collectionView)
    }
    
    open override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        if collectionView != nil {
            collectionView.adjustContentInsetsForKeyboard(false)
        }
    }
    
    func updateCollectionsAppearance() {
        collectionView.reload()
        topCollectionView.reload()
        setUpCollectionViewAppearance()
    }
    
    func setUpCollectionViewAppearance() {
        
        let appearance = DSAppearance.shared.main
        self.setBackgroundColor(color: appearance.primaryView.background)
    }
    
    public func setBackgroundColor(color: UIColor) {
        
        view.backgroundColor = color
        collectionView.backgroundColor = .clear
        collectionView.view.backgroundColor = .clear
        
        bottomCollectionViewHolder.backgroundColor = color
        bottomCollectionView.backgroundColor = color
        bottomCollectionView.view.backgroundColor = color
        
        topCollectionViewHolder.backgroundColor = color
        topCollectionView.backgroundColor = color
        topCollectionView.view.backgroundColor = color
    }
}

// MARK: - Top collection view
extension DSCollectionViewController {
    
    func setUpCollectionView() {
        
        collectionView = DSCollectionView(position: .center)
        collectionView.view.alwaysBounceVertical = true
        view.addSubview(collectionView)
        collectionView.hideKeyboardWhenTappedAround()
        collectionView.hideKeyboardWhenHitBottom()
        
        constrain(collectionView, view) { collectionView, view in
            collectionView.edges == view.edges
        }
        
        collectionView.contentSizeDidUpdate = { [weak self] size in
            self?.updateBottomShadowWithCurrentBottomContentHeight()
        }
    }
    
    public func handleScrollViewDidScroll(_ handle: ((UIScrollView) -> (Void))?) {
        collectionView.scrollViewDidScroll = handle
    }
}

// MARK: - Update layout
extension DSCollectionViewController {
    
    /// Update layout
    /// - Parameters:
    ///   - animated: Bool
    ///   - duration: TimeInterval
    func updateLayout(animated: Bool, duration: TimeInterval = 0.3, completion: (() -> Void)? = nil) {
        
        if animated {
            
            UIView.animate(withDuration: duration, delay: 0, usingSpringWithDamping: 0.9, initialSpringVelocity: 0.4, options: .curveEaseInOut) { [weak self] in
                self?.view.layoutIfNeeded()
            } completion: { (completed) in
                if completed {
                    completion?()
                }
            }
            
        } else {
            self.view.layoutIfNeeded()
            completion?()
        }
    }
}
