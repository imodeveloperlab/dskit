//
//  DSMapUIView.swift
//  DSKit
//
//  Created by Borinschi Ivan on 17.12.2020.
//  Copyright © 2021 Borinschi Ivan. All rights reserved.
//

import UIKit

final class DSMapUIView: UIView, DSReusableUIView {
    
    @IBOutlet weak var textLabelMapImageSpace: NSLayoutConstraint!
    @IBOutlet weak var text: UILabel!
    @IBOutlet weak var leftImageSpace: NSLayoutConstraint!
    @IBOutlet weak var rightImageSpace: NSLayoutConstraint!
    @IBOutlet weak var bottomImageSpace: NSLayoutConstraint!
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var locationIndicator: UIImageView!
    
    var appearance = DSAppearance.shared.main
    var viewModel: DSMapVM?
    
    public var view: UIView { self }
    
    public func setUpWith(viewModel: DSViewModel) {
        
        guard let viewModel = viewModel as? DSMapVM else { return }
        self.viewModel = viewModel
        update(viewModel: viewModel)
    }
    
    func update(viewModel: DSMapVM) {
        
        text.set(text: viewModel.text, designableTextColor: viewModel.viewColors().text)
         
        image.backgroundColor = appearance.secondaryView.background
        image.image = nil
        image.setMapImage(coordinate: viewModel.coordinate)
        
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
        
        image.roundCorner(with: .all, radius: cornerRadius)
        updateColors(viewColors: viewModel.viewColors())
        
        image.clipsToBounds = true
        
        switch viewModel.style.displayStyle {
        
        case .default:
            leftImageSpace.constant = 0
            rightImageSpace.constant = 0
            bottomImageSpace.constant = 0
            
            image.layer.cornerRadius = viewModel.viewColors().cornerRadius
            
            if text.text == "" {
                textLabelMapImageSpace.constant = 0
            } else {
                textLabelMapImageSpace.constant = appearance.interItemSpacing
            }
            
        case .grouped(inSection: _):
            
            leftImageSpace.constant = -appearance.groupMargins
            rightImageSpace.constant = -appearance.groupMargins
            bottomImageSpace.constant = -appearance.groupMargins
            image.layer.cornerRadius = 0
            
            if text.text == "" {
                textLabelMapImageSpace.constant = -appearance.groupMargins
            } else {
                textLabelMapImageSpace.constant = appearance.interItemSpacing
            }
        }
    }
    
    func updateColors(viewColors colors: DSDesignableViewColors) {        
        backgroundColor = .clear
        locationIndicator.tintColor = colors.text.headline
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    class func instanceFromNib() -> DSMapUIView {
        let view: DSMapUIView = initFromNib()
        return view
    }
}
