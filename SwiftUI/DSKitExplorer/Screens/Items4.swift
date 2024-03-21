//
//  Items4.swift
//  DSKitCore
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
            DSVStack {
                categoriesView
                productsView.dsPadding(.horizontal)
            }
        }
        .dsBackground()
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                DSImageView(
                    sfSymbol: "arrow.up.arrow.down.circle.fill",
                    size: .mediumLarge,
                    tint: .color(.primaryViewButtonBackground)
                ).onTap { dismiss() }
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                DSImageView(
                    sfSymbol: "line.horizontal.3.decrease.circle.fill",
                    size: .mediumLarge,
                    tint: .color(.primaryViewButtonBackground)
                ).onTap { dismiss() }
            }
        }
    }
    
    var productsView: some View {
        DSGrid(data: viewModel.products, id: \.id) { product in
            ProductView(product: product)
        }
    }
    
    var categoriesView: some View {
        DSHScroll(data: viewModel.filters, id: \.self) { title in
            DSText(title, .headlineWithSize(12))
                .dsHeight(20)
                .dsPadding(.small)
                .dsPadding(.horizontal, .extraLarge)
                .dsSecondaryBackground()
                .dsCornerRadius()
                .onTap { self.dismiss() }
        }
    }
    
    struct ProductView: View {
        let product: Product
        var body: some View {
            Group {
                DSVStack(spacing: .zero) {
                    DSImageView(url: product.image)
                    DSVStack(spacing: .smaller) {
                        DSText(product.title, .smallTitle)
                        DSText(product.description, .smallSubtitle)
                        DSPriceView(price: product.price, size: .medium)
                    }.dsPadding(.small)
                }
                .dsSecondaryBackground()
                .dsHeight(290)
                .overlay(alignment: .topTrailing) {
                    DSImageView(
                        sfSymbol: "heart.fill",
                        size: .regular,
                        tint: .customColor(product.favourite ? .red : .gray.opacity(0.5))
                    )
                    .dsPadding(.small)
                    .dsBackground()
                    .dsCornerRadius()
                    .dsPadding(.small)
                }
                .onTap { }
            }.dsCornerRadius()
        }
    }
    
    struct Product: Identifiable {
        var id = UUID()
        let title: String
        let description: String
        var tag: String? = nil
        let price: DSPrice
        var favourite: Bool = false
        let image: URL?
    }
}

struct Items4_Previews: PreviewProvider {
    static var previews: some View {
        PreviewForEach {
            NavigationView {
                Items4()
                .navigationTitle("Items")
                .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
}

final class Items4Model {
    
    let filters = ["Polo", "Denim", "Jackets", "Shirts", "Shorts", "Sweaters"]

    let products: [Items4.Product] = [
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
    
    static let p1Image = URL(string: "https://images.pexels.com/photos/1816643/pexels-photo-1816643.jpeg?cs=srgb&dl=pexels-atef-khaled-1816643.jpg&fm=jpg")
    static let p2Image = URL(string: "https://images.pexels.com/photos/5325554/pexels-photo-5325554.jpeg?cs=srgb&dl=pexels-anna-shvets-5325554.jpg&fm=jpg")
    static let p3Image = URL(string: "https://images.pexels.com/photos/2909735/pexels-photo-2909735.jpeg?cs=srgb&dl=pexels-lad-fury-2909735.jpg&fm=jpg")
    static let p4Image = URL(string: "https://images.pexels.com/photos/2755165/pexels-photo-2755165.jpeg?cs=srgb&dl=pexels-matt-hardy-2755165.jpg&fm=jpg")
    static let p5Image = URL(string: "https://images.pexels.com/photos/3289663/pexels-photo-3289663.jpeg?cs=srgb&dl=pexels-tnarg-3289663.jpg&fm=jpg")
    static let p6Image = URL(string: "https://images.pexels.com/photos/3608205/pexels-photo-3608205.jpeg?cs=srgb&dl=pexels-the-happiest-face-%29-3608205.jpg&fm=jpg")
    static let p7Image = URL(string: "https://images.pexels.com/photos/5999891/pexels-photo-5999891.jpeg?cs=srgb&dl=pexels-ono-kosuki-5999891.jpg&fm=jpg")
}
