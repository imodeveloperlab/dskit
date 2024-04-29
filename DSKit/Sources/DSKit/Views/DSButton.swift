//
//  DSButton.swift
//  DSKit
//
//  Created by Ivan Borinschi on 28.12.2022.
//

import SwiftUI

/*
## DSButton

`DSButton` is a highly customizable button component in the DSKit framework, designed to accommodate various styles and use cases within the application. It supports several predefined styles as well as custom configurations, making it versatile for different interface needs.

#### Styles:
`DSButton` offers multiple styles to cater to different UI requirements:
- `default`: Standard button style.
- `light`: A lighter version of the button, typically for less emphasis.
- `borderedLight`: A light button with a border.
- `custom(color: Color)`: Allows for a custom color to be specified.
- `clear`: A button style without a background.

#### Initializers:
Multiple initializers allow for various configurations of the button, supporting images, custom spacing, and push-to-sides behavior:
- Parameters:
- `title`: The text to be displayed on the button.
- `leftImage`: Optional image to show on the left side of the text.
- `rightImage`: Optional image to show on the right side of the text.
- `pushContentToSides`: If true, pushes the content to the sides of the button.
- `style`: The style of the button, from the predefined styles or custom.
- `maxWidth`: A boolean to determine if the button should expand to the maximum available width.
- `spacing`: The spacing to use within the button, particularly between the icon and text.
- `action`: The closure executed when the button is tapped.

#### Customization:
Extensions on `DSButton` provide convenient static methods to create commonly used button configurations:
- `callToActionLink`: Creates a button styled as a call-to-action link.
- `sfSymbol`: Creates a button with an SF Symbol icon, ideal for toolbar or icon-only buttons.
 
#### Usage:
`DSButton` can be used in various parts of the application where user interaction is required. It is capable of handling both text and icons, and can be styled dynamically according to the design requirements.
*/

public struct DSButton: View {
    
    public enum Style {
        case `default`
        case light
        case borderedLight
        case custom(color: Color)
        case clear
    }
    
    @Environment(\.appearance) var appearance: DSAppearance
    @Environment(\.viewStyle) var viewStyle: DSViewStyle
    
    let title: String
    var leftImage: DSImage? = nil
    var rightImage: DSImage? = nil
    var pushContentToSides: Bool = false
    var style: Style = .default
    var maxWidth: Bool
    var spacing: DSSpace
    let action: () -> Void
    
    public init(
        title: String,
        leftImage: DSImage? = nil,
        rightImage: DSImage? = nil,
        pushContentToSides: Bool = false,
        style: Style = .default,
        maxWidth: Bool = true,
        spacing: DSSpace = .regular,
        action: @escaping () -> Void
    ) {
        self.title = title
        self.leftImage = leftImage
        self.rightImage = rightImage
        self.pushContentToSides = pushContentToSides
        self.style = style
        self.maxWidth = maxWidth
        self.action = action
        self.spacing = spacing
    }
    
    public init(
        title: String,
        leftImageNamed: String? = nil,
        rightImageNamed: String? = nil,
        pushContentToSides: Bool = false,
        style: Style = .default,
        maxWidth: Bool = true,
        spacing: DSSpace = .regular,
        action: @escaping () -> Void
    ) {
        self.title = title
        
        if let leftImageNamed {
            self.leftImage = DSImage(content: .image(image: UIImage(named: leftImageNamed)), size: .smallIcon)
        }
        
        if let rightImageNamed {
            self.rightImage = DSImage(content: .image(image: UIImage(named: rightImageNamed)), size: .smallIcon)
        }
        
        self.pushContentToSides = pushContentToSides
        self.style = style
        self.maxWidth = maxWidth
        self.action = action
        self.spacing = spacing
    }
    
    public init(
        title: String,
        pushContentToSides: Bool = false,
        style: Style = .default,
        maxWidth: Bool = true,
        spacing: DSSpace = .regular,
        action: @escaping () -> Void
    ) {
        self.init(
            title: title,
            leftImage: nil,
            rightImage: nil,
            pushContentToSides: pushContentToSides,
            style: style,
            maxWidth: maxWidth,
            action: action
        )
    }
    
    public init(
        title: String,
        keftSystemName: String? = nil,
        rightSystemName: String? = nil,
        pushContentToSides: Bool = false,
        style: Style = .default,
        maxWidth: Bool = true,
        spacing: DSSpace = .regular,
        action: @escaping () -> Void
    ) {
        var leftImage: DSImage?
        if let keftSystemName {
            leftImage = DSImage(content: .system(name: keftSystemName), size: .smallIcon)
        }
        
        var rightImage: DSImage?
        if let rightSystemName {
            rightImage = DSImage(content: .system(name: rightSystemName), size: .smallIcon)
        }
        
        self.init(
            title: title,
            leftImage: leftImage,
            rightImage: rightImage,
            pushContentToSides: pushContentToSides,
            style: style,
            maxWidth: maxWidth,
            action: action
        )
    }
    
