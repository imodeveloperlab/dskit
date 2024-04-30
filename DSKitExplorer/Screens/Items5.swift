//
//  Items5.swift
//  DSKit
//
//  Created by Ivan Borinschi on 21.12.2022.
//

import SwiftUI
import DSKit

struct Items5: View {
    
    @Environment(\.dismiss) var dismiss
    let viewModel = Items5Model()
    
    var body: some View {
        ScrollView {
            DSVStack(spacing: .medium) {
                DSImageView(url: p0Image, size: .size(width: .none, height: 180))
                    .dsCornerRadius()
                    .overlay(alignment: .center) {
                        DSVStack(alignment: .center) {
                            DSText("Clothing")
                                .dsTextStyle(.largeHeadline, Color.black)
                            DSText("73.3k items")
                                .dsTextStyle(.smallHeadline, Color.black)
                        }
                    }
                DSHScroll(data: viewModel.filters, id: \.self) { title in
                    DSText(title).dsTextStyle(.smallHeadline)
                        .dsPadding(.horizontal)
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

extension Items5 {
    
    // MARK: - Product View
    
    struct ProductView: View {
        let product: Data
        var body: some View {
            DSVStack(spacing: .zero) {
                DSImageView(url: product.image)
                    .dsSecondaryBackground()
                DSVStack(spacing: .small) {
                    DSText(product.title).dsTextStyle(.smallHeadline)
                    DSText(product.description).dsTextStyle(.smallSubtitle)
                    DSPriceView(price: product.price, size: .smallHeadline)
                }.dsPadding()
            }.overlay(alignment: .topTrailing, content: {
                DSImageView(
                    systemName: "heart.fill",
                    size: .font(.subheadline),
                    tint: .color(product.favourite ? .red : .white)
                )
                .dsPadding(.regular)
                .dsCornerRadius()
                .dsPadding(.regular)
            })
            .dsSecondaryBackground()
            .dsCornerRadius()
            .dsHeight(290)
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

final class Items5Model {
    
    let products: [Items5.ProductView.Data] = [
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

    let filters = ["Polo", "Denim", "Jackets", "Shirts", "Shorts", "Sweaters"]
}

// MARK: - Testable

struct Testable_Items5: View {
    var body: some View {
        NavigationView {
            Items5()
                .navigationTitle("Products")
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}

// MARK: - Preview

struct Items5_Previews: PreviewProvider {
    static var previews: some View {
        DSPreviewForEachAppearance { Testable_Items5() }
    }
}

// MARK: - Image Links

fileprivate let p0Image = URL(string: "https://images.pexels.com/photos/6417941/pexels-photo-6417941.jpeg?cs=srgb&dl=pexels-pavel-danilyuk-6417941.jpg&fm=jpg")

fileprivate let p1Image = URL(string: "https://images.pexels.com/photos/3760610/pexels-photo-3760610.jpeg?cs=srgb&dl=pexels-andrea-piacquadio-3760610.jpg&fm=jpg")

fileprivate let p2Image = URL(string: "https://images.pexels.com/photos/3746314/pexels-photo-3746314.jpeg?cs=srgb&dl=pexels-anna-shvets-3746314.jpg&fm=jpg")

fileprivate let p3Image = URL(string: "https://images.pexels.com/photos/3372595/pexels-photo-3372595.jpeg?cs=srgb&dl=pexels-aidan-roof-3372595.jpg&fm=jpg")

fileprivate let p4Image = URL(string: "https://images.pexels.com/photos/2096694/pexels-photo-2096694.jpeg?cs=srgb&dl=pexels-luis-quintero-2096694.jpg&fm=jpg")

fileprivate let p5Image = URL(string: "https://images.pexels.com/photos/5325887/pexels-photo-5325887.jpeg?cs=srgb&dl=pexels-anna-shvets-5325887.jpg&fm=jpg")

fileprivate let p6Image = URL(string: "https://images.pexels.com/photos/4929024/pexels-photo-4929024.jpeg?cs=srgb&dl=pexels-cottonbro-4929024.jpg&fm=jpg")

fileprivate let p7Image = URL(string: "https://images.pexels.com/photos/5325741/pexels-photo-5325741.jpeg?cs=srgb&dl=pexels-anna-shvets-5325741.jpg&fm=jpg")
