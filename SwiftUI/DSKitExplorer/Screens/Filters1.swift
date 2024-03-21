//
//  Filters1.swift
//  DSKitCore
//
//  Created by Ivan Borinschi on 21.12.2022.
//

import SwiftUI
import DSKit

struct Filters1: View {
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ScrollView {
            DSVStack {
                DSVStack(spacing: .smaller) {
                    DSText("Sort by", .subheadline)
                    DSVStack {
                        RadioOptionView(title: "Featured")
                        RadioOptionView(title: "New Items", selected: true)
                        RadioOptionView(title: "Price (Hight First)")
                        RadioOptionView(title: "Price (Low First)")
                        RadioOptionView(title: "Range")
                    }
                }
                DSVStack(spacing: .smaller) {
                    DSText("Filters", .subheadline)
                    DSVStack {
                        OptionView(title: "Size", option: "All")
                        OptionView(title: "Brand", option: "Adidas, Puma, HRX")
                        OptionView(title: "Color", option: "Black")
                        OptionView(title: "Price", option: "$0-$999")
                        OptionView(title: "Range", option: "All")
                    }
                }
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

struct Filters1_Previews: PreviewProvider {
    static var previews: some View {
        PreviewForEach {
            NavigationView {
                Filters1()
                    .navigationTitle("Filters")
            }
        }
    }
}
