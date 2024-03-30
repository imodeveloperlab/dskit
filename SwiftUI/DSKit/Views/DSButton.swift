//
//  DSButton.swift
//  DSKitCore
//
//  Created by Ivan Borinschi on 28.12.2022.
//

import SwiftUI

public struct DSButton: View {
    
    public enum Style {
        case `default`
        case light
        case borderedLight
        case custom(color: UIColor)
        case clear
    }
    
    @Environment(\.appearance) var appearance: DSAppearance
    @Environment(\.colorGroup) var colorGroup: DSColorGroup
    @Environment(\.debugLayout) var debugLayout: Bool
    
    let title: String
    var leftImage: DSImage? = nil
    var rightImage: DSImage? = nil
    var pushContentToSides: Bool = false
    var style: Style = .default
    var maxWidth: Bool
    var spacing: DSSpacingDimension
    let action: () -> Void
    
    public init(
        title: String,
        leftImage: DSImage? = nil,
        rightImage: DSImage? = nil,
        pushContentToSides: Bool = false,
        style: Style = .default,
        maxWidth: Bool = true,
        spacing: DSSpacingDimension = .regular,
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
        spacing: DSSpacingDimension = .regular,
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
        spacing: DSSpacingDimension = .regular,
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
        if debugLayout {
            styledButton
                .background(Color.mint.opacity(0.2))
        } else {
            styledButton
        }
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
                            .stroke(titleColor, lineWidth: 1)
                    ).padding(1)
            }
        })
    }
    
    var buttonView: some View {
        DSHStack(spacing: spacing) {
            if let leftImage {
                DSImageView(dsImage: leftImage.imageWith(tint: .customColor(titleColor)))
                    .dsSize(leftImage.size)
                    .font(.system(size: 15, weight: .medium))
                if pushContentToSides {
                    Spacer()
                }
            }
            
            if !title.isEmpty {
                DSText(title, .headlineWithSize(15), color: .customColor(titleColor))
                    .dsHeight(.large)
            }
            
            if let rightImage {
                if pushContentToSides {
                    Spacer()
                }
                DSImageView(dsImage: rightImage.imageWith(tint: .customColor(titleColor)))
                    .dsSize(rightImage.size)
                    .font(.system(size: 20, weight: .medium))
            }
        }.dsResetContentMargins()
        .dsHeight(15)
    }
    
    var backgroundColor: Color {
        let buttonColors = colorGroup.colors(from: appearance).button
        switch style {
        case .default:
            return buttonColors.background.color
        case .light:
            return buttonColors.background.color.opacity(0.1)
        case .custom(color: let color):
            return color.color
        case .clear:
            return Color.clear
        case .borderedLight:
            return appearance.primaryView.button.title.color
        }
    }
    
    var titleColor: Color {
        let buttonColors = colorGroup.colors(from: appearance).button
        switch style {
        case .default:
            return buttonColors.title.color
        case .light:
            return buttonColors.background.color
        case .custom(color: _):
            return UIColor.white.color
        case .clear:
            return buttonColors.background.color
        case .borderedLight:
            return appearance.primaryView.button.background.color
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
        PreviewForEach { DSPreview {
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
