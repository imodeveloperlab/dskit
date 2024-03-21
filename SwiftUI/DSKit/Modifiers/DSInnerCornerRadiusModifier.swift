//
//  DSInnerCornerRadiusModifier.swift
//  DSKit
//
//  Created by Borinschi Ivan on 21.01.2021.
//  Copyright © 2021 Borinschi Ivan. All rights reserved.
//

//import SwiftUI
//
//public struct DSInnerCornerRadiusModifier: ViewModifier {
//    
//    @Environment(\.appearance) var appearance: DSDesignable
//    let padding: DSDimension
//    let parentPadding: DSDimension?
//
//    public init(padding: DSDimension, parentPadding: DSDimension?) {
//        self.padding = padding
//        self.parentPadding = parentPadding
//    }
//    
//    public func body(content: Content) -> some View {
//        
//        if let parentPadding {
//            let cornerRadius = (appearance.primaryView.cornerRadius - appearance.size.number(for: parentPadding)) - appearance.size.number(for: padding)
//            content
//                .cornerRadius(cornerRadius <= 0 ? 3 : cornerRadius)
//        } else {
//            let cornerRadius = appearance.primaryView.cornerRadius - appearance.size.number(for: padding)
//            content
//                .cornerRadius(cornerRadius <= 0 ? 3 : cornerRadius)
//        }
//    }
//}
//
//public extension View {
//    func dsInnerCornerRadius(
//        padding: DSDimension,
//        parentPadding: DSDimension? = nil
//    ) -> some View {
//        let modifier = DSInnerCornerRadiusModifier(
//            padding: padding,
//            parentPadding: parentPadding
//        )
//        return self.modifier(modifier)
//    }
//}
//
//struct DSInnerCornerRadiusModifier_Previews: PreviewProvider {
//    static var previews: some View {
//        PreviewForEach {
//            DSFullScreen {
//                DSVStack {
//                    DSCard {
//                        DSVStack {
//                            DSText("Default")
//                            DSVStack {
//                                DSText("Default")
//                            }
//                            .dsPadding()
//                            .frame(maxWidth: .infinity, alignment: .center)
//                            .dsSecondaryBackground()
//                            .dsInnerCornerRadius(padding: .small)
//                        }
//                        .dsPadding(.extraSmall)
//                        .frame(maxWidth: .infinity, alignment: .center)
//                        .dsBackground()
//                        .dsInnerCornerRadius(padding: .smaller)
//                    }.dsCardPadding(.extraSmall)
//                }.dsPadding()
//            }
//        }
//    }
//}
