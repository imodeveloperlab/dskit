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
    var viewColors: DSDesignableViewStyle {
        return viewStyle.colors(from: appearance)
    }
    
    var navigationBarColors: DSDesignableNavigationBarColor {
        return appearance.navigationBar
    }
}
