//
//  Filters2.swift
//  DSKitCore
//
//  Created by Ivan Borinschi on 21.12.2022.
//

import SwiftUI
import DSKit

struct Filters2: View {
    
    @Environment(\.dismiss) var dismiss
    let sizes = ["8", "9", "10", "11", "12", "13", "14", "15", "16"]
    let colors = [UIColor(0xFFC6A3),
                  UIColor(0xF88F6F),
                  UIColor(0x5CB946),
                  UIColor(0x006A7A),
                  UIColor(0xC3FCF1),
                  UIColor(0x28527a),
                  UIColor(0x8ac4d0),
                  UIColor(0xfbeeac)]
    
    var body: some View {
        ScrollView {
            DSVStack {
                DSVStack(spacing: .smaller) {
                    DSText("Style", .subheadline)
                    DSVStack {
                        RadioOptionView(title: "Boots")
                        RadioOptionView(title: "Chelsea Boots", selected: true)
                        RadioOptionView(title: "Casual Sneakers")
                        RadioOptionView(title: "Casual Shoes")
                    }
                }.dsPadding(.horizontal)
                
                DSVStack(spacing: .smaller) {
                    DSText("Size, UK", .subheadline).dsPadding(.horizontal)
                    DSHScroll(data: sizes, id: \.self) { size in
                        SizeView(size: size, selected: size == "10")
                    }
                }
                
                DSVStack(spacing: .smaller) {
                    DSText("Color", .subheadline).dsPadding(.horizontal)
                    DSHScroll(data: colors, id: \.self) { color in
                        ColorView(color: color, selected: color == UIColor(0xFFC6A3))
                    }
                }
                
                DSVStack(spacing: .smaller) {
                    DSText("Sort by", .subheadline)
                    DSVStack {
                        OptionView(title: "Size", option: "All")
                        OptionView(title: "Brand", option: "Adidas, Puma, HRX")
                        OptionView(title: "Color", option: "Black")
                        OptionView(title: "Price", option: "$0-$999")
                        OptionView(title: "Range", option: "All")
                    }
                }.dsPadding(.horizontal)
            }
            
        }.safeAreaInset(edge: .bottom) {
            DSButton(
                title: "View (235) Items",
                action: { dismiss() }
            )
            .dsPadding(.horizontal)
            .topShadow(padding: .regular)
            .dsBackground()
        }.toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                DSButton(title: "Reset", style: .clear, action: {})
            }
        }.dsBackground()
    }
}

fileprivate struct RadioOptionView: View {
    let title: String
    var selected: Bool = false
    
    var body: some View {
        DSHStack {
            DSText(title, selected ?  .smallTitle : .subheadlineWithSize(14))
            Spacer()
            if selected {
                DSImageView(sfSymbol: "checkmark.circle.fill", size: .medium, tint: .customColor(.green))
            } else {
                DSImageView(sfSymbol: "circle", size: .medium, tint: .text(.subheadline))
            }
        }
        .dsPadding()
        .dsSecondaryBackground()
        .dsCornerRadius()
        .onTap { }
    }
}

fileprivate struct OptionView: View {
    let title: String
    let option: String
    var body: some View {
        DSHStack {
            DSText(title, .smallTitle)
            Spacer()
            DSText(option, .subheadlineWithSize(14))
            ChevronView()
        }
        .dsPadding()
        .dsSecondaryBackground()
        .dsCornerRadius()
        .onTap { }
    }
}

fileprivate struct SizeView: View {
    
    @Environment(\.appearance) var appearance: DSAppearance
    @Environment(\.colorGroup) var colorGroup: DSColorGroup
    
    let size: String
    var selected: Bool = false
    
    var body: some View {
        DSText(size, .smallTitle)
        .dsSize(40)
        .dsSecondaryBackground()
        .dsCornerRadius()
        .overlay(
            RoundedRectangle(cornerRadius: colorGroup.colors(from: appearance).cornerRadius)
                .stroke(appearance.primaryView.button.background.color, lineWidth: selected ? 2 : 0)
        )
        .padding(1)
        .onTap { }
    }
}

fileprivate struct ColorView: View {
    
    @Environment(\.appearance) var appearance: DSAppearance
    @Environment(\.colorGroup) var colorGroup: DSColorGroup
    
    let color: UIColor
    var selected: Bool = false
    
    var body: some View {
        Color(uiColor: color)
            .dsSize(40)
            .dsCornerRadius()
            .overlay(
                RoundedRectangle(cornerRadius: colorGroup.colors(from: appearance).cornerRadius)
                    .stroke(appearance.primaryView.button.background.color, lineWidth: selected ? 2 : 0)
            )
            .padding(1)
    }
}


struct Filters2_Previews: PreviewProvider {
    static var previews: some View {
        PreviewForEach {
            NavigationView {
                Filters2()
                    .navigationTitle("Filters")
            }
        }
    }
}
