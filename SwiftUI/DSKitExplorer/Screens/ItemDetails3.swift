//
//  ItemDetails3.swift
//  DSKitCore
//
//  Created by Ivan Borinschi on 21.12.2022.
//

import SwiftUI
import DSKit

struct ItemDetails3: View {
    
    @Environment(\.dismiss) var dismiss
    @ObservedObject var viewModel = ItemDetails3Model()
    
    var body: some View {
        ScrollView {
            DSVStack(spacing: .regular) {
                DSGallery(height: 260, data: viewModel.imageGallery, id: \.self) { imageUrl in
                    DSImageView(url: imageUrl).dsCornerRadius()
                }
                DSVStack(spacing: .regular) {
                    
                    DSHStack {
                        DSVStack(spacing: .zero) {
                            DSText(viewModel.title, .title2)
                            DSText(viewModel.subtitle, .subheadline)
                        }.frame(maxWidth: .infinity, alignment: .leading)
                    }
                    
                    DSHStack(alignment: .center, spacing: .small) {
                        RatingView(rating: 4.5, size: 16)
                        DSText("24K Ratings", .callout)
                    }
                    
                    DSVStack(spacing: .extraSmall) {
                        DSHStack(alignment: .center, spacing: .small) {
                            DSImageView(sfSymbol: "circlebadge.fill", size: .small, tint: .text(.caption2))
                            DSText("Colour Shown: Light Charcoal/Black/Lemon Venom/University Red", .caption2)
                        }
                        DSHStack(alignment: .center, spacing: .small) {
                            DSImageView(sfSymbol: "circlebadge.fill", size: .small, tint: .text(.caption2))
                            DSText("Style: CW6575-001", .caption2)
                        }
                    }
                    
                    DSPriceView(price: viewModel.price, size: .large)
                    
                    DSHStack(alignment: .center) {
                        DSImageView(sfSymbol: "info.circle.fill", size: .regular, tint: .customColor(.yellow))
                        DSText(viewModel.priceDisclaimer, .caption2, multilineTextAlignment: .leading)
                    }
                }
                
                PickerView(
                    data: viewModel.colors,
                    id: \.self,
                    selected: $viewModel.selectedColor
                ) { color in
                    DSImageView(uiImageName: color, size: .size(width: 70, height: 50))
                }.dsSectionStyle(title: "Model")
                
                PickerView(
                    data: viewModel.sizes,
                    id: \.self, selected: $viewModel.selectedSize
                ) { size in
                    DSText(size, .smallTitle)
                        .frame(maxWidth: .infinity)
                        .dsPadding(.horizontal)
                        .dsHeight(35)
                        .dsSecondaryBackground()
                }.dsSectionStyle(title: "Size")

                DSText(viewModel.description, .caption1)
            }
        }
        .safeAreaInset(edge: .bottom) {
            BottomContainerView {
                DSButton(title: "Add to cart", style: .borderedLight) { dismiss() }
                DSButton(title: "Buy Now") { dismiss() }
            }
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                ToolbarSFSymbolButton(name: "square.and.arrow.up.fill").onTap { dismiss() }
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                ToolbarSFSymbolButton(name: "heart").onTap { dismiss() }
            }
        }
        .dsBackground()
    }
}

extension ItemDetails3 {
    
    // MARK: - Select Size View
    
    struct SelectSizeView: View {
        @ObservedObject var viewModel: ItemDetails3Model
        var body: some View {
            DSVStack(spacing: .smaller) {
                DSText("Size", .smallTitle).dsPadding(.horizontal)
                DSHScroll(spacing: .smaller, data: viewModel.sizes, id: \.self) { size in
                    DSText(size, .smallTitle)
                        .frame(maxWidth: .infinity)
                        .dsPadding(.horizontal)
                        .dsHeight(35)
                        .dsSecondaryBackground()
                        .dsSelectedStyle(isSelected: viewModel.selectedSize == size)
                        .onTap {
                            UIImpactFeedbackGenerator(style: .medium).impactOccurred()
                            viewModel.selectedSize = size
                        }
                }
            }
        }
    }
    
    // MARK: - Select Color
    
    struct SelectModelView: View {
        @ObservedObject var viewModel: ItemDetails3Model
        var body: some View {
            DSVStack(spacing: .smaller) {
                DSText("Model", .smallTitle).dsPadding(.horizontal)
                DSHScroll(spacing: .smaller, data: viewModel.colors, id: \.self) { color in
                    DSImageView(uiImageName: color, size: .size(width: 70, height: 50))
                        .dsSelectedStyle(isSelected: viewModel.selectedColor == color)
                        .onTap {
                            UIImpactFeedbackGenerator(style: .medium).impactOccurred()
                            viewModel.selectedColor = color
                        }
                }
            }
        }
    }
}

// MARK: - Model

final class ItemDetails3Model: ObservableObject {
    @Published var selectedSize: String = "US 5.5"
    @Published var selectedColor: String = "nike_2"
    @Published var colors = ["nike_1", "nike_2", "nike_3", "nike_4", "nike_5", "nike_6"]
    @Published var sizes = ["US 5", "US 5.5", "US 6", "US 6.5", "US 7", "US 7.5", "US 8", "US 8.5", "US 9"]
    let imageGallery = [p1Image, p3Image, p2Image]
    let title = "Women's Running Shoe"
    let subtitle = "Nike Revolution 5"
    let description = "The Nike Revolution 5 cushions your stride with soft foam to keep you running in comfort. Lightweight knit material wraps your foot in breathable support, while a minimalist design fits in anywhere your day takes you."
    let priceDisclaimer = "The price listed here is subject to change.\nThe final amount will be displayed on the checkout screen. "
    let price = DSPrice(
        amount: "120",
        regularAmount: "200",
        currency: "$",
        discountBadge: "80$ Off"
    )
}

// MARK: - Preview

struct ItemDetails3_Previews: PreviewProvider {
    static var previews: some View {
        PreviewForEach {
            NavigationView {
                ItemDetails3()
                    .navigationTitle("Details")
                    .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
}

// MARK: - Image Links

fileprivate let p1Image = URL(string: "https://images.pexels.com/photos/1456705/pexels-photo-1456705.jpeg?cs=srgb&dl=pexels-ray-piedra-1456705.jpg&fm=jpg")
fileprivate let p2Image = URL(string: "https://images.pexels.com/photos/3261069/pexels-photo-3261069.jpeg?cs=srgb&dl=pexels-wallace-chuck-3261069.jpg&fm=jpg")
fileprivate let p3Image = URL(string: "https://images.pexels.com/photos/5710082/pexels-photo-5710082.jpeg?cs=srgb&dl=pexels-ox-street-5710082.jpg&fm=jpg")


