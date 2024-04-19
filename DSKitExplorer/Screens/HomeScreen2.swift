//
//  HomeScreen2.swift
//  DSKit
//
//  Created by Ivan Borinschi on 21.12.2022.
//

import SwiftUI
import DSKit

struct HomeScreen2: View {
    
    @StateObject var viewModel = HomeScreen2Model()
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ScrollView() {
            DSVStack {
                ProfileView(
                    title: "Shop",
                    subtitle: "Over 45k items available for you",
                    profileImageUrl: profileImageUrl
                )
                
                DSCoverFlow(height: 220, data: viewModel.topProducts, id: \.self) { imageUrl in
                    DSImageView(url: imageUrl, style: .capsule).onTap { self.dismiss() }
                }
                
                DSVStack {
                    DSSectionHeaderView(title: "Categories", actionTitle: "View all", action: { self.dismiss() })
                    DSGrid(data: viewModel.categories, id: \.id) { category in
                        CategoryView(title: category.title, action: { self.dismiss() })
                    }
                }
                
                DSVStack {
                    DSSectionHeaderView(title: "Discounts", actionTitle: "View all", action: { self.dismiss() })
                    DSGrid(viewHeight: 180, data: viewModel.products, id: \.id) { arrival in
                        ProductView(product: arrival)
                            .onTap { self.dismiss() }
                    }
                }
            }
        }.dsScreen()
    }
}

extension HomeScreen2 {
    
    // MARK: - Product View
    struct ProductView: View {
        let product: Product
        var body: some View {
            DSVStack {
                DSImageView(
                    url: product.imageUrl,
                    style: .capsule
                )
                DSVStack(spacing: .zero) {
                    DSText(product.title).dsTextStyle(.smallHeadline)
                    DSText(product.description).dsTextStyle(.smallSubtitle)
                    DSPriceView(price: product.price, size: .smallHeadline)
                        .dsPadding(.top, .regular)
                }
            }.dsPadding(.bottom)
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
                DSImageView(
                    url: profileImageUrl,
                    style: .circle,
                    size: 50
                )
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
                .dsCardStyle()
                .onTap { action() }
        }
        struct Category: Identifiable {
            let id = UUID()
            let title: String
        }
    }
}

// MARK: - Model

final class HomeScreen2Model: ObservableObject {
        
    var categories: [HomeScreen2.CategoryView.Category] = [
        .init(title: "Shoes"),
        .init(title: "Shirts"),
        .init(title: "Jeans"),
        .init(title: "Watches")
    ]
    
    var topProducts: [URL?] = [
        sneakersBlackOnBlueBg,
        sneakersWhiteOnYellowBg,
        sneakersThreePairs
    ]
    
    var products: [HomeScreen2.ProductView.Product] = [
        .init(
            title: "New trend",
            description: "Colourful sneakers",
            imageUrl: sneakersThreePairs,
            price: DSPrice(amount: "100", regularAmount: "120", currency: "$", discountBadge: "20% Off")
        ),
        .init(
            title: "Shirts",
            description: "Fresh prints of Bel-Air",
            imageUrl: shirtsThreePairs,
            price: DSPrice(amount: "50", regularAmount: "60", currency: "$", discountBadge: "15% Off")
        ),
        .init(
            title: "Shoes",
            description: "Bring power to you",
            imageUrl: shoesThreePairs,
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
            imageUrl: jeansOnBlackBg, 
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

struct Testable_HomeScreen2: View {
    var body: some View {
        HomeScreen2()
    }
}

// MARK: - Preview

struct HomeScreen2_Previews: PreviewProvider {
    static var previews: some View {
        DSPreviewForEachAppearance { HomeScreen2() }
    }
}

// MARK: - Image Links

fileprivate let profileImageUrl = URL(string: "https://images.pexels.com/photos/3760707/pexels-photo-3760707.jpeg?cs=srgb&dl=pexels-sound-on-3760707.jpg&fm=jpg")
fileprivate let sneakersBlackOnBlueBg = URL(string: "https://images.pexels.com/photos/1478442/pexels-photo-1478442.jpeg?cs=srgb&dl=pexels-ray-piedra-1478442.jpg&fm=jpg")
fileprivate let sneakersWhiteOnYellowBg = URL(string: "https://images.pexels.com/photos/2421374/pexels-photo-2421374.jpeg?cs=srgb&dl=pexels-hoang-loc-2421374.jpg&fm=jpg")
fileprivate let sneakersThreePairs = URL(string: "https://images.pexels.com/photos/2300334/pexels-photo-2300334.jpeg?cs=srgb&dl=pexels-adrian-dorobantu-2300334.jpg&fm=jpg")
fileprivate let shirtsThreePairs = URL(string: "https://images.unsplash.com/photo-1602810318383-e386cc2a3ccf?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MXx8c2hpcnRzfGVufDB8fDB8&ixlib=rb-1.2.1&auto=format&fit=crop&w=900&q=60")
fileprivate let shoesThreePairs = URL(string: "https://images.pexels.com/photos/267301/pexels-photo-267301.jpeg?cs=srgb&dl=pexels-pixabay-267301.jpg&fm=jpg")
fileprivate let watchesOnYellowBg = URL(string: "https://images.pexels.com/photos/277390/pexels-photo-277390.jpeg?cs=srgb&dl=pexels-pixabay-277390.jpg&fm=jpg")
fileprivate let jeansOnBlackBg = URL(string: "https://images.pexels.com/photos/1598507/pexels-photo-1598507.jpeg?cs=srgb&dl=pexels-mnz-1598507.jpg&fm=jpg")
fileprivate let tShirtGirlOnYellowBg = URL(string: "https://images.pexels.com/photos/761963/pexels-photo-761963.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260")
