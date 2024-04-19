//
//  Items6.swift
//  DSKit
//
//  Created by Ivan Borinschi on 21.12.2022.
//

import SwiftUI
import DSKit

struct Items6: View {
    
    @Environment(\.dismiss) var dismiss
    let viewModel = Items6Model()
    
    var body: some View {
        ScrollView {
            DSGrid(data: viewModel.products, id: \.id) { product in
                ProductView(product: product).onTap { }
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

extension Items6 {
    
    // MARK: - Product View
    
    struct ProductView: View {
        let product: Data
        var body: some View {
            DSVStack(spacing: .zero) {
                DSImageView(url: product.image)
                    .dsSecondaryBackground()
                DSVStack {
                    DSVStack(spacing: .zero) {
                        DSText(product.title).dsTextStyle(.smallHeadline)
                        DSText(product.description).dsTextStyle(.smallSubtitle)
                    }
                    DSHStack {
                        DSRatingView(rating: 4.5, size: 12)
                        DSText("2.4k Reviews").dsTextStyle(.caption2)
                    }
                    DSPriceView(price: product.price, size: .smallHeadline)
                }.dsPadding(.regular)
            }.overlay(alignment: .topTrailing, content: {
                DSImageView(
                    systemName: "heart.fill",
                    size: .font(.subheadline),
                    tint: .color(product.favourite ? .red : .white)
                )
                .dsPadding(.regular)
                .dsBlurBackground(style: .light)
                .dsCornerRadius()
                .dsPadding(.regular)
            })
            .dsSecondaryBackground()
            .dsCornerRadius()
            .dsHeight(300)
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

final class Items6Model {
    let products: [Items6.ProductView.Data] = [
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

struct Testable_Items6: View {
    var body: some View {
        NavigationView {
            Items6()
                .navigationTitle("Products")
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}

// MARK: - Preview

struct Items6_Previews: PreviewProvider {
    static var previews: some View {
        DSPreviewForEachAppearance { Testable_Items6() }
    }
}

// MARK: - Image Links

fileprivate let p1Image = URL(string: "https://images.pexels.com/photos/709791/pexels-photo-709791.jpeg?cs=srgb&dl=pexels-daria-shevtsova-709791.jpg&fm=jpg")
fileprivate let p2Image = URL(string: "https://images.pexels.com/photos/4971015/pexels-photo-4971015.jpeg?cs=srgb&dl=pexels-anna-shvets-4971015.jpg&fm=jpg")
fileprivate let p3Image = URL(string: "https://images.pexels.com/photos/5484409/pexels-photo-5484409.jpeg?cs=srgb&dl=pexels-oleg-magni-5484409.jpg&fm=jpg")
fileprivate let p4Image = URL(string: "https://images.pexels.com/photos/2899710/pexels-photo-2899710.jpeg?cs=srgb&dl=pexels-jonathan-borba-2899710.jpg&fm=jpg")
fileprivate let p5Image = URL(string: "https://images.pexels.com/photos/885588/pexels-photo-885588.jpeg?cs=srgb&dl=pexels-godisable-jacob-885588.jpg&fm=jpg")
fileprivate let p6Image = URL(string: "https://images.pexels.com/photos/914472/pexels-photo-914472.jpeg?cs=srgb&dl=pexels-jt-kim-914472.jpg&fm=jpg")
fileprivate let p7Image = URL(string: "https://images.pexels.com/photos/6417926/pexels-photo-6417926.jpeg?cs=srgb&dl=pexels-pavel-danilyuk-6417926.jpg&fm=jpg")
