//
//  Items4.swift
//  DSKit
//
//  Created by Ivan Borinschi on 21.12.2022.
//

import SwiftUI
import DSKit

struct Items4: View {
    
    @Environment(\.dismiss) var dismiss
    let viewModel = Items4Model()
    
    var body: some View {
        ScrollView {
            DSVStack(spacing: .medium) {
                DSHScroll(data: viewModel.filters, id: \.self) { title in
                    DSText(title)
                        .dsTextStyle(.headline, 12)
                        .dsPadding(.horizontal, .large)
                        .dsCardStyle()
                        .onTap { self.dismiss() }
                }
                DSGrid(data: viewModel.products, id: \.id) { product in
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

extension Items4 {
    
    // MARK: - Product View
    
    struct ProductView: View {
        let product: Data
        var body: some View {
            Group {
                DSVStack(spacing: .zero) {
                    DSImageView(url: product.image)
                    DSVStack(spacing: .small) {
                        DSText(product.title).dsTextStyle(.smallHeadline)
                        DSText(product.description).dsTextStyle(.smallSubtitle)
                        DSPriceView(price: product.price, size: .smallHeadline)
                    }.dsPadding(.regular)
                }
                .dsSecondaryBackground()
                .dsHeight(290)
                .overlay(alignment: .topTrailing) {
                    DSImageView(
                        systemName: "heart.fill",
                        size: .font(.subheadline),
                        tint: .color(product.favourite ? .red : .gray.opacity(0.5))
                    )
                    .dsPadding(.regular)
                    .dsBackground(.primary)
                    .dsCornerRadius()
                    .dsPadding(.regular)
                }
                .onTap { }
            }.dsCornerRadius()
        }
        
        struct Data: Identifiable {
            var id = UUID()
            let title: String
            let description: String
            var tag: String? = nil
            let price: DSPrice
            var favourite: Bool = false
            let image: URL?
        }
    }
}

// MARK: - View Model

final class Items4Model {
    
    let filters = ["Polo", "Denim", "Jackets", "Shirts", "Shorts", "Sweaters"]

    let products: [Items4.ProductView.Data] = [
        .init(
            title: "The Iconic Mesh Polo Shirt - All Fits",
            description: "Polo Ralph Lauren",
            tag: "SALES",
            price: DSPrice(amount: "22", regularAmount: "89", currency: "$"),
            favourite: true,
            image: p1Image
        ),
        .init(
            title: "Big Pony Mesh Polo Shirt",
            description: "Stella McCarthney",
            price: DSPrice(amount: "92", currency: "$"),
            image: p2Image
        ),
        .init(
            title: "Soft Cotton Polo Shirt - All Fits",
            description: "Hermes",
            price: DSPrice(amount: "13", regularAmount: "82", currency: "$", discountBadge: "-69$"),
            favourite: true,
            image: p4Image
        ),
        .init(
            title: "Big Pony Mesh Polo Shirt",
            description: "Arrmani", tag: "50% OFF",
            price: DSPrice(amount: "57", regularAmount: "85", currency: "$"),
            image: p5Image
        ),
        .init(
            title: "Polo Team Mesh Polo Shirt",
            description: "House & Versace",
            price: DSPrice(amount: "84", regularAmount: "94", currency: "$"),
            favourite: true,
            image: p6Image
        ),
        .init(
            title: "Polo Team Mesh Polo Shirt",
            description: "House & Versace",
            price: DSPrice(amount: "84", regularAmount: "94", currency: "$"),
            favourite: true,
            image: p7Image
        ),
        .init(
            title: "Mesh Long-Sleeve Polo Shirt – All Fits",
            description: "Dolce & Gabbana",
            price: DSPrice(amount: "84", currency: "$"),
            favourite: false,
            image: p3Image
        )
    ]
}

// MARK: - Testable

struct Testable_Items4: View {
    var body: some View {
        NavigationView {
            Items4()
            .navigationTitle("Products")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

// MARK: - Preview

struct Items4_Previews: PreviewProvider {
    static var previews: some View {
        DSPreviewForEachAppearance { Testable_Items4() }
    }
}

// MARK: - Image Links

fileprivate let p1Image = URL(string: "https://images.pexels.com/photos/1816643/pexels-photo-1816643.jpeg?cs=srgb&dl=pexels-atef-khaled-1816643.jpg&fm=jpg")

fileprivate let p2Image = URL(string: "https://images.pexels.com/photos/5325554/pexels-photo-5325554.jpeg?cs=srgb&dl=pexels-anna-shvets-5325554.jpg&fm=jpg")

fileprivate let p3Image = URL(string: "https://images.pexels.com/photos/2909735/pexels-photo-2909735.jpeg?cs=srgb&dl=pexels-lad-fury-2909735.jpg&fm=jpg")

fileprivate let p4Image = URL(string: "https://images.pexels.com/photos/2755165/pexels-photo-2755165.jpeg?cs=srgb&dl=pexels-matt-hardy-2755165.jpg&fm=jpg")

fileprivate let p5Image = URL(string: "https://images.pexels.com/photos/3289663/pexels-photo-3289663.jpeg?cs=srgb&dl=pexels-tnarg-3289663.jpg&fm=jpg")

fileprivate let p6Image = URL(string: "https://images.pexels.com/photos/3608205/pexels-photo-3608205.jpeg?cs=srgb&dl=pexels-the-happiest-face-%29-3608205.jpg&fm=jpg")

fileprivate let p7Image = URL(string: "https://images.pexels.com/photos/5999891/pexels-photo-5999891.jpeg?cs=srgb&dl=pexels-ono-kosuki-5999891.jpg&fm=jpg")
