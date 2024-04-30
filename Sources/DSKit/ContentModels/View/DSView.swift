//
//  DSView.swift
//  DSKit
//
//  Created by Borinschi Ivan on 19.01.2021.
//  Copyright © 2021 Borinschi Ivan. All rights reserved.
//

import UIKit
import Cartography

struct DSView: DSViewable, Equatable, Hashable {
    
    var content: DSViewContent
    
    public enum DSViewContent: Equatable, Hashable {
        
        case button(DSButton)
        case image(DSImage)
        case text(DSTextComposer)
        case price(DSPrice)
        
        var rawValue: String {
            switch self {
            case .image(_):
                return "Image"
            case .button(_):
                return "Button"
            case .text(_):
                return "Text"
            case .price(_):
                return "Price"
            }
        }
    }
    
    public func view(_ designableViewColors: DSDesignableViewColors) -> UIView {
        
        switch content {
        case .button(let button):
            return button.view(designableViewColors)
        case .image(let image):
            return image.view(designableViewColors)
        case .text(let text):
            return text.view(designableViewColors)
        case .price(let price):
            return price.view(designableViewColors)
        }
    }
    
    public init(_ content: DSViewContent) {
        self.content = content
    }
}

protocol DSViewable {
    func view(_ designableViewColors: DSDesignableViewColors) -> UIView
}

extension UIView {
    
    func set(view: DSView?, designableViewColors: DSDesignableViewColors) {
        
        backgroundColor = .clear
        
        for cons in self.constraints {
            self.removeConstraint(cons)
        }
        
        self.clearAllSubViews()
        
        if let uiView = view?.view(designableViewColors) {
            
            uiView.backgroundColor = .clear
            self.addSubview(uiView)
            
            constrain(uiView, self) { uiView, superView in
                uiView.edges == superView.edges
            }
            
        } else {
            
            constrain(self) { superView in
                superView.width == 0
            }
        }
    }
}
