//
//  Filters1.swift
//  DSKit
//
//  Created by Ivan Borinschi on 21.12.2022.
//

import SwiftUI
import DSKit

struct Filters1: View {
    
    @Environment(\.dismiss) var dismiss
    @ObservedObject var viewModel = Filters1Model()
    
    var body: some View {
        ScrollView {
            DSVStack {
                
                DSRadioPickerView(data: viewModel.sortByOptions, id: \.self, selected: $viewModel.selectedSortByOption) { option, selected in
                    DSText(option)
                        .dsTextStyle(selected ?  .smallHeadline : .subheadline, 14)
                }.dsSectionStyle(title: "Sort By")
                
                DSVStack(spacing: .small) {
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

extension Filters1 {
    
    // MARK: - Option View
    
    struct OptionView: View {
        let option: Data
        var body: some View {
            DSHStack {
                DSText(option.title).dsTextStyle(.smallHeadline)
                Spacer()
                DSText(option.option).dsTextStyle(.subheadline, 14)
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

final class Filters1Model: ObservableObject {
    @Published var selectedSortByOption = "New Items"
    let sortByOptions = ["Featured", "New Items", "Price (Hight First)", "Price (Low First)", "Range"]
    let filters:[Filters1.OptionView.Data] = [
        .init(title: "Size", option: "All"),
        .init(title: "Brand", option: "Adidas, Puma, HRX"),
        .init(title: "Color", option: "Black"),
        .init(title: "Price", option: "$0-$999"),
        .init(title: "Range", option: "All")
    ]
}

// MARK: - Testable

struct Testable_Filters1: View {
    var body: some View {
        NavigationView {
            Filters1()
                .navigationTitle("Filters")
        }
    }
}

// MARK: - Preview

struct Filters1_Previews: PreviewProvider {
    static var previews: some View {
        DSPreviewForEachAppearance { Testable_Filters1() }
    }
}
