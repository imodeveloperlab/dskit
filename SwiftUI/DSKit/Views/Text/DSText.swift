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
    
    public init(_ text: String, _ type: DSTextType = .body, multilineTextAlignment: TextAlignment = .leading, color: DSColor? = nil) {
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
                    DSText("Title 1", .largeTitle)
                    DSText("Title 1", .title1)
                    DSText("Title 2", .title2)
                    DSText("Title 3", .title3)
                    DSText("Headline", .headline)
                    DSText("Headline with size 20", .headlineWithSize(20))
                    DSText("Subheadline", .subheadline)
                    DSText("Subheadline with size 20", .subheadlineWithSize(20))
                    DSText("Body", .body)
                    DSText("Callout", .callout)
                    DSText("Caption 1", .caption1)
                    DSText("Caption 2", .caption2)
                    DSText("Footnote", .footnote)
                    DSText("Headline with brand color", .text(font: .headline, color: .brand))
                    DSText("Custom", .custom(font: UIFont.systemFont(ofSize: 15), color: UIColor.red))
                    
                    DSHStack {
                        DSText("Lorem Ipsum is simply dummy text of the printing and typesetting industry. ", .footnote, multilineTextAlignment: .center)
                        DSText("Lorem Ipsum is simply dummy text of the printing and typesetting industry. ", .footnote, multilineTextAlignment: .leading)
                        DSText("Lorem Ipsum is simply dummy text of the printing and typesetting industry. ", .footnote, multilineTextAlignment: .trailing)
                    }
                }.dsPadding()
            }
        }
    }
}
