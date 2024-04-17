//
//  DSCardUIView.swift
//  DSKit
//
//  Created by Borinschi Ivan on 29.12.2020.
//  Copyright © 2021 Borinschi Ivan. All rights reserved.
//
//

import UIKit

final class DSCardUIView: UIView, DSReusableUIView {
    
    @IBOutlet weak var gradientView: UIView!
    @IBOutlet var textTopConstraint: NSLayoutConstraint!
    @IBOutlet var textBottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var backgroundImageLeftConstraint: NSLayoutConstraint!
    @IBOutlet weak var backgroundImageTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var backgroundImageBottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var backgroundImageRightConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var decorationImage: UIImageView!
    var appearance = DSAppearance.shared.main
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var backgroundImage: UIImageView!
    
    public var view: UIView { self }
    
    public func setUpWith(viewModel: DSViewModel) {
        
        guard let viewModel = viewModel as? DSCardVM else { return }
        update(viewModel: viewModel)
    }
    
    // Gradient layer
    lazy var gradient: CAGradientLayer = {
        let gradient = CAGradientLayer()
        gradient.colors = [
            UIColor.white.withAlphaComponent(0.0).cgColor,
            UIColor.black.withAlphaComponent(0.0).cgColor,
        ]
        gradient.locations = [0.5, 1.0]
        return gradient
    }()
    
    func update(viewModel: DSCardVM) {
        
        textLabel.set(text: viewModel.composer, designableTextColor: viewModel.viewColors().text)
        updateColors(viewColors: viewModel.viewColors(mirrored: true))
        
        if let content = viewModel.backgroundImage {
            backgroundImage.setImageContent(content)
        } else {
            backgroundImage.image = nil
        }
        
        switch viewModel.textPosition {
        case .top:
            textTopConstraint.isActive = true
            textBottomConstraint.isActive = false
        case .bottom:
            textTopConstraint.isActive = false
            textBottomConstraint.isActive = true
        case .center:
            textTopConstraint.isActive = true
            textBottomConstraint.isActive = true
        }
        
        backgroundImageLeftConstraint.constant = -appearance.groupMargins
        backgroundImageTopConstraint.constant = -appearance.groupMargins
        backgroundImageBottomConstraint.constant = -appearance.groupMargins
        backgroundImageRightConstraint.constant = -appearance.groupMargins
        
        // Gradient
        gradientView.backgroundColor = .clear
        gradient.setColors([viewModel.gradientTopColor.cgColor, viewModel.gradientBottomColor.cgColor],
                           locations: [viewModel.gradientTopPosition, viewModel.gradientBottomPosition])
        
        // Decoration image
        if let image = viewModel.decorationImage {
            decorationImage.image = image
            decorationImage.tintColor = appearance.brandColor
            decorationImage.isHidden = false
        } else {
            decorationImage.isHidden = true
        }
    }
    
    func updateColors(viewColors colors: DSDesignableViewColors) {
        
        backgroundColor = .clear
        backgroundImage.tintColor = appearance.brandColor
        backgroundImage.alpha = 1.0
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        gradientView.layer.addSublayer(gradient)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        gradient.frame = gradientView.bounds
    }
    
    class func instanceFromNib() -> DSCardUIView {
        let view: DSCardUIView = initFromNib()
        return view
    }
}

extension CAGradientLayer {
    
    func setColors(_ newColors: [CGColor],
                   locations: [NSNumber],
                   animated: Bool = true,
                   withDuration duration: TimeInterval = 0,
                   timingFunctionName name: CAMediaTimingFunctionName? = nil) {
        
        if !animated {
            self.colors = newColors
            self.locations = locations
            return
        }
        
        let colorAnimation = CABasicAnimation(keyPath: "colors")
        colorAnimation.fromValue = colors
        colorAnimation.toValue = newColors
        colorAnimation.duration = duration
        colorAnimation.isRemovedOnCompletion = false
        colorAnimation.fillMode = CAMediaTimingFillMode.forwards
        colorAnimation.timingFunction = CAMediaTimingFunction(name: name ?? .linear)
        
        let locationsAnimation = CABasicAnimation(keyPath: "locations")
        locationsAnimation.fromValue = self.locations
        locationsAnimation.toValue = locations
        locationsAnimation.isRemovedOnCompletion = false
        locationsAnimation.fillMode = CAMediaTimingFillMode.forwards
        locationsAnimation.timingFunction = CAMediaTimingFunction(name: name ?? .linear)

        add(colorAnimation, forKey: "colorsChangeAnimation")
        add(locationsAnimation, forKey: "locationsAnimation")
    }
}
