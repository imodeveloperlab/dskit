//
//  Items8.swift
//  DSKit
//
//  Created by Ivan Borinschi on 21.12.2022.
//

import SwiftUI
import DSKit

struct Items8: View {
    
    @Environment(\.dismiss) var dismiss
    let viewModel = Items8Model()
        
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

extension Items8 {
    
    // MARK: - Product View
    
    struct ProductView: View {
        let product: Data
        var body: some View {
            DSHStack(spacing: .medium) {
                DSImageView(url: product.image)
                    .dsSecondaryBackground()
                    .dsSize(.size(width: 100, height: 120))
                
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
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .dsPadding(.regular)
                
            }.overlay(alignment: .topLeading) {
                DSImageView(
                    systemName: "heart.fill",
                    size: .font(.subheadline),
                    tint: .color(product.favorite ? .red : .white)
                )
                .dsPadding(.regular)
            }
            .overlay(alignment: .trailing) {
                DSImageView(
                    systemName: "ellipsis",
                    size: .font(.subheadline),
                    tint: .text(.headline)
                )
                .dsPadding(.medium)
            }
            .dsSecondaryBackground()
            .dsCornerRadius()
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

// MARK: - View Model

final class Items8Model {
    let products: [Items8.ProductView.Data] = [
        .init(
            title: "The Iconic Mesh Polo Shirt - All Fits",
            description: "Polo Ralph Lauren",
            tag: "SALES",
            price: DSPrice(amount: "22", regularAmount: "89", currency: "$"),
            favorite: true,
            image: p1Image
        ),
        .init(
             title: "Big Pony Mesh Polo Shirt",
             description: "Stella McCarthney",
             price: DSPrice(amount: "92", currency: "$"),
             favorite: false,
             image: p2Image
         ),
        .init(
             title: "Soft Cotton Polo Shirt - All Fits",
             description: "Hermes",
             price: DSPrice(amount: "13", regularAmount: "82", currency: "$", discountBadge: "-69$"),
             favorite: true,
             image: p4Image
         ),
        .init(
             title: "Big Pony Mesh Polo Shirt",
             description: "Arrmani",
             tag: "50% OFF",
             price: DSPrice(amount: "57", regularAmount: "85", currency: "$"),
             favorite: false,
             image: p5Image
         ),
        .init(
             title: "Polo Team Mesh Polo Shirt",
             description: "House & Versace",
             price: DSPrice(amount: "84", regularAmount: "94", currency: "$"),
             favorite: true,
             image: p6Image
         ),
        .init(
            title: "Polo Team Mesh Polo Shirt",
            description: "House & Versace",
            price: DSPrice(amount: "84", regularAmount: "94", currency: "$"),
            favorite: true,
            image: p7Image
        ),
        .init(
            title: "Mesh Long-Sleeve Polo Shirt – All Fits",
            description: "Dolce & Gabbana",
            price: DSPrice(amount: "84", currency: "$"),
            favorite: false,
            image: p3Image
        )
    ]
}

// MARK: - Testable

struct Testable_Items8: View {
    var body: some View {
        NavigationView {
            Items8()
                .navigationTitle("Products")
        }
    }
}

// MARK: - Preview

struct Items8_Previews: PreviewProvider {
    static var previews: some View {
        DSPreviewForEachAppearance { Testable_Items8() }
    }
}

// MARK: - Image Links

fileprivate let p1Image = URL(string: "https://images.pexels.com/photos/6417926/pexels-photo-6417926.jpeg?cs=srgb&dl=pexels-pavel-danilyuk-6417926.jpg&fm=jpg")
fileprivate let p2Image = URL(string: "https://images.pexels.com/photos/3760610/pexels-photo-3760610.jpeg?cs=srgb&dl=pexels-andrea-piacquadio-3760610.jpg&fm=jpg")
fileprivate let p3Image = URL(string: "https://images.pexels.com/photos/2096694/pexels-photo-2096694.jpeg?cs=srgb&dl=pexels-luis-quintero-2096694.jpg&fm=jpg")
fileprivate let p4Image = URL(string: "https://images.pexels.com/photos/4928997/pexels-photo-4928997.jpeg?cs=srgb&dl=pexels-cottonbro-4928997.jpg&fm=jpg")
fileprivate let p5Image = URL(string: "https://images.pexels.com/photos/3746314/pexels-photo-3746314.jpeg?cs=srgb&dl=pexels-anna-shvets-3746314.jpg&fm=jpg")
fileprivate let p6Image = URL(string: "https://images.pexels.com/photos/4349750/pexels-photo-4349750.jpeg?cs=srgb&dl=pexels-ketut-subiyanto-4349750.jpg&fm=jpg")
fileprivate let p7Image = URL(string: "https://images.pexels.com/photos/5082985/pexels-photo-5082985.jpeg?cs=srgb&dl=pexels-cottonbro-5082985.jpg&fm=jpg")
