//
//  UIView+Border.swift
//  
//
//  Created by Zalan Mergl on 2022. 04. 14..
//

import UIKit

public extension UIView {
    func configureBorder(_ borderStyle: DSViewModelBorderStyle, viewColors: DSDesignableViewColors? = nil) {
        switch borderStyle {
        case .none:
            layer.borderWidth = 0
            layer.borderColor = UIColor.clear.cgColor
        case .buttonColor:
            layer.borderWidth = 2.0
            layer.borderColor = viewColors?.button.background.cgColor ?? DSAppearance.shared.main.primaryView.button.background.cgColor
        case .brandColor:
            layer.borderWidth = 2.0
            layer.borderColor = DSAppearance.shared.main.brandColor.cgColor
        case .custom(width: let width, color: let color):
            layer.borderWidth = width
            layer.borderColor = color.cgColor
        }
    }
}
