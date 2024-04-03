//
//  DSButton.swift
//  DSKit
//
//  Created by Ivan Borinschi on 28.12.2022.
//

import SwiftUI

public struct DSButton: View {
    
    public enum Style {
        case `default`
        case light
        case borderedLight
        case custom(color: Color)
        case clear
    }
    
    @Environment(\.appearance) var appearance: DSAppearance
    @Environment(\.colorGroup) var colorGroup: DSViewStyle
    
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
        leftSFSymbolName: String? = nil,
        rightSFSymbolName: String? = nil,
        pushContentToSides: Bool = false,
        style: Style = .default,
        maxWidth: Bool = true,
        spacing: DSSpace = .regular,
        action: @escaping () -> Void
    ) {
        var leftImage: DSImage?
        if let leftSFSymbolName {
            leftImage = DSImage(content: .sfSymbol(name: leftSFSymbolName), size: .regular)
        }
        
        var rightImage: DSImage?
        if let rightSFSymbolName {
            rightImage = DSImage(content: .sfSymbol(name: rightSFSymbolName), size: 15)
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
                        RoundedRectangle(cornerRadius: colorGroup.colors(from: appearance).cornerRadius)
                            .stroke(titleColor.styledColorDemo(from: appearance, and: colorGroup).color, lineWidth: 1)
                    ).padding(1)
            }
        })
    }
    
    var buttonView: some View {
        DSHStack(spacing: spacing) {
            if let leftImage {
                DSImageView(dsImage: leftImage.imageWith(tint: titleColor))
                    .dsSize(leftImage.size)
                    .font(.system(size: 15, weight: .medium))
                if pushContentToSides {
                    Spacer()
                }
            }
            
            if !title.isEmpty {
                DSText(title, .styleWithColor(.fontWithSize(.headline, 15), titleColor))
                    .dsHeight(.large)
            }
            
            if let rightImage {
                if pushContentToSides {
                    Spacer()
                }
                DSImageView(dsImage: rightImage.imageWith(tint: titleColor))
                    .dsSize(rightImage.size)
                    .font(.system(size: 20, weight: .medium))
            }
        }.dsResetContentMargins()
        .dsHeight(15)
    }
    
    var backgroundColor: Color {
        switch style {
        case .light:
            dsBackgroundColor.styledColorDemo(from: appearance, and: colorGroup).color.opacity(0.1)
        default:
            dsBackgroundColor.styledColorDemo(from: appearance, and: colorGroup).color
        }
    }
    
    var dsBackgroundColor: DSColor {
        switch style {
        case .default:
            return .view(.buttonBackground)
        case .light:
            return .view(.buttonBackground)
        case .custom(color: let color):
            return .customColor(color)
        case .clear:
            return .customColor(.clear)
        case .borderedLight:
            return .style(.primary, .buttonTitle)
        }
    }
    
    var titleColor: DSColor {
        switch style {
        case .default:
            return .view(.buttonTitle)
        case .light:
            return .view(.buttonBackground)
        case .custom(color: _):
            return .customColor(.white)
        case .clear:
            return .view(.buttonBackground)
        case .borderedLight:
            return .style(.primary, .buttonBackground)
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
        size: DSSize = .regular,
        action: @escaping () -> Void
    ) -> DSButton {
        DSButton(
            title: "",
            rightImage: DSImage(sfSymbolName: name, size: size),
            pushContentToSides: false,
            style: style,
            maxWidth: false,
            action: action
        )
    }
}

struct DSButton_Previews: PreviewProvider {
    
    static var previews: some View {
        DSPreviewForEachAppearance { DSPreview {
                DSVStack {
                    
                    DSVStack {
                        DSButton(title: "Default", maxWidth: false, action: { })
                        DSButton(title: "Light", style: .light, maxWidth: false, action: { })
                        DSButton(title: "Default", leftSFSymbolName: "message.fill", maxWidth: false, action: { })
                        DSButton(title: "Light", rightSFSymbolName: "message.fill", style: .light, maxWidth: false, action: { })
                    }
                    
                    DSVStack(spacing: .small) {
                        DSButton(title: "Default", action: { })
                        DSButton(title: "Light", style: .light, action: { })
                    }
                    .dsPadding(.small)
                    .dsSecondaryBackground()
                    .dsCornerRadius()
                    
                    DSVStack {
                        DSButton(title: "Bordered Light", leftSFSymbolName: "message.fill", style: .borderedLight, action: { })
                        DSButton(title: "Light", rightSFSymbolName: "message.fill", pushContentToSides: true, style: .light, action: { })
                    }
                    
                    DSHStack {
                        DSVStack {
                            DSButton(title: "Regular", style: .clear, action: { })
                            DSButton.callToActionLink(title: "Call to action", action: {})
                            DSButton.sfSymbol(name: "cart", action: {})
                        }
                    }
                }
            }
        }
    }
}
