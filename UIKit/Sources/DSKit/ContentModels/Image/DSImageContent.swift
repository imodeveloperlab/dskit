//
//  DSImageValue.swift
//  DSKit
//
//  Created by Borinschi Ivan on 21.01.2021.
//  Copyright © 2021 Borinschi Ivan. All rights reserved.
//

import UIKit

public enum DSImageContent: Equatable, Hashable {
    
    case sfSymbol(name: String, style: DSSFSymbolConfigStyle)
    case image(image: UIImage?)
    case imageURL(url: URL?)
    
    public var rawValue: String {
        switch self {
        case .image(image: _):
            return "ImageTypeUIImage"
        case .imageURL(url: _):
            return "ImageTypeURL"
        case .sfSymbol(name: let name, style: _):
            return "ImageTypeSymbol\(name)"
        }
    }
    
    public var image: UIImage? {
        switch self {
        case .image(image: let image):
            return image
        case .sfSymbol(name: let name, style: let style):
            let configuration = DSSFSymbolConfig.symbolConfig(style: style)
            return UIImage.symbolImage(with: name, configuration: configuration)?.imageFlippedForRightToLeftLayoutDirection()
        case .imageURL(url: _):
            return nil
        }
    }
}

extension UIImageView {
    
    func setImageContent(_ image: DSImageContent) {
        
        switch image {
        case .sfSymbol(name: let sfSymbolName, style: let style):
            self.image = UIImage.symbolImage(with: sfSymbolName, configuration: DSSFSymbolConfig.symbolConfig(style: style))?.imageFlippedForRightToLeftLayoutDirection()
        case .image(image: let image):
            self.image = image
        case .imageURL(url: let url):
            self.setImage(with: url)
        }
    }
}
