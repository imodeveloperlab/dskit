//
//  ItemDetails4.swift
//  DSKitCore
//
//  Created by Ivan Borinschi on 21.12.2022.
//

import SwiftUI
import DSKit

struct ItemDetails4: View {
    
    @Environment(\.dismiss) var dismiss
    @ObservedObject var viewModel = ItemDetails4Model()
    
    var body: some View {
        ScrollView {
            DSVStack(spacing: .regular) {

                DSGallery(height: 200, data: viewModel.imageGallery, id: \.self) { imageUrl in
                    DSImageView(url: imageUrl).dsCornerRadius()
                }
                
                Group {
                    DSVStack(spacing: .extraSmall) {
                        DSText(viewModel.title, .title2)
                        DSText(viewModel.subtitle, .subheadline)
                    }
                    
                    DSHStack(alignment: .center, spacing: .small) {
                        DSText("New", .headlineWithSize(12), color: .customColor(Color.white))
                            .dsPadding(.vertical, .smaller)
                            .dsPadding(.horizontal, .small)
                            .dsBackground(.customColor(.green))
                            .dsCornerRadius()
                        RatingView(rating: 4.5, size: 16)
                        DSText("24K Ratings", .callout)
                    }
                }.dsPadding(.horizontal)
                
                PickerView(
                    title: "Size",
                    data: viewModel.sizes,
                    id: \.self,
                    selected: $viewModel.selectedSize
                ) { size in
                    DSText(size, .smallTitle)
                        .frame(maxWidth: .infinity)
                        .dsSize(40)
                        .dsSecondaryBackground()
                }
                
                PickerView(
                    title: "Color",
                    data: viewModel.colors,
                    id: \.self,
                    selected: $viewModel.selectedColor
                ) { color in
                    Color(uiColor: color).dsSize(40)
                }
                                
                DSText(viewModel.description, .caption1)
                    .dsPadding(.horizontal)
                
                DSVStack(spacing: .smaller) {
                    ActionView(title: "Size Guides")
                    ActionView(title: "Return Policy")
                }.dsPadding(.bottom)
            }
        }
        .safeAreaInset(edge: .bottom) {
            BottomContainerView {
                DSHStack {
                    DSText("Total", .headline)
                    Spacer()
                    DSPriceView(price: viewModel.price, size: .mediumLarge)
                }
                DSButton(title: "Buy Now") { dismiss() }
                
                TermsAndConditionsView(message: "By continuing you agree to our")
            }
        }.toolbar {
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

extension ItemDetails4 {
    
    struct ActionView: View {
        
        @Environment(\.appearance) var appearance: DSAppearance
        let title: String
        
        var body: some View {
            DSHStack {
                DSText(title, .smallTitle)
                Spacer()
                ChevronView()
            }
            .dsPadding(.horizontal)
            .dsHeight(.custom(appearance.actionElementHeight))
            .dsSecondaryBackground()
            .dsCornerRadius()
            .dsPadding(.horizontal)
        }
    }
}

// MARK: - Model

final class ItemDetails4Model: ObservableObject {
    
    let title = "Ditsy Floral Sweetheart Neck Dress"
    let subtitle = "Dolce & Gabbana"
    let description = "In the 11th century, women in Europe wore dresses that were similar to men's tunics and were loose, with a hemline reaching to below the knees or lower."

    let price = DSPrice(
        amount: "120.0",
        regularAmount: "200",
        currency: "$",
        discountBadge: "80$ Off"
    )
    
    @Published var selectedSize: String = "10"
    @Published var selectedColor: UIColor = UIColor(0xF88F6F)
    
    let imageGallery = [p2Image, p1Image, p3Image]
    
    let colors = [UIColor(0xFFC6A3),
                  UIColor(0xF88F6F),
                  UIColor(0x5CB946),
                  UIColor(0x006A7A),
                  UIColor(0x28527a),
                  UIColor(0x8ac4d0),
                  UIColor(0xfbeeac)]
    
    let sizes = ["8", "9", "10", "11", "12", "13", "14", "15", "16"]
}

// MARK: - Model

struct ItemDetails4_Previews: PreviewProvider {
    
    static var previews: some View {
        PreviewForEach {
            NavigationView {
                ItemDetails4()
                    .navigationTitle("Details")
                    .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
}

// MARK: - Image Links

fileprivate let p1Image = URL(string: "https://images.pexels.com/photos/5085329/pexels-photo-5085329.jpeg?cs=srgb&dl=pexels-jonathan-borba-5085329.jpg&fm=jpg")
fileprivate let p2Image = URL(string: "https://images.pexels.com/photos/2122361/pexels-photo-2122361.jpeg?cs=srgb&dl=pexels-kyle-roxas-2122361.jpg&fm=jpg")
fileprivate let p3Image = URL(string: "https://images.pexels.com/photos/2946811/pexels-photo-2946811.jpeg?cs=srgb&dl=pexels-engin-akyurt-2946811.jpg&fm=jpg")
