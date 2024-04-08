//
//  Items2.swift
//  DSKit
//
//  Created by Ivan Borinschi on 21.12.2022.
//

import SwiftUI
import DSKit

struct Items2: View {
    
    @Environment(\.dismiss) var dismiss
    let viewModel = Items2Model()
    
    var body: some View {
        ScrollView {
            DSVStack {
                ForEach(viewModel.products) { product in
                    ProductView(product: product)
                }
            }
        }
        .dsScreen()
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                DSToolbarSFSymbolButton(name: "arrow.up.arrow.down.circle.fill")
                    .onTap { dismiss() }
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                DSToolbarSFSymbolButton(name: "line.horizontal.3.decrease.circle.fill")
                    .onTap { dismiss() }
            }
        }
    }
}

extension Items2 {
    
    // MARK: - Product View
    
    struct ProductView: View {
        let product: Data
        var body: some View {
            ZStack(alignment: .bottom) {
                ZStack {
                    DSImageView(url: product.image)
                    LinearGradient(
                        gradient:
                            Gradient(
                                colors: [
                                    Color.black.opacity(0.0),
                                    Color.black.opacity(0.2),
                                    Color.black.opacity(1)
                                ]
                            ),
                        startPoint: .top,
                        endPoint: .bottom
                    )
                }.overlay(alignment: .topLeading) {
                    if let tag = product.tag {
                        DSText(tag)
                            .dsTextStyle(.headline, 9)
                            .dsPadding(.small)
                            .dsBackground(.primary)
                            .dsCornerRadius()
                            .dsPadding(.regular)
                    }
                }.overlay(alignment: .topTrailing) {
                    DSImageView(
                        systemName: "heart.fill",
                        size: .font(.subheadline),
                        tint: .color(product.favorite ? .red : .white)
                    )
                    .dsPadding(.regular)
                    .dsBlurBackground(style: .light)
                    .dsCornerRadius()
                    .dsPadding(.regular)
                }
                
                DSVStack(alignment: .center, spacing: .zero) {
                    DSText(product.title)
                        .dsTextStyle(.smallHeadline, .white)
                    DSText(product.description)
                        .dsTextStyle(.smallSubtitle, .white.opacity(0.8))
                    DSPriceView(price: product.price, size: .smallHeadline, color: .white)
                }
                .dsPadding(.bottom)
            }
            .dsSecondaryBackground()
            .dsCornerRadius()
            .dsHeight(280)
        }
        
        struct Data: Identifiable {
            let id = UUID()
            let title: String
            let description: String
            var tag: String?
            let price: DSPrice
            let favorite: Bool
            let image: URL?
        }
    }
}

// MARK: - Model

final class Items2Model {
    
    let products: [Items2.ProductView.Data] = [
        .init(
            title: "Jodhpur Boots",
            description: "House & Versace",
            price: DSPrice(amount: "84", regularAmount: "94", currency: "$"),
            favorite: true,
            image: jodhpurBootsImage
        ),
        .init(
            title: "Platform derby shoes",
            description: "Stella McCarthney",
            price: DSPrice(amount: "92", currency: "$"),
            favorite: false,
            image: shoesImage
        ),
        .init(
            title: "Motocross Boots",
            description: "Hermes",
            price: DSPrice(amount: "13", regularAmount: "82", currency: "$", discountBadge: "-69$"),
            favorite: true,
            image: motocrossBootsImage
        ),
        .init(
            title: "Hiking Boots",
            description: "Dolce & Gabbana",
            price: DSPrice(amount: "84", currency: "$"),
            favorite: false,
            image: hikingBootsImage
        ),
        .init(
            title: "Suede Chuck-a Boots",
            description: "River Island",
            tag: "SALES",
            price: DSPrice(amount: "22", regularAmount: "89", currency: "$"),
            favorite: true,
            image: bootsImage
        ),
        .init(
             title: "Riding Boots",
             description: "Arrmani",
             tag: "50% OFF",
             price: DSPrice(amount: "57", regularAmount: "85", currency: "$"),
             favorite: false,
             image: ridingBootsImage
         )
    ]
}

// MARK: - Testable

struct Testable_Items2: View {
    var body: some View {
        NavigationView {
            Items2()
                .navigationTitle("Products")
        }
    }
}

// MARK: - Preview

struct Items2_Previews: PreviewProvider {
    static var previews: some View {
        DSPreviewForEachAppearance { Testable_Items2() }
    }
}

// MARK: - Image Links

fileprivate let bootsImage = URL(string: "https://images.pexels.com/photos/267242/pexels-photo-267242.jpeg?cs=srgb&dl=pexels-pixabay-267242.jpg&fm=jpg")
fileprivate let shoesImage = URL(string: "https://images.pexels.com/photos/1904769/pexels-photo-1904769.jpeg?cs=srgb&dl=pexels-sebastian-palomino-1904769.jpg&fm=jpg")
fileprivate let hikingBootsImage = URL(string: "https://images.pexels.com/photos/755871/pexels-photo-755871.jpeg?cs=srgb&dl=pexels-simon-migaj-755871.jpg&fm=jpg")
fileprivate let motocrossBootsImage = URL(string: "https://images.pexels.com/photos/718981/pexels-photo-718981.jpeg?cs=srgb&dl=pexels-aidan-jarrett-718981.jpg&fm=jpg")
fileprivate let ridingBootsImage = URL(string: "https://images.pexels.com/photos/6410600/pexels-photo-6410600.jpeg?cs=srgb&dl=pexels-jessica-jochheim-6410600.jpg&fm=jpg")
fileprivate let jodhpurBootsImage = URL(string: "https://images.pexels.com/photos/2682289/pexels-photo-2682289.jpeg?cs=srgb&dl=pexels-andrew-neel-2682289.jpg&fm=jpg")
