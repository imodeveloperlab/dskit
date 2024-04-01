//
//  DSCard.swift
//  DSKit
//
//  Created by Ivan Borinschi on 15.12.2022.
//

//import SwiftUI
//
//public struct DSCard<Content: View>: View {
//    
//    @ViewBuilder var content: () -> Content
//    
//    public init(@ViewBuilder content: @escaping () -> Content) {
//        self.content = content
//    }
//    
//    public var body: some View {
//        content()
//            .dsPadding()
//            .dsSecondaryBackground()
//            .dsCornerRadius()
//    }
//}
//
//struct DSContent_Previews: PreviewProvider {
//    static var previews: some View {
//        PreviewForEach {
//            DSFullScreen {
//                DSVStack {
//                    DSCard {
//                        DSHStack {
//                            DSText("Demo", .headline)
//                            DSImageView(sfSymbol: "eraser.line.dashed.fill", size: .medium, tint: .text(.headline))
//                        }
//                    }
//                }.dsPadding()
//            }
//        }
//    }
//}
