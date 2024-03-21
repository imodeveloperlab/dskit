//
//  Items7.swift
//  DSKitCore
//
//  Created by Ivan Borinschi on 21.12.2022.
//

import SwiftUI
import DSKit

struct Items7: View {
    
    @Environment(\.appearance) var appearance: DSAppearance
    @Environment(\.colorGroup) var colorGroup: DSColorGroup
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
        DSVStack(spacing: .zero) {
            DSImageView(url: image)
                .dsSecondaryBackground()
            
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
                .overlay(alignment: .trailing) {
                    ChevronView()
                        .dsPadding(.trailing, .regular)
                }
            
            
            
        }.overlay(alignment: .topTrailing, content: {
            DSImageView(
                sfSymbol: "heart.fill",
                size: .regular,
                tint: .customColor(favorite ? .red : .white)
            )
            .dsPadding(.small)
            .dsBlurBackground(style: .light)
            .dsCornerRadius()
            .dsPadding(.small)
        })
        .dsSecondaryBackground()
        .dsCornerRadius()
        .dsHeight(300)
        .onTap { }
    }
}

struct Items7_Previews: PreviewProvider {
    
    static var previews: some View {
        PreviewForEach {
            NavigationView {
                Items7()
                    .navigationTitle("Items")
                    .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
}


fileprivate let p1Image = URL(string: "https://images.pexels.com/photos/4992628/pexels-photo-4992628.jpeg?cs=srgb&dl=pexels-rachel-claire-4992628.jpg&fm=jpg")

fileprivate let p2Image = URL(string: "https://images.pexels.com/photos/4498211/pexels-photo-4498211.jpeg?cs=srgb&dl=pexels-karolina-grabowska-4498211.jpg&fm=jpg")

fileprivate let p3Image = URL(string: "https://images.pexels.com/photos/5368995/pexels-photo-5368995.jpeg?cs=srgb&dl=pexels-allan-mas-5368995.jpg&fm=jpg")
fileprivate let p4Image = URL(string: "https://images.pexels.com/photos/4245981/pexels-photo-4245981.jpeg?cs=srgb&dl=pexels-ketut-subiyanto-4245981.jpg&fm=jpg")

fileprivate let p5Image = URL(string: "https://images.pexels.com/photos/5157247/pexels-photo-5157247.jpeg?cs=srgb&dl=pexels-budgeron-bach-5157247.jpg&fm=jpg")

fileprivate let p6Image = URL(string: "https://images.pexels.com/photos/5093676/pexels-photo-5093676.jpeg?cs=srgb&dl=pexels-kamaji-ogino-5093676.jpg&fm=jpg")

fileprivate let p7Image = URL(string: "https://images.pexels.com/photos/4792529/pexels-photo-4792529.jpeg?cs=srgb&dl=pexels-anete-lusina-4792529.jpg&fm=jpg")
