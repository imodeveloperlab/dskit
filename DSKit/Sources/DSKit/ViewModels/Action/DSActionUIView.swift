//
//  DSActionUIView.swift
//  DSKit
//
//  Created by Borinschi Ivan on 17.12.2020.
//  Copyright © 2021 Borinschi Ivan. All rights reserved.
//

import UIKit

final class DSActionUIView: UIView, DSReusableUIView {
    
    // Left view alignment constraints
    @IBOutlet weak var leftViewTopAlignToLabelConstraint: NSLayoutConstraint?
    @IBOutlet weak var leftViewCenterAlignToLabelConstraint: NSLayoutConstraint?
    
    // Top Image View
    @IBOutlet weak var topImageView: UIImageView!
    @IBOutlet var topImageViewEqualHeightConstraint: NSLayoutConstraint!
    
    // Top image constraints
    @IBOutlet weak var topImageViewTopMarginConstraint: NSLayoutConstraint!
    @IBOutlet weak var topImageViewRightMarginConstraint: NSLayoutConstraint!
    @IBOutlet weak var topImageViewLeftMarginConstraint: NSLayoutConstraint!
    @IBOutlet weak var topImageViewToLabelSpaceConstraint: NSLayoutConstraint!
    
    // Text
    @IBOutlet weak var textLabel: UILabel!
    
    // Left / Right views
    @IBOutlet weak var leftView: UIView?
    @IBOutlet weak var rightView: UIView?
    
    // Spaces
    @IBOutlet weak var leftLabelSpace: NSLayoutConstraint!
    @IBOutlet weak var rightLabelSpace: NSLayoutConstraint!
    
    // Appearance
    var appearance = DSAppearance.shared.main
    
    // View model
    var viewModel: DSActionVM?
    
    // DSReusableUIView protocol
    public var view: UIView { self }
    
    /// This method is called each time a copy of DSActionUIView is prepared to be displayed on screen
    /// - Parameter viewModel: DSViewModel
    public func setUpWith(viewModel: DSViewModel) {
        
        // Cast DSViewModel to DSActionVM
        guard let viewModel = viewModel as? DSActionVM else { return }
        self.viewModel = viewModel
        update(viewModel: viewModel)
    }
    
    /// Update view with view model
    /// - Parameter viewModel: DSActionVM
    func update(viewModel: DSActionVM) {
        textLabel.set(text: viewModel.text, designableTextColor: viewModel.viewColors().text)
        updateLayout(viewModel: viewModel)
    }
    
    /// Update layout with view model
    /// - Parameter viewModel: DSActionVM
    func updateLayout(viewModel: DSActionVM) {
        
        // Set left view and right view
        rightView?.set(view: viewModel.rightView, designableViewColors: viewModel.viewColors())
        leftView?.set(view: viewModel.leftView, designableViewColors: viewModel.viewColors())
        
        // Update spaces
        leftLabelSpace.constant = (viewModel.leftView == nil) ? 0 : appearance.groupMargins
        rightLabelSpace.constant = (viewModel.rightView == nil) ? 0 : appearance.groupMargins
        
        // Update top image layout
        updateTopImageLayout(viewModel: viewModel)
        updateLeftViewPositions(viewModel: viewModel)
    }
    
    /// Update left view position
    /// - Parameter viewModel: DSActionVM
    func updateLeftViewPositions(viewModel: DSActionVM) {
        
        switch viewModel.leftViewPosition {
        case .top:
            leftViewTopAlignToLabelConstraint?.isActive = true
            leftViewCenterAlignToLabelConstraint?.isActive = false
        case .center:
            leftViewTopAlignToLabelConstraint?.isActive = false
            leftViewCenterAlignToLabelConstraint?.isActive = true
        }
    }
    
    /// Update top image layout
    /// - Parameter viewModel: DSActionVM
    func updateTopImageLayout(viewModel: DSActionVM) {
        
        topImageView.backgroundColor = viewModel.viewColors().background
        
        if let topImage = viewModel.topImage {
            
            setTopImage(image: topImage, viewModel: viewModel)
            
        } else {
            
            topImageViewToLabelSpaceConstraint.constant = 0
            topImageViewEqualHeightConstraint.constant = 0
        }
    }
    
    /// Set top image
    /// - Parameters:
    ///   - image: DSImageContent
    ///   - viewModel: DSActionVM
    func setTopImage(image: DSImageContent, viewModel: DSActionVM) {
        
        // Set image
        topImageView.setImageContent(image)
        
        // Corner radius
        var cornerRadius: CGFloat = 0
        switch viewModel.style.cornerStyle {
        case .default:
            cornerRadius = viewModel.viewColors().cornerRadius
        case .custom(let radius):
            cornerRadius = radius
        case .zero:
            cornerRadius = 0
        }
        
        topImageView.roundCorner(with: .top, radius: cornerRadius)
        
        // Set image content mode
        topImageView.setImageContentMode(viewModel.topImageContentMode)
        
        // If view model height is absolute, then the top
        // image will automatically adapt to view height
        if let height = viewModel.height, height.isAbsolute {
            
            topImageViewEqualHeightConstraint.isActive = false
            
        } else {
            
            // Set top image height
            switch viewModel.topImageHeight {
            case .equalTo(let height):
                topImageViewEqualHeightConstraint.isActive = true
                topImageViewEqualHeightConstraint.constant = height
            case .zero:
                topImageViewEqualHeightConstraint.isActive = true
                topImageViewEqualHeightConstraint.constant = 0
            case .unknown:
                topImageViewEqualHeightConstraint.isActive = false
            }
        }
        
        // Image to label space
        topImageViewToLabelSpaceConstraint.constant = appearance.interItemSpacing
        
        // Zero space to top image
        if viewModel.zeroSpaceToTopImage {
            topImageViewToLabelSpaceConstraint.constant = 0
        }
        
        // Set image style
        if viewModel.expandImageOverBoundsForGroups {
            
            switch viewModel.style.displayStyle {
            case .default:
                defaultTopImageStyle(viewModel: viewModel)
            case .grouped(inSection: _):
                groupedTopImageStyle(viewModel: viewModel)
            }
            
        } else {
            defaultTopImageStyle(viewModel: viewModel)
        }
    }
    
    /// Default image style
    /// - Parameter viewModel: DSActionVM
    func defaultTopImageStyle(viewModel: DSActionVM) {
        
        topImageViewRightMarginConstraint.constant = 0
        topImageViewTopMarginConstraint.constant = 0
        topImageViewLeftMarginConstraint.constant = 0
        topImageView.layer.cornerRadius = viewModel.viewColors().cornerRadius
    }
    
    /// Grouped image style
    /// - Parameter viewModel: DSActionVM
    func groupedTopImageStyle(viewModel: DSActionVM) {
        
        topImageViewRightMarginConstraint.constant = -appearance.groupMargins
        topImageViewTopMarginConstraint.constant = -appearance.groupMargins
        topImageViewLeftMarginConstraint.constant = -appearance.groupMargins
        topImageView.layer.cornerRadius = 0
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = .clear
    }
    
    class func instanceFromNib() -> DSActionUIView {
        let view: DSActionUIView = initFromNib(bundle: Bundle.main)
        return view
    }
}

