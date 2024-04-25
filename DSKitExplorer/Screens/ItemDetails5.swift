//
//  ItemDetails5.swift
//  DSKit
//
//  Created by Ivan Borinschi on 21.12.2022.
//

import SwiftUI
import DSKit

struct ItemDetails5: View {
    
    @Environment(\.dismiss) var dismiss
    @ObservedObject var viewModel = ItemDetails5Model()
    
    var body: some View {
        ScrollView {
            DSVStack(spacing: .medium) {
                DSCoverFlow(height: 250, data: viewModel.imageGallery, id: \.self) { imageUrl in
                    DSImageView(url: imageUrl).dsCornerRadius()
                }
                
                DSPickerView(
                    data: viewModel.colors,
                    id: \.self,
                    selected: $viewModel.selectedColor
                ) { color in
                    DSImageView(named: color, size: .size(width: 70, height: 50))
                }
                
                DSVStack(spacing: .medium) {
                    DSHStack {
                        DSVStack(spacing: .zero) {
                            DSText(viewModel.title).dsTextStyle(.title2)
                            DSText(viewModel.subtitle).dsTextStyle(.subheadline)
                        }.frame(maxWidth: .infinity, alignment: .leading)
                    }
                }
                
                DSPickerView(
                    style: .grid(columns: 4),
                    data: viewModel.sizes,
                    id: \.self, selected: $viewModel.selectedSize
                ) { size in
                    DSText(size).dsTextStyle(.smallHeadline)
                        .frame(maxWidth: .infinity)
                        .dsPadding(.horizontal)
                        .dsHeight(.actionElement)
                        .dsSecondaryBackground()
                }

                DSText(viewModel.description).dsTextStyle(.caption1)
            }
        }
        .safeAreaInset(edge: .bottom) {
            DSBottomContainer {
                
                DSHStack {
                    DSText("Total").dsTextStyle(.headline)
                    Spacer()
                    DSPriceView(price: viewModel.price, size: .headline)
                }
                
                DSButton(title: "Add to cart", style: .borderedLight) { dismiss() }
                DSButton(title: "Buy Now") { dismiss() }
                
                DSTermsAndConditions(message: "By continuing you agree to our")
            }
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                DSToolbarSFSymbolButton(name: "square.and.arrow.up.fill").onTap { dismiss() }
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                DSToolbarSFSymbolButton(name: "heart").onTap { dismiss() }
            }
        }.dsScreen()
    }
}

// MARK: - Model

final class ItemDetails5Model: ObservableObject {
    @Published var selectedSize: String = "US 5.5"
    @Published var selectedColor: String = "nike_2"
    @Published var colors = ["nike_1", "nike_2", "nike_3", "nike_4", "nike_5", "nike_6"]
    @Published var sizes = ["US 5", "US 5.5", "US 6", "US 6.5", "US 7", "US 7.5", "US 8", "US 8.5", "US 9"]
    let imageGallery = [p1Image, p3Image, p2Image]
    let title = "Women's Running Shoe"
    let subtitle = "Nike Revolution 5"
    let description = "The Nike Revolution 5 cushions your stride with soft foam to keep you running in comfort. Lightweight knit material wraps your foot in breathable support, while a minimalist design fits in anywhere your day takes you."
    let price = DSPrice(
        amount: "120",
        regularAmount: "200",
        currency: "$",
        discountBadge: "80$ Off"
    )
}

// MARK: - Testable

struct Testable_ItemDetails5: View {
    var body: some View {
        NavigationView {
            ItemDetails5()
                .navigationTitle("Product Details")
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}

// MARK: - Preview

struct ItemDetails5_Previews: PreviewProvider {
    static var previews: some View {
        DSPreviewForEachAppearance { Testable_ItemDetails5() }
    }
}

fileprivate let p1Image = URL(string: "https://images.unsplash.com/photo-1710643301117-4d738aeb1e69?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
fileprivate let p2Image = URL(string: "https://images.pexels.com/photos/3261069/pexels-photo-3261069.jpeg?cs=srgb&dl=pexels-wallace-chuck-3261069.jpg&fm=jpg")
fileprivate let p3Image = URL(string: "https://images.pexels.com/photos/1456705/pexels-photo-1456705.jpeg?cs=srgb&dl=pexels-ray-piedra-1456705.jpg&fm=jpg")
