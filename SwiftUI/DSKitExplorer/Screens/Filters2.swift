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
                DSRadioPickerView(
                    data: viewModel.sortByOptions,
                    id: \.self,
                    selected: $viewModel.selectedSortByOption
                ) { option, selected in
                    DSText(option, selected ?  .smallTitle : .subheadlineWithSize(14))
                }.dsSectionStyle(title: "Style")
                
                DSPickerView(
                    data: viewModel.colors,
                    id: \.self,
                    selected: $viewModel.selectedColor
                ) { color in
                    Color(uiColor: color).dsSize(40)
                }.dsSectionStyle(title: "Color")
                
                DSPickerView(
                    data: viewModel.sizes,
                    id: \.self,
                    selected: $viewModel.selectedSize
                ) { size in
                    DSText(size, .smallTitle)
                        .frame(maxWidth: .infinity)
                        .dsSize(40)
                        .dsSecondaryBackground()
                }.dsSectionStyle(title: "Size")
                
                DSVStack(spacing: .smaller) {
                    ForEach(viewModel.filters) { filter in
                        OptionView(option: filter)
                    }
                }.dsSectionStyle(title: "Options")
            }
        }.safeAreaInset(edge: .bottom) {
            DSBottomContainer {
                DSButton(
                    title: "View (235) Items",
                    action: { dismiss() }
                )
            }
        }.toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                DSButton(title: "Reset", style: .clear, action: {})
            }
        }.dsScreen()
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
                DSChevronView()
            }.dsCardStyle()
        }
        struct Data: Identifiable {
            let id = UUID()
            let title: String
            let option: String
        }
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
