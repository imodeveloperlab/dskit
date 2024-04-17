//
//  DSImageUIView.swift
//  DSKit
//
//  Created by Borinschi Ivan on 15.12.2020.
//  Copyright © 2021 Borinschi Ivan. All rights reserved.
//
//

import UIKit

final class DSImageUIView: UIView, DSReusableUIView {
    
    // Image view
    @IBOutlet weak var imageView: UIImageView!
    
    // Image view constraints
    @IBOutlet var imageViewLeftSpaceConstraint: NSLayoutConstraint!
    @IBOutlet var imageViewRightSpaceConstraint: NSLayoutConstraint!
    @IBOutlet var imageViewWidthConstraint: NSLayoutConstraint!
    
    // View model
    var viewModel: DSImageVM?
    
    // View
    public var view: UIView { self }
    
    /// This method is called each time a copy of DSImageUIView is prepared to be displayed on screen
    /// - Parameter viewModel: DSViewModel
    public func setUpWith(viewModel: DSViewModel) {
        
        // Cast DSViewModel to DSImageVM
        guard let viewModel = viewModel as? DSImageVM else { return }
        self.viewModel = viewModel
        update(viewModel: viewModel)
    }
    
    /// Update view with view model
    /// - Parameter viewModel: DSActionVM
    func update(viewModel: DSImageVM) {
        
        let viewColors = viewModel.viewColors()
        
        imageView.setImageContent(viewModel.imageContent)
        
        
        imageView.setImageContentMode(viewModel.contentMode)
        imageView.setImageTintColor(viewModel.tintColor, designableViewColors: viewColors)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        guard let viewModel = self.viewModel else {
            return
        }
        
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
        
        if viewModel.width.isAbsolute && viewModel.height.isAbsolute {
            
            let width = viewModel.width.absolute() ?? 50
            let height = viewModel.height.absolute() ?? 50
            
            imageView.setImageDisplayStyle(viewModel.imageDisplayStyle, size: .size(.init(width: width, height: height)), cornerRadius: cornerRadius)
            
        } else {
            
            imageView.setImageDisplayStyle(viewModel.imageDisplayStyle, size: .unknown, cornerRadius: cornerRadius)
        }
        
        switch viewModel.imageDisplayStyle {
        case .circle:
            imageViewLeftSpaceConstraint.isActive = false
            imageViewRightSpaceConstraint.isActive = false
            imageViewWidthConstraint.isActive = true
            imageViewWidthConstraint.constant = imageView.bounds.height
        case .default:
            imageViewWidthConstraint.isActive = false
            imageViewLeftSpaceConstraint.isActive = true
            imageViewRightSpaceConstraint.isActive = true
        case .themeCornerRadius:
            imageViewWidthConstraint.isActive = false
            imageViewLeftSpaceConstraint.isActive = true
            imageViewRightSpaceConstraint.isActive = true
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = .clear
    }
    
    class func instanceFromNib() -> DSImageUIView {
        let view: DSImageUIView = initFromNib()
        return view
    }
}
