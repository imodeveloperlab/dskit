//
//  HomeScreen3.swift
//  DSKit
//
//  Created by Ivan Borinschi on 21.12.2022.
//

import SwiftUI
import DSKit

struct HomeScreen3: View {
    
    @StateObject var viewModel = HomeScreen3Model()
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ScrollView() {
            DSVStack {
                ProfileView(
                    title: "Jane Doe",
                    subtitle: "4 Items in cart",
                    profileImageUrl: profileOnRedBg
                )
                
                DSCoverFlow(height: 220, data: viewModel.topProducts, id: \.self) { imageUrl in
                    DSImageView(url: imageUrl, style: .capsule).onTap { self.dismiss() }
                }
                
                DSHScroll(data: viewModel.categories, id: \.self) { category in
                    CategoryView(title: category) { dismiss() }
                }
                
                DSVStack {
                    DSSectionHeaderView(title: "Discounts", actionTitle: "View all", action: { self.dismiss() })
                    DSGrid(viewHeight: 200, data: viewModel.products, id: \.id) { product in
                        ProductView(product: product).onTap { self.dismiss() }
                    }
                }
            }
        }.dsScreen()
    }
}

extension HomeScreen3 {
    
    // MARK: - Product View
    struct ProductView: View {
        let product: Product
        var body: some View {
            DSVStack(spacing: .zero) {
                DSImageView(url: product.imageUrl)
                DSVStack(spacing: .zero) {
                    DSText(product.title).dsTextStyle(.smallHeadline)
                    DSText(product.description).dsTextStyle(.smallSubtitle)
                    DSPriceView(price: product.price, size: .smallHeadline)
                        .dsPadding(.top, .regular)
                }.dsPadding()
            }
            .dsSecondaryBackground()
            .dsCornerRadius()
        }
        struct Product: Identifiable {
            let id = UUID()
            let title: String
            let description: String
            let imageUrl: URL?
            let price: DSPrice
        }
    }
    
    // MARK: - Profile View
    struct ProfileView: View {
        let title: String
        let subtitle: String
        let profileImageUrl: URL?
        var body: some View {
            DSHStack {
                DSVStack(spacing: .zero) {
                    DSText(title).dsTextStyle(.largeHeadline)
                    DSText(subtitle).dsTextStyle(.subheadline)
                }
                Spacer()
                DSImageView(url: profileImageUrl, style: .circle, size: 50)
            }
        }
    }
    
    // MARK: - Category View
    struct CategoryView: View {
        let title: String
        let action: () -> Void
        var body: some View {
            DSText(title).dsTextStyle(.smallHeadline)
                .frame(maxWidth: .infinity, alignment: .center)
                .dsHeight(35)
                .dsPadding(.horizontal, .large)
                .dsSecondaryBackground()
                .dsCornerRadius()
                .onTap { action() }
        }
    }
}

// MARK: - Model

final class HomeScreen3Model: ObservableObject {
    
    var categories = ["Shoes", "Shirts", "Jeans", "Watches", "Accessories"]
    
    var topProducts: [URL?] = [
        personOnYellowBg,
        sneakersBlackOnBlueBg,
        sneakersThreePairs
    ]
    
    var products: [HomeScreen3.ProductView.Product] = [
        .init(
            title: "New trend",
            description: "Colourful sneakers",
            imageUrl: personOnPurpleBg2,
            price: DSPrice(amount: "100", regularAmount: "120", currency: "$", discountBadge: "20% Off")
        ),
        .init(
            title: "Shirts",
            description: "Fresh prints of Bel-Air",
            imageUrl: personOnPurpleBg,
            price: DSPrice(amount: "50", regularAmount: "60", currency: "$", discountBadge: "15% Off")
        ),
        .init(
            title: "Shoes",
            description: "Bring power to you",
            imageUrl: sneakersOnBlackBg,
            price: DSPrice(amount: "200", regularAmount: "250", currency: "$", discountBadge: "20% Off")
        ),
        .init(
            title: "Watches",
            description: "Time is what you make",
            imageUrl: watchesOnYellowBg,
            price: DSPrice(amount: "300", regularAmount: "350", currency: "$", discountBadge: "10% Off")
        ),
        .init(
            title: "Jeans",
            description: "Quality newer goes down",
            imageUrl: personOnBlueBg,
            price: DSPrice(amount: "80", regularAmount: "90", currency: "$", discountBadge: "10% Off")
        ),
        .init(
            title: "T-Shirts",
            description: "Blink if you want me",
            imageUrl: tShirtGirlOnYellowBg,
            price: DSPrice(amount: "40", regularAmount: "45", currency: "$", discountBadge: "10% Off")
        )
    ]
}

// MARK: - Testable

struct Testable_HomeScreen3: View {
    var body: some View {
        HomeScreen3()
    }
}

// MARK: - Preview

struct HomeScreen3_Previews: PreviewProvider {
    static var previews: some View {
        DSPreviewForEachAppearance { HomeScreen3() }
    }
}

// MARK: - Image Links

fileprivate let profileOnRedBg = URL(string: "https://images.pexels.com/photos/3765114/pexels-photo-3765114.jpeg?cs=srgb&dl=pexels-andrea-piacquadio-3765114.jpg&fm=jpg")
fileprivate let personOnPurpleBg2 = URL(string: "https://images.pexels.com/photos/2146723/pexels-photo-2146723.jpeg?cs=srgb&dl=pexels-luis-quintero-2146723.jpg&fm=jpg")
fileprivate let personOnPurpleBg = URL(string: "https://images.pexels.com/photos/3076307/pexels-photo-3076307.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260")
fileprivate let sneakersOnBlackBg = URL(string: "https://images.pexels.com/photos/582485/pexels-photo-582485.jpeg?cs=srgb&dl=pexels-karol-d-582485.jpg&fm=jpg")
fileprivate let watchesOnYellowBg = URL(string: "https://images.pexels.com/photos/277390/pexels-photo-277390.jpeg?cs=srgb&dl=pexels-pixabay-277390.jpg&fm=jpg")
fileprivate let personOnBlueBg = URL(string: "https://images.pexels.com/photos/3769702/pexels-photo-3769702.jpeg?cs=srgb&dl=pexels-andrea-piacquadio-3769702.jpg&fm=jpg")
fileprivate let tShirtGirlOnYellowBg = URL(string: "https://images.pexels.com/photos/761963/pexels-photo-761963.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260")
fileprivate let personOnYellowBg = URL(string: "https://images.pexels.com/photos/3760770/pexels-photo-3760770.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260")
fileprivate let sneakersBlackOnBlueBg = URL(string: "https://images.pexels.com/photos/1478442/pexels-photo-1478442.jpeg?cs=srgb&dl=pexels-ray-piedra-1478442.jpg&fm=jpg")
fileprivate let sneakersThreePairs = URL(string: "https://images.pexels.com/photos/2300334/pexels-photo-2300334.jpeg?cs=srgb&dl=pexels-adrian-dorobantu-2300334.jpg&fm=jpg")
