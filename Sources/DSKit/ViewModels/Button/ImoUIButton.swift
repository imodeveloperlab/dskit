//
//  ImoUIButton.swift
//  DSKit
//
//  Created by Borinschi Ivan on 1/10/17.
//  Copyright © 2021 Borinschi Ivan. All rights reserved.
//

import UIKit
import Cartography

public enum ImoUIButtonStyle {
    case `default`
    case rounded
}

public enum DSKitPayButtonStyle {
    case `default`
    case green
    case yellow
}

open class ImoUIButton: UIView {
    
    var edgesConstraints = ConstraintGroup()
    
    var blurView: UIVisualEffectView!
    var viewModel: DSButtonVM?
    
    public var object: Any?
    public var isEdgeToEdgeStyle = false
    public var isCenteredVertically = false
    public var button = ImoButton()
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        translatesAutoresizingMaskIntoConstraints = false
        setUp()
    }
    
    public init() {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        setUp()
    }
    
    func setUp() {
        
        self.blurView = UIVisualEffectView(effect: UIBlurEffect(style: UIBlurEffect.Style.systemUltraThinMaterialLight))
        self.blurView.isUserInteractionEnabled = false
        self.blurView.isHidden = true
        self.blurView.backgroundColor = .clear
        self.blurView.frame = self.frame
        
        addSubview(blurView)
        addSubview(button)
        updateEdgeConstraints()
    }
    
    open override func layoutIfNeeded() {
        
        super.layoutIfNeeded()
        updateEdgeConstraints()
    }
    
    func updateEdgeConstraints() {
        
        constrain(self, button, replace: edgesConstraints) { view, button in
            button.left == view.left
            button.right == view.right
            button.top == view.top
            button.bottom == view.bottom
        }
    }
    
    public var title: String? {
        
        get { return button.currentTitle }
        set {
            let newTitle = newValue
            button.setTitle(newTitle, for: .normal)
            button.setTitle(newTitle, for: .disabled)
        }
    }
    
    public var isEnabled: Bool {
        
        get { return button.isEnabled }
        set {
            button.isEnabled = newValue
        }
    }
    
    public var isHighlighted: Bool {
        
        get { return button.isHighlighted }
        set {
            button.isHighlighted = newValue
        }
    }
    
    func defaultAppearance(icon: UIImage? = nil, buttonColor: DSDesignableButtonColor) {
        
        button.setTitleColor(buttonColor.title, for: .normal)
        button.setTitleColor(buttonColor.title.shade(.C300), for: .highlighted)
        button.setTitleColor(buttonColor.title.shade(.C900), for: .disabled)
        
        button.setBackgroundColor(color: buttonColor.background, forState: .normal)
        button.setBackgroundColor(color: buttonColor.background.shade(.C300), forState: .highlighted)
        button.setBackgroundColor(color: buttonColor.background.shade(.C900), forState: .disabled)
        
        button.tintColor = buttonColor.title
    }
    
    func facebookAppearance(icon: UIImage? = nil, buttonColor: DSDesignableButtonColor) {
        
        button.setTitleColor(UIColor.white, for: .normal)
        button.setTitleColor(UIColor.white.shade(.C300), for: .highlighted)
        button.setTitleColor(UIColor.white.shade(.C900), for: .disabled)
        
        button.setBackgroundColor(color: UIColor(0x4267B2), forState: .normal)
        button.setBackgroundColor(color: UIColor(0x4267B2).shade(.C300), forState: .highlighted)
        button.setBackgroundColor(color: UIColor(0x4267B2).shade(.C900), forState: .disabled)
        
        button.tintColor = UIColor.white
    }
    
    func twitterAppearance(icon: UIImage? = nil, buttonColor: DSDesignableButtonColor) {
        
        button.setTitleColor(UIColor.white, for: .normal)
        button.setTitleColor(UIColor.white.shade(.C300), for: .highlighted)
        button.setTitleColor(UIColor.white.shade(.C900), for: .disabled)
        
        button.setBackgroundColor(color: UIColor(0x1DA1F2), forState: .normal)
        button.setBackgroundColor(color: UIColor(0x1DA1F2).shade(.C300), forState: .highlighted)
        button.setBackgroundColor(color: UIColor(0x1DA1F2).shade(.C900), forState: .disabled)
        
        button.tintColor = UIColor.white
    }
    
    func blurAppearance(effect: UIBlurEffect.Style, color: DSTextColor) {
        
        backgroundColor = .clear
        button.backgroundColor = .clear
        
        button.setBackgroundColor(color: .clear, forState: .normal)
        button.setBackgroundColor(color: .clear, forState: .highlighted)
        button.setBackgroundColor(color: .clear, forState: .disabled)
        
        self.blurView.roundCorner(with: .all, radius: viewModel?.viewColors().cornerRadius ?? 0, delay: 0.0)
        self.blurView.isHidden = false
        self.blurView.effect = UIBlurEffect(style: effect)
        
        if let colors = viewModel?.viewColors().text {
            let color = color.getColor(designableTextColor: colors)
            button.tintColor = color
            button.setTitleColor(color, for: .normal)
            button.setTitleColor(color.shade(.C300), for: .highlighted)
            button.setTitleColor(color.shade(.C900), for: .disabled)
        }
    }
    
    func lightAppearance(buttonColor: DSDesignableButtonColor) {
        
        button.setTitleColor(buttonColor.background, for: .normal)
        button.setTitleColor(buttonColor.background.shade(.C600), for: .highlighted)
        button.setTitleColor(buttonColor.background.shade(.C900), for: .disabled)
        
        button.setBackgroundColor(color: buttonColor.background.lighten(.C800), forState: .normal)
        button.setBackgroundColor(color: buttonColor.background.lighten(.C700), forState: .highlighted)
        button.setBackgroundColor(color: buttonColor.background.lighten(.C500), forState: .disabled)
        
        button.tintColor = buttonColor.background
    }
    
    func secondaryViewAppearance(buttonColor: DSDesignableButtonColor) {
        
        let appearance = DSAppearance.shared.main.secondaryView
        
        button.setTitleColor(appearance.text.headline, for: .normal)
        button.setTitleColor(appearance.text.headline.shade(.C600), for: .highlighted)
        button.setTitleColor(appearance.text.headline.shade(.C900), for: .disabled)
        
        button.setBackgroundColor(color: appearance.background, forState: .normal)
        button.setBackgroundColor(color: appearance.background.lighten(.C700), forState: .highlighted)
        button.setBackgroundColor(color: appearance.background.lighten(.C500), forState: .disabled)
        
        button.tintColor = appearance.text.headline
    }
    
    func primaryViewWithBorder(buttonColor: DSDesignableButtonColor) {
        
        let appearance = DSAppearance.shared.main.primaryView
        
        button.setTitleColor(appearance.text.headline, for: .normal)
        button.setTitleColor(appearance.text.headline.shade(.C600), for: .highlighted)
        button.setTitleColor(appearance.text.headline.shade(.C900), for: .disabled)
        
        button.setBackgroundColor(color: appearance.background, forState: .normal)
        button.setBackgroundColor(color: appearance.background.lighten(.C700), forState: .highlighted)
        button.setBackgroundColor(color: appearance.background.lighten(.C500), forState: .disabled)
        
        button.layer.borderWidth = 1.0
        button.layer.borderColor = DSAppearance.shared.main.secondaryView.background.cgColor
        
        button.tintColor = appearance.background
    }
    
    func cleanViewWithBorder(buttonColor: DSDesignableButtonColor) {
        
        let appearance = DSAppearance.shared.main.primaryView
        
        button.setTitleColor(appearance.button.background, for: .normal)
        button.setTitleColor(appearance.button.background.shade(.C600), for: .highlighted)
        button.setTitleColor(appearance.button.background.shade(.C900), for: .disabled)
        
        button.setBackgroundColor(color: UIColor.clear, forState: .normal)
        button.setBackgroundColor(color: UIColor.clear, forState: .highlighted)
        button.setBackgroundColor(color: UIColor.clear, forState: .disabled)
        
        button.layer.borderWidth = 1.0
        button.layer.borderColor = appearance.button.background.cgColor
        button.tintColor = appearance.button.background
    }
    
    func linkAppearance(buttonColor: DSDesignableButtonColor) {
        
        button.setTitleColor(buttonColor.background, for: .normal)
        button.setTitleColor(buttonColor.background.shade(.C500), for: .disabled)
        button.setTitleColor(buttonColor.background.tint(.C500), for: .highlighted)
        
        button.backgroundColor = .clear
        button.setBackgroundImage(nil, for: .normal)
        button.setBackgroundImage(nil, for: .highlighted)
        button.setBackgroundImage(nil, for: .disabled)
        button.tintColor = .clear
        button.tintColor = buttonColor.background
    }
    
    func linkDarkAppearance(buttonColor: DSDesignableButtonColor) {
        
        button.setTitleColor(UIColor.black, for: .normal)
        button.setTitleColor(UIColor.black.shade(.C500), for: .disabled)
        button.setTitleColor(UIColor.black.tint(.C500), for: .highlighted)
        
        button.backgroundColor = .clear
        button.setBackgroundImage(nil, for: .normal)
        button.setBackgroundImage(nil, for: .highlighted)
        button.setBackgroundImage(nil, for: .disabled)
        button.tintColor = .clear
        button.tintColor = UIColor.black
    }
    
    func linkWhiteAppearance(buttonColor: DSDesignableButtonColor) {
        
        button.setTitleColor(UIColor.white, for: .normal)
        button.setTitleColor(UIColor.white.shade(.C500), for: .disabled)
        button.setTitleColor(UIColor.white.tint(.C500), for: .highlighted)
        
        button.backgroundColor = .clear
        button.setBackgroundImage(nil, for: .normal)
        button.setBackgroundImage(nil, for: .highlighted)
        button.setBackgroundImage(nil, for: .disabled)
        button.tintColor = .clear
        button.tintColor = UIColor.white
    }
    
    func setUpWith(viewModel model: DSButtonVM) {
        self.viewModel = model
        setNeedsLayout()
    }
    
    open override func layoutSubviews() {
        
        super.layoutSubviews()
        
        self.blurView.frame = button.frame
        
        if isCenteredVertically {
            button.centerVertically()
        }
        
        let appearance = DSAppearance.shared.main
        
        guard let model = viewModel else {
            return
        }
        
        if model.icon != nil {
            
            if let text = model.text {
                title = " \(text)"
            } else {
                title = nil
            }
            
            button.setImage(model.icon, for: .normal)
            button.setInsets(forContentPadding: button.contentEdgeInsets, imageTitlePadding: 3)
            
        } else {
            
            title = model.text
            button.setImage(nil, for: .normal)
            button.setInsets(forContentPadding: button.contentEdgeInsets, imageTitlePadding: 0)
        }
        
        button.accessibilityIdentifier = model.accessibilityIdentifier
        backgroundColor = .clear
        button.backgroundColor = .clear
        
        switch model.type {
        case .default:
            defaultAppearance(icon: model.icon, buttonColor: model.viewColors().button)
            button.titleLabel?.font = appearance.fonts.headline.withSize(15)
        case .link:
            linkAppearance(buttonColor: model.viewColors().button)
            button.titleLabel?.font = appearance.fonts.body.withSize(15)
        case .linkWhite:
            linkWhiteAppearance(buttonColor: model.viewColors().button)
            button.titleLabel?.font = appearance.fonts.body.withSize(15)
        case .linkBlack:
            linkDarkAppearance(buttonColor: model.viewColors().button)
            button.titleLabel?.font = appearance.fonts.body.withSize(15)
        case .light:
            lightAppearance(buttonColor: model.viewColors().button)
            button.titleLabel?.font = appearance.fonts.headline.withSize(15)
        case .secondaryView:
            secondaryViewAppearance(buttonColor: model.viewColors().button)
            button.titleLabel?.font = appearance.fonts.headline.withSize(15)
        case .primaryViewWithBorder:
            primaryViewWithBorder(buttonColor: model.viewColors().button)
            button.titleLabel?.font = appearance.fonts.headline.withSize(15)
        case .cleanWithBorder:
            cleanViewWithBorder(buttonColor: model.viewColors().button)
            button.titleLabel?.font = appearance.fonts.headline.withSize(15)
        case .facebook:
            facebookAppearance(icon: model.icon, buttonColor: model.viewColors().button)
            button.titleLabel?.font = appearance.fonts.headline.withSize(15)
        case .twitter:
            twitterAppearance(icon: model.icon, buttonColor: model.viewColors().button)
            button.titleLabel?.font = appearance.fonts.headline.withSize(15)
        case .blur(effect: let effect, color: let color):
            blurAppearance(effect: effect.style(), color: color)
            button.titleLabel?.font = appearance.fonts.headline.withSize(15)
        }
        
        button.titleLabel?.numberOfLines = 0
        button.titleLabel?.textAlignment = model.textAlignment
        button.isEnabled = model.isEnabled
        
        switch model.textAlignment {
        case .left:
            button.contentHorizontalAlignment = .left
            button.contentEdgeInsets = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 0)
        case .right:
            button.contentHorizontalAlignment = .right
            button.contentEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 15)
        default:
            button.contentHorizontalAlignment = .center
            button.contentEdgeInsets = UIEdgeInsets(top: 2, left: 2, bottom: 2, right: 2)
        }
        
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        button.layer.cornerRadius = model.viewColors().cornerRadius
        
        if button.frame.height / 2 < button.layer.cornerRadius {
            button.layer.cornerRadius = button.frame.height / 2
        }
        
        button.clipsToBounds = true
        
        //Sizes
        let titleWidth = button.titleLabel?.bounds.width ?? CGFloat(0)
        let imageWidth = button.imageView?.bounds.width ?? CGFloat(0)
        let space = titleWidth + imageWidth + appearance.margins
        
        // Image position
        switch model.imagePosition {
        case .left:
            
            let imageWidth = button.imageView?.bounds.width ?? CGFloat(0)
            
            if UIApplication.shared.isRTL {
                button.imageEdgeInsets = UIEdgeInsets(top: 0, left: imageWidth, bottom: 0, right: 0)
                button.titleEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
            }
            
        case .right:
            
            let titleWidth = button.titleLabel?.bounds.width ?? CGFloat(0)
            let imageWidth = button.imageView?.bounds.width ?? CGFloat(0)
            let space = titleWidth + imageWidth + appearance.margins
            
            if UIApplication.shared.isRTL {
                button.imageEdgeInsets = UIEdgeInsets(top: 0, left: -space, bottom: 0, right: 0)
                button.titleEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
            } else {
                button.imageEdgeInsets = UIEdgeInsets(top: 0, left: imageWidth, bottom: 0, right: -space)
                button.titleEdgeInsets = UIEdgeInsets(top: 0, left: -titleWidth, bottom: 0, right: 0)
            }
            
        case .rightMargin:
            
            let buttonWidth = button.bounds.width
            button.imageEdgeInsets = UIEdgeInsets(top: 0, left: (buttonWidth - imageWidth - 30), bottom: 0, right: -space)
            
            switch model.textAlignment {
            case .left:
                button.titleEdgeInsets = UIEdgeInsets(top: 0, left: -(imageWidth + 3), bottom: 0, right: 0)
            case .right:
                button.titleEdgeInsets = UIEdgeInsets(top: 0, left: -titleWidth, bottom: 0, right: 0)
            default:
                button.titleEdgeInsets = UIEdgeInsets(top: 0, left: -titleWidth, bottom: 0, right: 0)
            }
            
        case .leftMargin:
            
            button.imageEdgeInsets = UIEdgeInsets(top: 0, left: appearance.margins, bottom: 0, right: space)
            
            switch model.textAlignment {
            case .left:
                button.titleEdgeInsets = UIEdgeInsets(top: 0, left: -(imageWidth + 3), bottom: 0, right: 0)
            case .right:
                button.titleEdgeInsets = UIEdgeInsets(top: 0, left: -titleWidth, bottom: 0, right: 0)
            default:
                button.titleEdgeInsets = UIEdgeInsets(top: 0, left: -titleWidth, bottom: 0, right: 0)
            }
        }
    }
}
