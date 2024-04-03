//
//  DSText.swift
//  DSKit
//
//  Created by Ivan Borinschi on 14.12.2022.
//

import SwiftUI

public struct DSText: View {
    
    @Environment(\.appearance) var appearance: DSAppearance
    @Environment(\.colorGroup) var colorGroup: DSViewStyle
    
    let type: DSTextStyle
    let text: String
    let multilineTextAlignment: TextAlignment
    
    public init(_ text: String, _ type: DSTextStyle = .body, multilineTextAlignment: TextAlignment = .leading) {
        self.text = text
        self.type = type
        self.multilineTextAlignment = multilineTextAlignment
    }
    
    public var body: some View {
        Text(text)
            .font(type.style(appearance: appearance).font.getFont(from: appearance))
            .foregroundStyle(Color(uiColor: type.style(appearance: appearance).color.getColor(appearance: appearance, colorGroup: colorGroup)))
            .multilineTextAlignment(multilineTextAlignment)
            .dsDebuggable(debugColor: Color.orange.opacity(0.3))
    }
}

struct DSText_Previews: PreviewProvider {
    static var previews: some View {
        DSPreviewForEachAppearance { DSPreview {
            DSVStack {
                DSText("Title 1", .largeTitle)
                DSText("Title 1", .title1)
                DSText("Title 2", .title2)
                DSText("Title 3", .title3)
                DSText("Headline", .headline)
                DSText("Headline with size 20", .style(.fontWithSize(.headline, 20)))
                DSText("Subheadline", .subheadline)
                DSText("Subheadline with size 20", .style(.fontWithSize(.headline, 20)))
                DSText("Body", .body)
                DSText("Callout", .callout)
                DSText("Caption 1", .caption1)
                DSText("Caption 2", .caption2)
                DSText("Footnote", .footnote)
                
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
