//
//  ItemDetails2.swift
//  DSKit
//
//  Created by Ivan Borinschi on 21.12.2022.
//

import SwiftUI
import DSKit

struct ItemDetails2: View {
    
    @Environment(\.dismiss) var dismiss
    @ObservedObject var viewModel = ItemDetails2Model()
    
    var body: some View {
        ScrollView {
            DSVStack(spacing: .medium) {
                DSCoverFlow(height: 250, data: viewModel.imageGallery, id: \.self) { imageUrl in
                    DSImageView(url: imageUrl).dsCornerRadius()
                }
                DSVStack(spacing: .medium) {
                    
                    DSVStack(spacing: .zero) {
                        DSText(viewModel.title).dsTextStyle(.title2)
                        DSText(viewModel.subtitle).dsTextStyle(.subheadline)
                    }
                    
                    DSPriceView(price: viewModel.price, size: .headline)
                    DSQuantityPicker()
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
                }.dsSectionStyle(title: "Size")
                
                DSPickerView(
                    data: viewModel.colors,
                    id: \.self,
                    selected: $viewModel.selectedColor
                ) { color in
                    DSImageView(named: color, size: .size(width: 80, height: 60))
                }.dsSectionStyle(title: "Model")

                DSText(viewModel.description).dsTextStyle(.callout)
            }
        }
        .safeAreaInset(edge: .bottom) {
            DSBottomContainer {
                DSButton(title: "Add to cart", rightSystemName: "cart") {
                    dismiss()
                }
                DSText(viewModel.priceDisclaimer, multilineTextAlignment: .center)
                    .dsTextStyle(.caption2)
                    .dsPadding(.horizontal)
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

final class ItemDetails2Model: ObservableObject {
    @Published var selectedSize: String = "US 5.5"
    @Published var selectedColor: String = "nike_2"
    @Published var colors = ["nike_1", "nike_2", "nike_3", "nike_4", "nike_5", "nike_6"]
    @Published var sizes = ["US 5", "US 5.5", "US 6", "US 6.5", "US 7", "US 7.5", "US 8", "US 8.5", "US 9"]
    let imageGallery = [p4Image, p3Image, p1Image, p2Image]
    let title = "Women's Running Shoe"
    let subtitle = "Nike Revolution 5"
    let description = "The Nike Revolution 5 cushions your stride with soft foam to keep you running in comfort. Lightweight knit material wraps your foot in breathable support, while a minimalist design fits in anywhere your day takes you."
    let priceDisclaimer = "The price listed here is subject to change. The final amount will be displayed on the checkout screen."
    let price = DSPrice(
        amount: "120.0",
        regularAmount: "200",
        currency: "$",
        discountBadge: "80$ Off"
    )
}

// MARK: - Testable

struct Testable_ItemDetails2: View {
    var body: some View {
        NavigationView {
            ItemDetails2()
                .navigationTitle("Product Details")
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}

// MARK: - Preview

struct ItemDetails2_Previews: PreviewProvider {
    static var previews: some View {
        DSPreviewForEachAppearance { Testable_ItemDetails2() }
    }
}

// MARK: - Image Links

fileprivate let p1Image = URL(string: "https://images.pexels.com/photos/1598505/pexels-photo-1598505.jpeg?cs=srgb&dl=pexels-mnz-1598505.jpg&fm=jpg")
fileprivate let p2Image = URL(string: "https://images.unsplash.com/photo-1552346154-21d32810aba3?q=80&w=2940&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
fileprivate let p3Image = URL(string: "https://images.pexels.com/photos/5710082/pexels-photo-5710082.jpeg?cs=srgb&dl=pexels-ox-street-5710082.jpg&fm=jpg")
fileprivate let p4Image = URL(string: "https://images.unsplash.com/photo-1600185365483-26d7a4cc7519?q=80&w=2825&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
