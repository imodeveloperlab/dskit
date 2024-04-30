//
//  DSCollectionView.swift
//  DSKit
//
//  Created by DSKit on 10/13/16.
//  Copyright © 2020 Borinschi Ivan. All rights reserved.
//

import UIKit
import Cartography

public final class CollectionView: UICollectionView {
    
    override public func layoutSubviews() {
            super.layoutSubviews()
        
        guard #available(iOS 14.3, *) else { return }

                subviews.forEach { subview in
                    guard
                        let scrollView = subview as? UIScrollView,
                        let minY = scrollView.subviews.map(\.frame.origin.y).min(),
                        let maxHeight = scrollView.subviews.map(\.frame.height).max(),
                        minY != scrollView.frame.minY || maxHeight > scrollView.frame.height
                    else { return }
                    
                    scrollView.contentInset.top = -minY
                    scrollView.frame.origin.y = minY
                    scrollView.frame.size.height = maxHeight
                }
        }
}

public class DSCollectionView: UIView, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UIScrollViewDelegate {
    
    // MARK: - Proprieties
    
    // Current data snapshot
    var snapshot: NSDiffableDataSourceSnapshot<DSDiffableSection, DSViewModelDataSource>?
    
    //Collection View
    public var view: CollectionView
    
    //Handle did select item at index path
    public var didSelectItemAt: ((IndexPath) -> (Void))?
    
    //Handle scroll view did scroll
    public var scrollViewDidScroll: ((UIScrollView) -> (Void))?
    public var scrollViewDidScrollForKeyboard: ((UIScrollView) -> (Void))?
    
    //Handler scroll view did zoom
    public var scrollViewDidZoom: ((UIScrollView) -> (Void))?
    
    //Store registered cell unique identifiers
    //to be able to check if some unique identifier is
    //not already registered and not register again
    var registeredCells = Array<String>()
    
    //Store registered view unique identifiers
    //to be able to check if some unique identifier is
    //not already registered and not register again
    var registeredViews = Array<String>()
    
    //Is keyboard on screen
    var isKeyboardOnScreen: Bool = false
    
    //For storing original collection UIEdgeInsets when an keyboard appears on screen
    //table will change its content insets and after when keyboard disappears
    //we need to set previous table ContentInset and ScrollIndicatorInsets
    public var storedContentInset: UIEdgeInsets?
    
    //Background element kind identifier
    static let sectionBackgroundDecorationElementKind = "section-background-element-kind"
    static let sectionBackgroundColorPrimaryDecorationElementKind = "section-background-color-primary-element-kind"
    static let sectionBackgroundColorSecondaryDecorationElementKind = "section-background-color-secondary-element-kind"
    
    //Content size did update closure
    public var contentSizeDidUpdate: ((CGSize) -> Void)?
    
    //Current content displayed in collection view
    var adaptedContent = [DSSection]()
    
    //Current requested to be displayed on the screen
    var originalContent = [DSSection]()
    
    //Collection view data source
    var dataSource: UICollectionViewDiffableDataSource<DSDiffableSection, DSViewModelDataSource>!
    
    /// Add additional content space, will add an additional content section with a space view model in it
    /// to already existing content in this collection
    var additionalBottomContentSpace: CGFloat = 0
    
    /// Add additional content space, will add an additional content section with a space view model in it
    /// to already existing content in this collection
    var additionalTopContentSpace: CGFloat = 0
    
    /// In which part of view controller is this collectionView displayed
    public var position: DSCollectionViewPosition
    
    // MARK: - Init
    
    public init(position: DSCollectionViewPosition) {
        self.position = position
        self.view = CollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        super.init(frame: .zero)
        self.setUp()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        self.position = .center
        self.view = CollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        super.init(coder: aDecoder)
        self.setUp()
    }
    
    // MARK: - Setup
    func setUp() {
        
        self.view.delegate = self;
        self.addSubview(self.view)
        
        constrain(self, self.view) { superView, collectionView  in
            collectionView.edges == superView.edges
        }
        
        // Configure data source
        configureDataSource()
        
        // Configure supplementary data source
        configureSupplementaryViewDataSource()
        
        // Set layout
        setCollectionViewLayout(createLayout(), animated: false)
        
        // Paging off
        isPagingEnabled = false
        
        // Scroll indicators
        showsHorizontalScrollIndicator = false
        showsVerticalScrollIndicator = true
    }
    
    /// Set collection view layout
    /// - Parameters:
    ///   - layout: UICollectionViewLayout
    ///   - animated: animated
    ///   - completion: completion
    open func setCollectionViewLayout(_ layout: UICollectionViewLayout, animated: Bool, completion: ((Bool) -> Void)? = nil) {
        view.setCollectionViewLayout(layout, animated: animated, completion: completion)
    }
    
    // MARK: - UICollectionViewDelegate
    
    /// Did select item at index-path
    /// - Parameters:
    ///   - collectionView: UICollectionView
    ///   - indexPath: IndexPath
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let viewModel = self.adaptedContent[indexPath.section].viewModels[indexPath.row]
        viewModel.didTap?(viewModel)
        
        if let closure = self.didSelectItemAt {
            closure(indexPath)
        }
    }
    
    /// Did highlight item at index-path
    /// - Parameters:
    ///   - collectionView: UICollectionView
    ///   - indexPath: IndexPath
    public func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) {
            let viewModel = self.adaptedContent[indexPath.section].viewModels[indexPath.row]
            if viewModel.didTap != nil {
                UIView.animate(withDuration: 0.2) {
                    for view in cell.contentView.subviews {
                        for view in view.subviews {
                            if view is UILabel {
                                view.alpha = 0.5
                            }
                        }
                    }
                }
            }
        }
    }
    
    /// Did un highlight item at index-path
    /// - Parameters:
    ///   - collectionView: UICollectionView
    ///   - indexPath: IndexPath
    public func collectionView(_ collectionView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) {
            UIView.animate(withDuration: 0.3) {
                for view in cell.contentView.subviews {
                    for view in view.subviews {
                        if view is UILabel {
                            view.alpha = 1.0
                        }
                    }
                }
            }
        }
    }
    
    // MARK: - UIScrollViewDelegate
    
    /// Scroll view delegate
    /// - Parameter scrollView: UIScrollView
    public func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        self.scrollViewDidScroll?(scrollView)
        self.scrollViewDidScrollForKeyboard?(scrollView)
    }
    
    /// Scroll view did zoom
    /// - Parameter scrollView: UIScrollView
    public func scrollViewDidZoom(_ scrollView: UIScrollView)  {
        if let closure = self.scrollViewDidZoom {
            closure(scrollView)
        }
    }
}
