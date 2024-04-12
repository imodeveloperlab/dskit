//
//  DSQuantityPicker+rightContent.swift
//  DSKit
//
//  Created by Borinschi Ivan on 03.02.2021.
//  Copyright © 2021 Borinschi Ivan. All rights reserved.
//

import UIKit

public extension DSQuantityPickerVM {
    
    /// Right image with UIImage, style, size, and content mode
    /// - Parameters:
    ///   - image: UIImage?
    ///   - style: DSImageDisplayStyle
    ///   - size: DSImageSize
    ///   - contentMode: DSImageContentMode
    func rightImage(image: UIImage?,
                    style: DSImageDisplayStyle = .themeCornerRadius,
                    size: DSImageSize = .size(CGSize(width: 50, height: 50)),
                    contentMode: DSImageContentMode = .scaleAspectFill) {
        
        let image = DSImage(content: .image(image: image),
                            displayStyle: style,
                            size: size,
                            tintColor: .text(.headline),
                            contentMode: contentMode)
        
        self.rightView = DSView(.image(image))
    }
    
    /// Right image with name, style, size, and content mode
    /// - Parameters:
    ///   - image: UIImage?
    ///   - style: DSImageDisplayStyle
    ///   - size: DSImageSize
    ///   - contentMode: DSImageContentMode
    func rightImage(named: String,
                    style: DSImageDisplayStyle = .themeCornerRadius,
                    size: DSImageSize = .size(CGSize(width: 50, height: 50)),
                    contentMode: DSImageContentMode = .scaleAspectFill) {
        
        let image = DSImage(content: .image(image: UIImage(named: named)),
                            displayStyle: style,
                            size: size,
                            tintColor: .text(.headline),
                            contentMode: contentMode)
        
        self.rightView = DSView(.image(image))
    }
    
    /// Right image with url, style, size, and content mode
    /// - Parameters:
    ///   - image: UIImage?
    ///   - style: DSImageDisplayStyle
    ///   - size: DSImageSize
    ///   - contentMode: DSImageContentMode
    func rightImage(url: URL?,
                    style: DSImageDisplayStyle = .themeCornerRadius,
                    size: DSImageSize = .size(CGSize(width: 50, height: 50)),
                    contentMode: DSImageContentMode = .scaleAspectFill) {
        
        let image = DSImage(content: .imageURL(url: url),
                            displayStyle: style,
                            size: size,
                            tintColor: .text(.headline),
                            contentMode: contentMode)
        
        self.rightView = DSView(.image(image))
    }
    
    /// Right round image from URL
    /// - Parameters:
    ///   - url: URL
    ///   - size: CGSize
    func rightRoundImage(url: URL?,
                         size: CGSize = CGSize(width: 50, height: 50)) {
        
        let image = DSImage(content: .imageURL(url: url),
                            displayStyle: .circle, size: .size(size),
                            tintColor: .text(.headline),
                            contentMode: .scaleAspectFill)
        
        self.rightView = DSView(.image(image))
    }
    
    /// right round image with UIImage
    /// - Parameters:
    ///   - url: UIImage
    ///   - size: CGSize
    func rightRoundImage(image: UIImage?,
                         size: CGSize = CGSize(width: 50, height: 50)) {
        
        let image = DSImage(content: .image(image: image),
                            displayStyle: .circle, size: .size(size),
                            tintColor: .text(.headline),
                            contentMode: .scaleAspectFill)
        
        self.rightView = DSView(.image(image))
    }
    
    /// Right icon with SFSymbol icons
    /// - Parameters:
    ///   - sfSymbolName: SFSymbol Name
    ///   - size: CGSize
    func rightIcon(sfSymbolName: String,
                   size: CGSize = CGSize(width: 25, height: 25)) {
        
        let image = DSImage(content: .sfSymbol(name: sfSymbolName, style: .medium),
                            displayStyle: .default, size: .size(size),
                            tintColor: .text(.headline))
        
        self.rightView = DSView(.image(image))
    }
    
    /// Right button
    /// - Parameters:
    ///   - title: String?
    ///   - sfSymbolName: SFSymbolName
    ///   - style: DSSFSymbolConfigStyle
    ///   - action: Action closure
    func rightButton(title: String? = nil,
                     sfSymbolName: String? = nil,
                     style: DSSFSymbolConfigStyle = .medium,
                     action: @escaping () -> Void) {
        
        let button = DSButton(title: title,
                              sfSymbolName: sfSymbolName,
                              style: style,
                              action: action)
        
        self.rightView = DSView(.button(button))
    }
    
    /// Right button with SFSymbol
    /// - Parameters:
    ///   - sfSymbolName: SFSymbol name
    ///   - size: Button size
    ///   - tintColor: Button tint color
    func rightIcon(sfSymbolName: String,
                   size: CGSize = CGSize(width: 25, height: 25),
                   tintColor: DSImageTintColor = .default) {
        
        let image = DSImage(content: .sfSymbol(name: sfSymbolName, style: .medium), displayStyle: .default, size: .size(size), tintColor: tintColor)
        self.rightView = DSView(.image(image))
    }
    
    /// Set right arrow
    func rightArrow(size: CGSize = CGSize(width: 18, height: 20)) {
        
        let arrow = DSImage(content: .sfSymbol(name: "chevron.right", style: .medium),
                            size: .size(size),
                            tintColor: .text(.subheadline))
        
        self.rightView = DSView(.image(arrow))
    }
    
    /// Set right price
    func rightPrice(price: DSPrice) {
        self.rightView = DSView(.price(price))
    }
    
    /// Set right text
    func rightText(composer: DSTextComposer) {
        self.rightView = DSView(.text(composer))
    }
    
    /// Set right to nothing
    func rightNone() {
        self.rightView = nil
    }
}