    public var body: some View {
        styledButton.dsDebuggable(debugColor: Color.mint.opacity(0.3))
    }
    
    var styledButton: some View {
        Button(action: action, label: {
            switch style {
            case .default, .light, .custom(color: _):
                buttonView
                    .frame(maxWidth: maxWidth ? .infinity : .none)
                    .dsPadding(.horizontal, .medium)
                    .dsHeight(.custom(appearance.actionElementHeight))
                    .background(backgroundColor)
                    .dsCornerRadius()
            case .clear:
                buttonView
                    .frame(maxWidth: maxWidth ? .infinity : .none)
                    .background(backgroundColor)
                    .dsHeight(.custom(appearance.actionElementHeight))
            case .borderedLight:
                buttonView
                    .frame(maxWidth: maxWidth ? .infinity : .none)
                    .dsHeight(.custom(appearance.actionElementHeight))
                    .background(backgroundColor)
                    .dsCornerRadius()
                    .overlay(
                        RoundedRectangle(cornerRadius: viewStyle.colors(from: appearance).cornerRadius)
                            .stroke(titleColor.color(for: appearance, and: viewStyle), lineWidth: 1)
                    ).padding(1)
            }
        })
    }
    
    var buttonView: some View {
        DSHStack(spacing: spacing) {
            if let leftImage {
                DSImageView(dsImage: leftImage.imageWith(tint: titleColor))
                    .dsSize(leftImage.size)
                    .font(.system(size: 25, weight: .semibold))
                if pushContentToSides {
                    Spacer()
                }
            }
            
            if !title.isEmpty {
                DSText(title).dsTextStyle(.headline, 15, titleColor)
                    .dsHeight(.font(.fontWithSize(.headline, 15)))
            }
            
            if let rightImage {
                if pushContentToSides {
                    Spacer()
                }
                DSImageView(dsImage: rightImage.imageWith(tint: titleColor))
                    .dsSize(rightImage.size)
                    .font(.system(size: 25, weight: .semibold))
            }
        }
        .dsResetContentMargins()
        .dsHeight(15)
    }
    
    var backgroundColor: Color {
        switch style {
        case .light:
            dsBackgroundColor.color(for: appearance, and: viewStyle).opacity(0.1)
        default:
            dsBackgroundColor.color(for: appearance, and: viewStyle)
        }
    }
    
    var dsBackgroundColor: DSColorKey {
        switch style {
        case .default:
            return .view(.button(.accentColor))
        case .light:
            return .view(.button(.accentColor))
        case .custom(color: let color):
            return .color(color)
        case .clear:
            return .color(.clear)
        case .borderedLight:
            return .viewStyle(.primary, .button(.supportColor))
        }
    }
    
    var titleColor: DSColorKey {
        switch style {
        case .default:
            return .view(.button(.supportColor))
        case .light:
            return .view(.button(.accentColor))
        case .custom(color: _):
            return .color(.white)
        case .clear:
            return .view(.button(.accentColor))
        case .borderedLight:
            return .viewStyle(.primary, .button(.accentColor))
        }
    }
}

public extension DSButton {
    
    static func callToActionLink(title: String, action: @escaping () -> Void) -> DSButton {
        DSButton(
            title: title,
            pushContentToSides: false,
            style: .clear,
            maxWidth: false,
            action: action
        )
    }
    
    static func sfSymbol(
        name: String,
        style: Style = .default,
        size: DSSize = DSSize(.fontWithSize(.headline, 15)),
        action: @escaping () -> Void
    ) -> DSButton {
        DSButton(
            title: "",
            rightImage: DSImage(systemName: name, size: size),
            pushContentToSides: false,
            style: style,
            maxWidth: false,
            action: action
        )
    }
}

struct Testable_DSButton: View {
    var body: some View {
        DSVStack {
            DSVStack(spacing: .small) {
                DSButton(
                    title: "Default",
                    action: { }
                )
                DSButton(
                    title: "Light",
                    style: .light, action: { }
                )
            }
            .dsPadding(.medium)
            .dsSecondaryBackground()
            .dsCornerRadius()
            
            DSVStack {
                DSButton(title: "Default", action: { })
                DSButton(
                    title: "Light",
                    rightSystemName: "message.fill",
                    style: .light,
                    action: { }
                )
                DSButton(
                    title: "Bordered Light",
                    keftSystemName: "message.fill",
                    style: .borderedLight,
                    action: { }
                )
                DSButton(
                    title: "Light",
                    rightSystemName: "message.fill",
                    pushContentToSides: true,
                    style: .light,
                    action: { }
                )
                DSButton(
                    title: "Regular",
                    style: .clear,
                    action: { }
                )
            }
        }
    }
}

struct DSButton_Previews: PreviewProvider {
    static var previews: some View {
        DSPreviewForEachAppearance { 
            DSPreview {
                Testable_DSButton()
            }
        }
    }
}
