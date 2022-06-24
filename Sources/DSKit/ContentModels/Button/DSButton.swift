//
//  UIButtonExtension.swift
//  DSKit
//
//  Created by Borinschi Ivan on 22.12.2020.
//  Copyright © 2021 Borinschi Ivan. All rights reserved.
//

import UIKit

public struct DSButton: Equatable, Hashable {
    
    public init(title: String? = nil,
                sfSymbolName: String? = nil,
                style: DSSFSymbolConfigStyle = .medium,
                action: @escaping () -> Void) {
        
        self.title = title
        self.style = style
        self.action = action
        
        if let sfSymbolName = sfSymbolName {
            self.imageContent = DSImageContent.sfSymbol(name: sfSymbolName, style: style)
        }
    }
    
    public init(title: String? = nil,
                image: DSImageContent,
                style: DSSFSymbolConfigStyle = .medium,
                action: @escaping () -> Void) {
        
        self.title = title
        self.style = style
        self.action = action
        self.imageContent = image
    }
    
    public init(title: String,
                image: DSImageContent? = nil,
                style: DSSFSymbolConfigStyle = .medium,
                action: @escaping () -> Void) {
        
        self.title = title
        self.style = style
        self.action = action
        self.imageContent = image
    }
    
    public let title: String?
    public var imageContent: DSImageContent?
    public var style: DSSFSymbolConfigStyle
    
    @NonEquatable public var action: () -> Void
}

extension DSButton: DSViewable {
    
    public func view(_ designableViewColors: DSDesignableViewColors) -> UIView {
        
        let button = ImoButton()
        button.setUp(button: self, designableViewColors: designableViewColors)
        
        button.didTouchUpInside = { button in
            self.action()
        }
        
        return button
    }
}

extension UIButton {
    
    func setUp(button: DSButton, designableViewColors: DSDesignableViewColors) {
        
        setTitle(button.title, for: .normal)
        setImage(button.imageContent?.image, for: .normal)
        
        let appearance = DSAppearance.shared.main
        let font = appearance.fonts.headline.withSize(DSSFSymbolConfig.fontSize(style: button.style)-1)
        
        transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
        titleLabel?.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
        imageView?.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
        
        let buttonColor = designableViewColors.button.background
        setTitleColor(buttonColor, for: .normal)
        setTitleColor(buttonColor.shade(.C500), for: .disabled)
        setTitleColor(buttonColor.tint(.C500), for: .highlighted)
        titleLabel?.font = font
        tintColor = buttonColor
    }
}
