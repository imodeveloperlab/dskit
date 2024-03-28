//
//  AboutUsScreen1.swift
//  DSKitCore
//
//  Created by Ivan Borinschi on 31.13.3033.
//

import SwiftUI
import DSKit

struct AboutUsScreen1: View {
    
    @State private var isSwitchOn = true
    @Environment(\.appearance) var appearance: DSAppearance
    
    let imageGallery = [p1Image, p2Image, p3Image]
    
    var body: some View {
        ScrollView {
            DSVStack(spacing: .regular) {
                DSVStack {
                    DSText("Our Story", .title2)
                    DSText("Start working with DSKit that can provide everything you need to generate any interface you need. Dummy text is text that is used in the publishing industry or by web designers to occupy the space which will later be filled with 'real' content.", .body)
                }
                
                DSCoverFlow(height: 250, data: imageGallery, id: \.self) { image in
                    DSImageView(url: image).dsCornerRadius()
                }
                
                DSVStack(alignment: .leading) {
                    DSHStack {
                        DSImageView(sfSymbol: "message.fill", size: .medium, tint: .text(.body))
                        DSText(DSFaker().text, .caption1).frame(maxWidth: .infinity, alignment: .leading)
                    }
                    DSDivider().background(appearance.secondaryView.separator.color)
                    DSHStack {
                        DSImageView(sfSymbol: "shippingbox.fill", size: .medium, tint: .text(.body))
                        DSText(DSFaker().text, .subheadline).frame(maxWidth: .infinity, alignment: .leading)
                    }
                    DSDivider().background(appearance.secondaryView.separator.color)
                    DSHStack {
                        DSImageView(sfSymbol: "leaf.arrow.triangle.circlepath", size: .medium, tint: .text(.body))
                        DSText(DSFaker().text, .footnote).frame(maxWidth: .infinity, alignment: .leading)
                    }
                }.dsCardStyle()
            }
        }.dsScreen()
    }
}

struct AboutUsScreen1_Previews: PreviewProvider {
    static var previews: some View {
        PreviewForEach { AboutUsScreen1() }
    }
}

fileprivate let p1Image = URL(string: "https://images.pexels.com/photos/1036857/pexels-photo-1036857.jpeg?cs=srgb&dl=pexels-artem-beliaikin-1036857.jpg&fm=jpg")


fileprivate let p2Image = URL(string: "https://images.pexels.com/photos/264636/pexels-photo-264636.jpeg?cs=srgb&dl=pexels-pixabay-264636.jpg&fm=jpg")

fileprivate let p3Image = URL(string: "https://images.pexels.com/photos/1402407/pexels-photo-1402407.jpeg?cs=srgb&dl=pexels-lisa-fotios-1402407.jpg&fm=jpg")
