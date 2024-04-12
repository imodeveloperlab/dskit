//
//  DSActionVM+LeftContent.swift
//  DSKit
//
//  Created by Borinschi Ivan on 03.02.2021.
//  Copyright © 2021 Borinschi Ivan. All rights reserved.
//

import Foundation
import UIKit

public extension DSActionVM {
    
    /// Left image with UIImage, style, size, and content mode
    /// - Parameters:
    ///   - image: UIImage?
    ///   - style: DSImageDisplayStyle
    ///   - size: DSImageSize
    ///   - contentMode: DSImageContentMode
    mutating func leftImage(image: UIImage?,
                            style: DSImageDisplayStyle = .themeCornerRadius,
                            size: DSImageSize = .size(CGSize(width: 50, height: 50)),
                            contentMode: DSImageContentMode = .scaleAspectFill,
                            tintColor: DSImageTintColor = .text(.headline)) {
        
        let image = DSImage(content: .image(image: image),
                            displayStyle: style,
                            size: size,
                            tintColor: tintColor,
                            contentMode: contentMode)
        
        self.leftView = DSView(.image(image))
    }
    
    /// Left image with url, style, size, and content mode
    /// - Parameters:
    ///   - image: UIImage?
    ///   - style: DSImageDisplayStyle
    ///   - size: DSImageSize
    ///   - contentMode: DSImageContentMode
    mutating func leftImage(url: URL?,
                            style: DSImageDisplayStyle = .themeCornerRadius,
                            size: DSImageSize = .size(CGSize(width: 50, height: 50)),
                            contentMode: DSImageContentMode = .scaleAspectFill) {
        
        let image = DSImage(content: .imageURL(url: url),
                            displayStyle: style,
                            size: size,
                            tintColor: .text(.headline),
                            contentMode: contentMode)
        
        self.leftView = DSView(.image(image))
    }
    
    /// Left round image from URL
    /// - Parameters:
    ///   - url: URL
    ///   - size: CGSize
    mutating func leftRoundImage(url: URL?,
                                 size: CGSize = CGSize(width: 50, height: 50)) {
        
        let image = DSImage(content: .imageURL(url: url),
                            displayStyle: .circle, size: .size(size),
                            tintColor: .text(.headline),
                            contentMode: .scaleAspectFill)
        
        self.leftView = DSView(.image(image))
    }
    
    /// Left round image with UIImage
    /// - Parameters:
    ///   - url: UIImage
    ///   - size: CGSize
    mutating func leftRoundImage(image: UIImage?,
                                 size: CGSize = CGSize(width: 50, height: 50)) {
        
        let image = DSImage(content: .image(image: image),
                            displayStyle: .circle, size: .size(size),
                            tintColor: .text(.headline),
                            contentMode: .scaleAspectFill)
        
        self.leftView = DSView(.image(image))
    }
    
    /// Left icon with sf symbol
    /// - Parameters:
    ///   - sfSymbolName: String
    ///   - size: CGSize
    ///   - displayStyle: DSImageDisplayStyle
    ///   - tintColor: DSImageTintColor
    mutating func leftIcon(sfSymbolName: String,
                           size: CGSize = CGSize(width: 25, height: 25),
                           displayStyle: DSImageDisplayStyle = .default,
                           tintColor: DSImageTintColor = .text(.headline)) {
        
        let image = DSImage(content: .sfSymbol(name: sfSymbolName, style: .medium),
                            displayStyle: .default, size: .size(size),
                            tintColor: tintColor)
        
        self.leftView = DSView(.image(image))
    }
}
