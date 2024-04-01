//
//  DSText.swift
//  DSKit
//
//  Created by Ivan Borinschi on 14.12.2022.
//

import SwiftUI

public struct DSText: View {
    
    @Environment(\.appearance) var appearance: DSAppearance
    @Environment(\.colorGroup) var colorGroup: DSColorGroup
    @Environment(\.debugLayout) var debugLayout: Bool
    
    let type: DSTextType
    let text: String
    let multilineTextAlignment: TextAlignment
    var color: DSColor?
    
    public init(_ text: String, _ type: DSTextType = .font(.body), multilineTextAlignment: TextAlignment = .leading, color: DSColor? = nil) {
        self.text = text
        self.type = type
        self.multilineTextAlignment = multilineTextAlignment
        self.color = color
    }
    
    public var body: some View {
        if debugLayout {
            styledText
                .background(Color.orange.opacity(0.3))
        } else {
            styledText
        }
    }
    
    @ViewBuilder
    var styledText: some View {
        if let color {
            Text(text)
                .font(type.style(appearance: appearance).font.getFont(from: appearance))
                .foregroundStyle(Color(uiColor: color.color(from: appearance)))
                .multilineTextAlignment(multilineTextAlignment)
        } else {
            Text(text)
                .font(type.style(appearance: appearance).font.getFont(from: appearance))
                .foregroundStyle(Color(uiColor: type.style(appearance: appearance).color.getColor(appearance: appearance, colorGroup: colorGroup)))
                .multilineTextAlignment(multilineTextAlignment)
        }
    }
}

struct DSText_Previews: PreviewProvider {
    static var previews: some View {
        PreviewForEach { DSPreview {
            DSVStack {
                DSText("Title 1", .font(.largeTitle))
                DSText("Title 1", .font(.title1))
                DSText("Title 2", .font(.title2))
                DSText("Title 3", .font(.title3))
                DSText("Headline", .font(.headline))
                DSText("Headline with size 20", .fontAndSize(.headline, 20))
                DSText("Subheadline", .font(.subheadline))
                DSText("Subheadline with size 20", .fontAndSize(.headline, 20))
                DSText("Body", .font(.body))
                DSText("Callout", .font(.callout))
                DSText("Caption 1", .font(.caption1))
                DSText("Caption 2", .font(.caption2))
                DSText("Footnote", .font(.footnote))
                
                DSHStack {
                    DSText("Lorem Ipsum is simply dummy text of the printing and typesetting industry. ", .font(.footnote), multilineTextAlignment: .center)
                    DSText("Lorem Ipsum is simply dummy text of the printing and typesetting industry. ", .font(.footnote), multilineTextAlignment: .leading)
                    DSText("Lorem Ipsum is simply dummy text of the printing and typesetting industry. ", .font(.footnote), multilineTextAlignment: .trailing)
                }
            }.dsPadding()
        }
        }
    }
}
