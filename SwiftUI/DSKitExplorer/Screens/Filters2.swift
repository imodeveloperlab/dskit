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
    @ObservedObject var viewModel = Filters2Model()
    
    var body: some View {
        ScrollView {
            DSVStack {
                
                RadioPickerView(
                    data: viewModel.sortByOptions,
                    id: \.self,
                    selected: $viewModel.selectedSortByOption
                ) { option, selected in
                    DSText(option, selected ?  .smallTitle : .subheadlineWithSize(14))
                }.dsSectionStyle(title: "Style")
                
                PickerView(
                    data: viewModel.colors,
                    id: \.self,
                    selected: $viewModel.selectedColor
                ) { color in
                    Color(uiColor: color).dsSize(40)
                }
                .dsSectionStyle(title: "Color")
                
                PickerView(
                    data: viewModel.sizes,
                    id: \.self,
                    selected: $viewModel.selectedSize
                ) { size in
                    DSText(size, .smallTitle)
                        .frame(maxWidth: .infinity)
                        .dsSize(40)
                        .dsSecondaryBackground()
                }
                .dsSectionStyle(title: "Size")
                
                DSVStack(spacing: .smaller) {
                    ForEach(viewModel.filters) { filter in
                        OptionView(option: filter)
                    }
                }
                .dsSectionStyle(title: "Options")

            }.dsPadding(.horizontal)
            
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

extension Filters2 {
    
    // MARK: - Option View
    
    struct OptionView: View {
        let option: Data
        var body: some View {
            DSHStack {
                DSText(option.title, .smallTitle)
                Spacer()
                DSText(option.option, .subheadlineWithSize(14))
                ChevronView()
            }.dsCardStyle()
        }
        struct Data: Identifiable {
            let id = UUID()
            let title: String
            let option: String
        }
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

// MARK: - View Model

final class Filters2Model: ObservableObject {
    
    @Published var selectedSize: String = "10"
    let sizes = ["8", "9", "10", "11", "12", "13", "14", "15", "16"]
    
    @Published var selectedColor: UIColor = UIColor(0xF88F6F)
    let colors = [UIColor(0xFFC6A3),
                  UIColor(0xF88F6F),
                  UIColor(0x5CB946),
                  UIColor(0x006A7A),
                  UIColor(0x28527a),
                  UIColor(0x8ac4d0),
                  UIColor(0xfbeeac)]
    
    
    @Published var selectedSortByOption = "Chelsea Boots"
    let sortByOptions = ["Boots", "Chelsea Boots", "Casual Sneakers", "Casual Shoes"]
    let filters: [Filters2.OptionView.Data] = [
        .init(title: "Size", option: "All"),
        .init(title: "Brand", option: "Adidas, Puma, HRX"),
        .init(title: "Color", option: "Black"),
        .init(title: "Price", option: "$0-$999"),
        .init(title: "Range", option: "All")
    ]
}


// MARK: - Preview

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
