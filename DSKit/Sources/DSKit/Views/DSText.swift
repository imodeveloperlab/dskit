//
//  DSText.swift
//  DSKit
//
//  Created by Ivan Borinschi on 14.12.2022.
//

import SwiftUI

/*
## DSText

`DSText` is a SwiftUI component within the DSKit framework designed to display text with enhanced styling capabilities, allowing for customization according to the design system's guidelines. It integrates seamlessly with environmental settings for appearance and view style to ensure consistency across the application.

#### Initialization:
Initializes a `DSText` with the text content and optional alignment.
- Parameters:
- `text`: The text to be displayed.
- `multilineTextAlignment`: Alignment of the text within the view, defaulting to `.leading`.

#### Usage:
`DSText` is ideal for displaying any textual content where adherence to a design system is required. It supports multiple text styles and configurations, making it versatile for use in titles, body text, captions, and more.
*/

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
    
    func dsTextStyle(_ textFont: DSTextFontKey) -> some View {
        return self.environment(\.textStyle, DSTextStyle.textFont(textFont))
    }
    
    func dsTextStyle(_ textStyle: DSTextStyle) -> some View {
        return self.environment(\.textStyle, textStyle)
    }
    
    func dsTextStyle(_ textFont: DSTextFontKey, _ size: CGFloat) -> some View {
        return self.environment(\.textStyle, .textFont(.fontWithSize(textFont, size)))
    }
    
    func dsTextStyle(_ textFont: DSTextFontKey, _ size: CGFloat, _ dsColor: DSColorKey) -> some View {
        return self.environment(\.textStyle, .textFontWithColor(.fontWithSize(textFont, size), dsColor))
    }
    
    func dsTextStyle(_ textFont: DSTextFontKey, _ size: CGFloat, _ color: Color) -> some View {
        return self.environment(\.textStyle, .textFontWithColor(.fontWithSize(textFont, size), .color(color)))
    }
    
    func dsTextStyle(_ textStyle: DSTextStyle, _ dsColor: DSColorKey) -> some View {
        return self.environment(\.textStyle, .reStyleWithColor(textStyle, dsColor))
    }
    
    func dsTextStyle(_ textStyle: DSTextStyle, _ color: Color) -> some View {
        return self.environment(\.textStyle, .reStyleWithColor(textStyle, .color(color)))
    }
    
    func dsTextStyle(_ textFont: DSTextFontKey, _ dsColor: DSColorKey) -> some View {
        return self.environment(\.textStyle, .textFontWithColor(textFont, dsColor))
    }
    
    func dsTextStyle(_ textFont: DSTextFontKey, _ color: Color) -> some View {
        return self.environment(\.textStyle, .textFontWithColor(textFont, .color(color)))
    }
}

public indirect enum DSTextStyle: Equatable, Hashable {
    
    case textFont(DSTextFontKey)
    case textFontWithColor(DSTextFontKey, DSColorKey)
    case reStyleWithColor(DSTextStyle, DSColorKey)
    
    func textStyle(for appearance: DSAppearance) -> (font: DSTextFontKey, color: DSTextColorKey) {
        switch self {
        case .textFont(let font):
            return (font: font, color: DSTextColorKey.font(font))
        case .textFontWithColor(let font, let color):
            return (font: font, color: .dsColor(color))
        case .reStyleWithColor(let textStyle, let color):
            return (font: .fontWithSize(textStyle.dsTextFont, textStyle.dsTextFont.pointSize(for: appearance)), color: .dsColor(color))
        }
    }
    
    var dsTextFont: DSTextFontKey {
        return switch self {
        case .textFont(let font):
            font
        case .textFontWithColor(let font, _):
            font
        case .reStyleWithColor(let style, _):
            style.dsTextFont
        }
    }
    
    func font(for appearance: DSAppearance) -> Font {
        dsTextFont.font(for: appearance)
    }
    
    func color(for appearance: DSAppearance, and viewStyle: DSViewStyle) -> Color {
        textStyle(for: appearance).color.color(for: appearance, and: viewStyle)
    }
    
    func size(_ appearance: DSAppearance) -> CGFloat {
        dsTextFont.uiFont(for: appearance).pointSize
    }
}

struct DSTextStyleEnvironment: EnvironmentKey {
    static let defaultValue: DSTextStyle = .textFont(.body)
}

public extension EnvironmentValues {
    var textStyle: DSTextStyle {
        get { self[DSTextStyleEnvironment.self] }
        set { self[DSTextStyleEnvironment.self] = newValue }
    }
}

struct Testable_DSText: View {
    var body: some View {
        DSVStack {
            DSText("Large title").dsTextStyle(.largeTitle)
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
                DSText(
                    "Lorem Ipsum is simply dummy text.",
                    multilineTextAlignment: .center
                )
                .dsTextStyle(.footnote)
                .border(Color.black, width: 1)
                DSText(
                    "Lorem Ipsum is simply dummy text.",
                    multilineTextAlignment: .leading
                )
                .dsTextStyle(.footnote)
                .border(Color.black, width: 1)
                DSText("Lorem Ipsum is simply dummy text.",
                       multilineTextAlignment: .trailing
                )
                .dsTextStyle(.footnote)
                .border(Color.black, width: 1)
            }
        }
    }
}

struct DSText_Previews: PreviewProvider {
    static var previews: some View {
        DSPreviewForEachAppearance {
            DSPreview {
                Testable_DSText()
            }
        }
    }
}

