//
//  Items7.swift
//  DSKit
//
//  Created by Ivan Borinschi on 21.12.2022.
//

import SwiftUI
import DSKit

struct Items7: View {
    
    @Environment(\.dismiss) var dismiss
    let viewModel = Items7Model()
    
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

extension Items7 {
    
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
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .dsPadding(.regular)
                .overlay(alignment: .trailing) {
                    DSChevronView()
                        .dsPadding(.trailing, .medium)
                }
                
            }.overlay(alignment: .topTrailing, content: {
                DSImageView(
                    systemName: "heart.fill",
                    size: .font(.subheadline),
                    tint: .color(product.favorite ? .red : .white)
                )
                .dsPadding(.regular)
                .dsBlurBackground(style: .light)
                .dsCornerRadius()
                .dsPadding(.regular)
            })
            .dsSecondaryBackground()
            .dsCornerRadius()
            .dsHeight(300)
            .onTap { }
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

final class Items7Model {
    
    let products: [Items7.ProductView.Data] = [
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

struct Testable_Items7: View {
    var body: some View {
        NavigationView {
            Items7()
                .navigationTitle("Products")
        }
    }
}

// MARK: - Preview
struct Items7_Previews: PreviewProvider {
    static var previews: some View {
        DSPreviewForEachAppearance { Testable_Items7() }
    }
}

// MARK: - Image Links

fileprivate let p1Image = URL(string: "https://images.pexels.com/photos/4992628/pexels-photo-4992628.jpeg?cs=srgb&dl=pexels-rachel-claire-4992628.jpg&fm=jpg")

fileprivate let p2Image = URL(string: "https://images.pexels.com/photos/4498211/pexels-photo-4498211.jpeg?cs=srgb&dl=pexels-karolina-grabowska-4498211.jpg&fm=jpg")

fileprivate let p3Image = URL(string: "https://images.pexels.com/photos/5368995/pexels-photo-5368995.jpeg?cs=srgb&dl=pexels-allan-mas-5368995.jpg&fm=jpg")
fileprivate let p4Image = URL(string: "https://images.pexels.com/photos/4245981/pexels-photo-4245981.jpeg?cs=srgb&dl=pexels-ketut-subiyanto-4245981.jpg&fm=jpg")

fileprivate let p5Image = URL(string: "https://images.pexels.com/photos/5157247/pexels-photo-5157247.jpeg?cs=srgb&dl=pexels-budgeron-bach-5157247.jpg&fm=jpg")

fileprivate let p6Image = URL(string: "https://images.pexels.com/photos/5093676/pexels-photo-5093676.jpeg?cs=srgb&dl=pexels-kamaji-ogino-5093676.jpg&fm=jpg")

fileprivate let p7Image = URL(string: "https://images.pexels.com/photos/4792529/pexels-photo-4792529.jpeg?cs=srgb&dl=pexels-anete-lusina-4792529.jpg&fm=jpg")
