//
//  Items2.swift
//  DSKitCore
//
//  Created by Ivan Borinschi on 21.12.2022.
//

import SwiftUI
import DSKit

struct Items2: View {
    
    @Environment(\.appearance) var appearance: DSAppearance
    @Environment(\.colorGroup) var colorGroup: DSColorGroup
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ScrollView {
            productsView.dsPadding()
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
                title: "Jodhpur Boots",
                description: "House & Versace",
                price: DSPrice(amount: "84", regularAmount: "94", currency: "$"),
                favorite: true,
                image: jodhpurBootsImage
            )
            ProductView(
                title: "Platform derby shoes",
                description: "Stella McCarthney",
                price: DSPrice(amount: "92", currency: "$"),
                favorite: false,
                image: shoesImage
            )
            ProductView(
                title: "Motocross Boots",
                description: "Hermes",
                price: DSPrice(amount: "13", regularAmount: "82", currency: "$", discountBadge: "-69$"),
                favorite: true,
                image: motocrossBootsImage
            )
            ProductView(
                title: "Hiking Boots",
                description: "Dolce & Gabbana",
                price: DSPrice(amount: "84", currency: "$"),
                favorite: false,
                image: hikingBootsImage
            )
            ProductView(
                title: "Suede Chuck-a Boots",
                description: "River Island",
                tag: "SALES",
                price: DSPrice(amount: "22", regularAmount: "89", currency: "$"),
                favorite: true,
                image: bootsImage
            )
             ProductView(
                 title: "Riding Boots",
                 description: "Arrmani",
                 tag: "50% OFF",
                 price: DSPrice(amount: "57", regularAmount: "85", currency: "$"),
                 favorite: false,
                 image: ridingBootsImage
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
        ZStack(alignment: .bottom) {
            ZStack {
                DSImageView(url: image)
                LinearGradient(gradient: Gradient(colors: [Color.black.opacity(0.0), Color.black.opacity(0.2), Color.black.opacity(1)]),
                               startPoint: .top,
                               endPoint: .bottom)
            }.overlay(alignment: .topLeading) {
                if let tag {
                    DSText(tag, .headlineWithSize(9))
                        .dsPadding(.smaller)
                        .dsBackground()
                        .dsCornerRadius()
                        .dsPadding(.small)
                }
            }.overlay(alignment: .topTrailing) {
                DSImageView(
                    sfSymbol: "heart.fill",
                    size: .regular,
                    tint: .customColor(favorite ? .red : .white)
                )
                .dsPadding(.small)
                .dsBlurBackground(style: .light)
                .dsCornerRadius()
                .dsPadding(.small)
            }
            
            DSVStack(alignment: .center, spacing: .extraSmall) {
                DSText(title, .headlineWithSize(13), color: .customColor(.white))
                DSText(description, .smallSubtitle, color: .customColor(.white.opacity(0.8)))
                DSPriceView(price: price, size: .mediumLarge, color: .custom(Color.white))
            }
            .dsPadding(.bottom)
        }
        .dsSecondaryBackground()
        .dsCornerRadius()
        .dsHeight(280)
        .onTap { }
    }
}

struct Items2_Previews: PreviewProvider {
    
    static var previews: some View {
        PreviewForEach {
            NavigationView {
                Items2()
                    .navigationTitle("Items")
                    .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
}

fileprivate let bootsImage = URL(string: "https://images.pexels.com/photos/267242/pexels-photo-267242.jpeg?cs=srgb&dl=pexels-pixabay-267242.jpg&fm=jpg")
fileprivate let shoesImage = URL(string: "https://images.pexels.com/photos/1904769/pexels-photo-1904769.jpeg?cs=srgb&dl=pexels-sebastian-palomino-1904769.jpg&fm=jpg")
fileprivate let hikingBootsImage = URL(string: "https://images.pexels.com/photos/755871/pexels-photo-755871.jpeg?cs=srgb&dl=pexels-simon-migaj-755871.jpg&fm=jpg")
fileprivate let motocrossBootsImage = URL(string: "https://images.pexels.com/photos/718981/pexels-photo-718981.jpeg?cs=srgb&dl=pexels-aidan-jarrett-718981.jpg&fm=jpg")
fileprivate let ridingBootsImage = URL(string: "https://images.pexels.com/photos/6410600/pexels-photo-6410600.jpeg?cs=srgb&dl=pexels-jessica-jochheim-6410600.jpg&fm=jpg")
fileprivate let jodhpurBootsImage = URL(string: "https://images.pexels.com/photos/2682289/pexels-photo-2682289.jpeg?cs=srgb&dl=pexels-andrew-neel-2682289.jpg&fm=jpg")
