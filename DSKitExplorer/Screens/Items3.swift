//
//  Items3.swift
//  DSKit
//
//  Created by Ivan Borinschi on 21.12.2022.
//

import SwiftUI
import DSKit

struct Items3: View {
    
    @Environment(\.dismiss) var dismiss
    let viewModel = Items3Model()
    
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

extension Items3 {
    
    // MARK: - Product View
    
    struct ProductView: View {
        let product: Data
        var body: some View {
            ZStack {
                DSHStack(alignment: .center, spacing: .medium) {
                    DSImageView(url: product.image, size: .size(width: 90, height: 120))
                        .dsCornerRadius()
                    DSVStack(alignment: .leading) {
                        DSText(product.title).dsTextStyle(.smallHeadline)
                        DSText(product.description).dsTextStyle(.caption2)
                        DSPriceView(price: product.price, size: .smallHeadline)
                    }.frame(maxWidth: .infinity, alignment: .leading)
                }
                
                DSImageView(
                    systemName: "heart.fill",
                    size: .font(.subheadline),
                    tint: .color(product.favorite ? .red : .gray.opacity(0.5))
                )
                .dsPadding(.regular)
                .dsBackground(.primary)
                .dsCornerRadius()
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
            }
            .dsPadding(.regular)
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

final class Items3Model {
    
    let products: [Items3.ProductView.Data] = [
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

struct Testable_Items3: View {
    var body: some View {
        NavigationView {
            Items3()
                .navigationTitle("Products")
        }
    }
}

// MARK: - Preview

struct Items3_Previews: PreviewProvider {
    static var previews: some View {
        DSPreviewForEachAppearance { Testable_Items3() }
    }
}

// MARK: - Image Links

fileprivate let p1Image = URL(string: "https://images.pexels.com/photos/4969888/pexels-photo-4969888.jpeg?cs=srgb&dl=pexels-maria-orlova-4969888.jpg&fm=jpg")
fileprivate let p2Image = URL(string: "https://images.pexels.com/photos/4969986/pexels-photo-4969986.jpeg?cs=srgb&dl=pexels-maria-orlova-4969986.jpg&fm=jpg")
fileprivate let p3Image = URL(string: "https://images.pexels.com/photos/3149638/pexels-photo-3149638.jpeg?cs=srgb&dl=pexels-gbadamosi-ayokunle-hardeckx-3149638.jpg&fm=jpg")
fileprivate let p4Image = URL(string: "https://images.pexels.com/photos/3341604/pexels-photo-3341604.jpeg?cs=srgb&dl=pexels-thegiansepillo-3341604.jpg&fm=jpg")
fileprivate let p5Image = URL(string: "https://images.pexels.com/photos/6401657/pexels-photo-6401657.jpeg?cs=srgb&dl=pexels-dziana-hasanbekava-6401657.jpg&fm=jpg")
fileprivate let p6Image = URL(string: "https://images.pexels.com/photos/5372767/pexels-photo-5372767.jpeg?cs=srgb&dl=pexels-johanser-martinez-5372767.jpg&fm=jpg")
fileprivate let p7Image = URL(string: "https://images.pexels.com/photos/5303044/pexels-photo-5303044.jpeg?cs=srgb&dl=pexels-elijah-o%27donnell-5303044.jpg&fm=jpg")
