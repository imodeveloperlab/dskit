//
//  DSDesignable.swift
//  DSKit
//
//  Created by Ivan Borinschi on 14.03.2023.
//

import SwiftUI

public protocol DSDesignable {
    var appearance: DSAppearance { get }
    var viewStyle: DSViewStyle { get }
}

public extension DSDesignable {
    var viewColors: DSViewAppearanceProtocol {
        return viewStyle.colors(from: appearance)
    }
    
    var navigationBarColors: DSNavigationBarAppearanceProtocol {
        return appearance.navigationBar
    }
    
    func color(for colorKey: DSColorKey) -> Color {
        appearance.color(for: colorKey, viewStyle: viewStyle)
    }
}
