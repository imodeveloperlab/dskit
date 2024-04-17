//
//  DSPageControlUIView.swift
//  DSKit
//
//  Created by Borinschi Ivan on 12.01.2021.
//  Copyright © 2021 Borinschi Ivan. All rights reserved.
//

import UIKit

final class DSPageControlUIView: UIView, DSReusableUIView {
    
    @IBOutlet weak var collectionView: DSCollectionView!
    @IBOutlet var pageControl: UIPageControl!
    private var updatePageTask: DispatchWorkItem?
    
    public var view: UIView { self }
    
    public func setUpWith(viewModel: DSViewModel) {
        guard let viewModel = viewModel as? DSPageControlVM else { return }
        update(viewModel: viewModel)
    }
    
    func update(viewModel: DSPageControlVM) {
        
        switch viewModel.type {
        case .pages(let pages):
            pageControl.numberOfPages = pages.count

            let pages: [DSViewModel] = pages
            let section = pages.gallery(type: viewModel.galleryType).zeroTopBottomInset()
            
            section.scrollHandler = scrollHandler()
            
            collectionView.show(content: [section])
            
        case .viewModels(let models):
            pageControl.numberOfPages = models.count
            let section = models.gallery(type: viewModel.galleryType).zeroTopBottomInset()
            section.scrollHandler = scrollHandler()
            collectionView.show(content: [section])
        }
        
        collectionView.view.bounces = false
        collectionView.clipsToBounds = false
        collectionView.view.clipsToBounds = false
        
        pageControl.currentPage = viewModel.currentPage
        updateColors(viewColors: viewModel.viewColors())
    }
    
    func updateColors(viewColors: DSDesignableViewColors) {
        pageControl.pageIndicatorTintColor = viewColors.text.title1.withAlphaComponent(0.3)
        pageControl.currentPageIndicatorTintColor = viewColors.text.title1
        collectionView.backgroundColor = .clear
        collectionView.view.backgroundColor = .clear
    }
    
    func scrollHandler() -> NSCollectionLayoutSectionVisibleItemsInvalidationHandler? {
        
        return { [unowned self] items, position, environment in

            // optional: cancel task
            updatePageTask?.cancel()

            updatePageTask = DispatchWorkItem { [weak self] in
                
                guard let self = self else { return }

                guard let itemsWidth = items.first?.bounds.width else {
                    return
                }

                let page = Int((position.x + (itemsWidth / 2)) / itemsWidth)

                if self.pageControl.currentPage != page {
                    self.pageControl.currentPage = page
                }
            }

            guard let updatePageTask = updatePageTask else {
                return
            }

            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.1, execute: updatePageTask)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = .clear
    }
    
    class func instanceFromNib() -> DSPageControlUIView {
        let view: DSPageControlUIView = initFromNib()
        return view
    }
}
