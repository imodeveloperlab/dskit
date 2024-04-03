//
//  DSText.swift
//  DSKit
//
//  Created by Ivan Borinschi on 14.12.2022.
//

import SwiftUI

struct DSTextStyleEnvironment: EnvironmentKey {
    static let defaultValue: DSTextStyle = .textFont(.body)
}

public extension EnvironmentValues {
    var textStyle: DSTextStyle {
        get { self[DSTextStyleEnvironment.self] }
        set { self[DSTextStyleEnvironment.self] = newValue }
    }
}

public struct DSText: View {
    
    @Environment(\.appearance) var appearance: DSAppearance
    @Environment(\.viewStyle) var viewStyle: DSViewStyle
    @Environment(\.textStyle) var textStyle: DSTextStyle
    
    let text: String
    let multilineTextAlignment: TextAlignment
    
    public init(_ text: String, multilineTextAlignment: TextAlignment = .leading) {
        self.text = text
        self.multilineTextAlignment = multilineTextAlignment
    }
    
    public var body: some View {
        Text(text)
            .font(textStyle.font(for: appearance))
            .foregroundStyle(textStyle.color(for: appearance, and: viewStyle))
            .multilineTextAlignment(multilineTextAlignment)
            .dsDebuggable(debugColor: Color.orange.opacity(0.3))
    }
}

public extension DSText {
    
    func dsTextStyle(_ textFont: DSTextFont) -> some View {
        return self.environment(\.textStyle, DSTextStyle.textFont(textFont))
    }
    
    func dsTextStyle(_ textStyle: DSTextStyle) -> some View {
        return self.environment(\.textStyle, textStyle)
    }
    
    func dsTextStyle(_ textFont: DSTextFont, _ size: CGFloat) -> some View {
        return self.environment(\.textStyle, .textFont(.fontWithSize(textFont, size)))
    }
    
    func dsTextStyle(_ textFont: DSTextFont, _ size: CGFloat, _ dsColor: DSColor) -> some View {
        return self.environment(\.textStyle, .textFontWithColor(.fontWithSize(textFont, size), dsColor))
    }
    
    func dsTextStyle(_ textFont: DSTextFont, _ size: CGFloat, _ color: Color) -> some View {
        return self.environment(\.textStyle, .textFontWithColor(.fontWithSize(textFont, size), .color(color)))
    }
    
    func dsTextStyle(_ textStyle: DSTextStyle, _ dsColor: DSColor) -> some View {
        return self.environment(\.textStyle, .reStyleWithColor(textStyle, dsColor))
    }
    
    func dsTextStyle(_ textStyle: DSTextStyle, _ color: Color) -> some View {
        return self.environment(\.textStyle, .reStyleWithColor(textStyle, .color(color)))
    }
    
    func dsTextStyle(_ textFont: DSTextFont, _ dsColor: DSColor) -> some View {
        return self.environment(\.textStyle, .textFontWithColor(textFont, dsColor))
    }
    
    func dsTextStyle(_ textFont: DSTextFont, _ color: Color) -> some View {
        return self.environment(\.textStyle, .textFontWithColor(textFont, .color(color)))
    }
}

struct DSText_Previews: PreviewProvider {
    static var previews: some View {
        DSPreviewForEachAppearance {
            DSPreview {
                DSVStack {
                    DSText("Title 1").dsTextStyle(.largeTitle)
                    DSText("Title 1").dsTextStyle(.title1)
                    DSText("Title 2").dsTextStyle(.title2)
                    DSText("Title 3").dsTextStyle(.title3)
                    DSText("Headline").dsTextStyle(.headline)
                    DSText("Headline with size 20").dsTextStyle(.headline, 20)
                    DSText("Subheadline").dsTextStyle(.subheadline)
                    DSText("Subheadline with size 20").dsTextStyle(.headline, 20)
                    DSText("Body").dsTextStyle(.body)
                    DSText("Callout").dsTextStyle(.callout)
                    DSText("Caption 1").dsTextStyle(.caption1)
                    DSText("Caption 2").dsTextStyle(.caption2)
                    DSText("Footnote").dsTextStyle(.footnote)
                    
                    DSHStack {
                        DSText("Lorem Ipsum is simply dummy text of the printing and typesetting industry. ", multilineTextAlignment: .center).dsTextStyle(.footnote)
                        DSText("Lorem Ipsum is simply dummy text of the printing and typesetting industry. ", multilineTextAlignment: .leading).dsTextStyle(.footnote)
                        DSText("Lorem Ipsum is simply dummy text of the printing and typesetting industry. ", multilineTextAlignment: .trailing).dsTextStyle(.footnote)
                    }
                }.dsPadding()
            }
        }
    }
}
