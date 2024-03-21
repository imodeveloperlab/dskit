//
//  Items8.swift
//  DSKitCore
//
//  Created by Ivan Borinschi on 21.12.2022.
//

import SwiftUI
import DSKit

struct Items8: View {
    
    @Environment(\.dismiss) var dismiss
        
    var body: some View {
        ScrollView {
            DSVStack {
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
        DSVStack {
            ProductView(
                title: "The Iconic Mesh Polo Shirt - All Fits",
                description: "Polo Ralph Lauren",
                tag: "SALES",
                price: DSPrice(amount: "22", regularAmount: "89", currency: "$"),
                favorite: true,
                image: p1Image
            )
             ProductView(
                 title: "Big Pony Mesh Polo Shirt",
                 description: "Stella McCarthney",
                 price: DSPrice(amount: "92", currency: "$"),
                 favorite: false,
                 image: p2Image
             )
             ProductView(
                 title: "Soft Cotton Polo Shirt - All Fits",
                 description: "Hermes",
                 price: DSPrice(amount: "13", regularAmount: "82", currency: "$", discountBadge: "-69$"),
                 favorite: true,
                 image: p4Image
             )
             ProductView(
                 title: "Big Pony Mesh Polo Shirt",
                 description: "Arrmani",
                 tag: "50% OFF",
                 price: DSPrice(amount: "57", regularAmount: "85", currency: "$"),
                 favorite: false,
                 image: p5Image
             )
             ProductView(
                 title: "Polo Team Mesh Polo Shirt",
                 description: "House & Versace",
                 price: DSPrice(amount: "84", regularAmount: "94", currency: "$"),
                 favorite: true,
                 image: p6Image
             )
            ProductView(
                title: "Polo Team Mesh Polo Shirt",
                description: "House & Versace",
                price: DSPrice(amount: "84", regularAmount: "94", currency: "$"),
                favorite: true,
                image: p7Image
            )
            ProductView(
                title: "Mesh Long-Sleeve Polo Shirt – All Fits",
                description: "Dolce & Gabbana",
                price: DSPrice(amount: "84", currency: "$"),
                favorite: false,
                image: p3Image
            )
        }
    }
}

fileprivate struct ProductView: View {
    
    @Environment(\.appearance) var appearance: DSAppearance
    
    let title: String
    let description: String
    var tag: String?
    let price: DSPrice
    let favorite: Bool
    let image: URL?
    
    var body: some View {
        DSHStack(spacing: .regular) {
            DSImageView(url: image)
                .dsSecondaryBackground()
                .dsSize(.size(width: 100, height: 120))
            
            DSVStack {
                
                DSVStack(spacing: .extraSmall) {
                    DSText(title, .headlineWithSize(13))
                    DSText(description, .smallSubtitle)
                }
                
                DSHStack {
                    RatingView(rating: 4.5, size: 12)
                    DSText("2.4k Reviews", .caption2)
                }
                
                DSPriceView(price: price, size: .regular)
                
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .dsPadding(.small)
            
        }.overlay(alignment: .topLeading) {
            DSImageView(
                sfSymbol: "heart.fill",
                size: .regular,
                tint: .customColor(favorite ? .red : .white)
            )
            .dsPadding(.small)
        }
        .overlay(alignment: .trailing) {
            DSImageView(
                sfSymbol: "ellipsis",
                size: .regular,
                tint: .text(.headline)
            )
            .dsPadding(.regular)
        }
        .dsSecondaryBackground()
        .dsCornerRadius()
        .onTap { }
    }
}

struct Items8_Previews: PreviewProvider {
    
    static var previews: some View {
        PreviewForEach {
            NavigationView {
                Items8()
                    .navigationTitle("Items")
                    .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
}

fileprivate let p1Image = URL(string: "https://images.pexels.com/photos/6417926/pexels-photo-6417926.jpeg?cs=srgb&dl=pexels-pavel-danilyuk-6417926.jpg&fm=jpg")
fileprivate let p2Image = URL(string: "https://images.pexels.com/photos/3760610/pexels-photo-3760610.jpeg?cs=srgb&dl=pexels-andrea-piacquadio-3760610.jpg&fm=jpg")
fileprivate let p3Image = URL(string: "https://images.pexels.com/photos/2096694/pexels-photo-2096694.jpeg?cs=srgb&dl=pexels-luis-quintero-2096694.jpg&fm=jpg")
fileprivate let p4Image = URL(string: "https://images.pexels.com/photos/4928997/pexels-photo-4928997.jpeg?cs=srgb&dl=pexels-cottonbro-4928997.jpg&fm=jpg")
fileprivate let p5Image = URL(string: "https://images.pexels.com/photos/3746314/pexels-photo-3746314.jpeg?cs=srgb&dl=pexels-anna-shvets-3746314.jpg&fm=jpg")
fileprivate let p6Image = URL(string: "https://images.pexels.com/photos/4349750/pexels-photo-4349750.jpeg?cs=srgb&dl=pexels-ketut-subiyanto-4349750.jpg&fm=jpg")
fileprivate let p7Image = URL(string: "https://images.pexels.com/photos/5082985/pexels-photo-5082985.jpeg?cs=srgb&dl=pexels-cottonbro-5082985.jpg&fm=jpg")
