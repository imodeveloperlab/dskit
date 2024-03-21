//
//  DSViewModelBorderStyle.swift
//  DSKit
//
//  Created by Borinschi Ivan on 21.01.2021.
//  Copyright © 2021 Borinschi Ivan. All rights reserved.
//

//import SwiftUI
//
///// View model display style
//public enum DSViewModelBorderStyle: Equatable, Hashable {
//    
//    case none
//    case buttonColor
//    case brandColor
//    case custom(width: CGFloat, color: UIColor)
//    
//    /// Raw value
//    var rawValue: String {
//        switch self {
//        case .none:
//            return "none"
//        case .buttonColor:
//            return "buttonColor"
//        case .brandColor:
//            return "brandColor"
//        case .custom(let width, let color):
//            return "\(width)\(color.dsDescription)"
//        }
//    }
//}
//
//struct DSViewModelBorderStyleModifier: ViewModifier {
//    let style: DSViewModelBorderStyle
//    let colors: DSDesignableViewColors?
//    func body(content: Content) -> some View {
//        switch style {
//        case .none:
//            content
//                .border(Color.clear, width: 0)
//        case .buttonColor:
//            let color = colors?.button.background ?? DSAppearance.shared.appearance.primaryView.button.background
//            content
//                .border(Color(color), width: 2.0)
//        case .brandColor:
//            content
//                .border(Color(DSAppearance.shared.appearance.brandColor), width: 2.0)
//        case .custom(let width, let color):
//            content
//                .border(Color(color), width: width)
//        }
//    }
//}
//
//extension View {
//    func setViewBorderStyle(
//        style: DSViewModelBorderStyle
//    ) -> some View {
//        let modifier = DSViewModelBorderStyleModifier(
//            style: style,
//            colors: nil
//        )
//        return self.modifier(modifier)
//    }
//}
//
//#Preview {
//    VStack {
//        DSText("Brand").dsPadding().background(Color.white).setViewBorderStyle(style: .brandColor)
//        DSText("Button").dsPadding().background(Color.white).setViewBorderStyle(style: .buttonColor)
//        DSText("Custom").dsPadding().background(Color.white).setViewBorderStyle(style: .custom(width: 1, color: .red))
//    }.dsPadding()
//}
