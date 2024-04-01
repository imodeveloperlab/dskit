//
//  HomeScreen4.swift
//  DSKit
//
//  Created by Ivan Borinschi on 21.12.2022.
//

import SwiftUI
import DSKit

struct HomeScreen4: View {
    
    @StateObject var viewModel = HomeScreen4Model()
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ScrollView() {
            DSVStack(spacing: .medium) {
                
                ProfileView(
                    title: "Shoes Shop",
                    youHave: "You have",
                    numberOfItemsInCart: "4",
                    itemsInYourCart: "items in your cart",
                    profileImageUrl: profileOnYellowBg
                )
                
                DSCoverFlow(height: 190, data: viewModel.topProducts, id: \.imageUrl) { product in
                    TopProductView(product: product)
                        .onTap { self.dismiss() }
                }
                
                DSHScroll(data: viewModel.categories, id: \.id) { category in
                    CategoryView(category: category, isSelected: viewModel.selectedCategory == category.id)
                        .onTap { viewModel.selectedCategory = category.id }
                }
                
                DSVStack {
                    DSGrid(viewHeight: 190, data: viewModel.products, id: \.id) { product in
                        ProductView(product: product).onTap { self.dismiss() }
                    }
                }
            }
        }.dsScreen()
    }
}

extension HomeScreen4 {
    
    // MARK: - Product View
    struct ProductView: View {
        let product: Product
        var body: some View {
            DSVStack(spacing: .zero) {
                DSImageView(uiImage: UIImage(named: product.image))
                DSVStack(spacing: .zero) {
                    DSText(product.title, .smallTitle)
                    DSText(product.description, .smallSubtitle)
                    DSPriceView(price: product.price, size: .smallTitle)
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
            let image: String
            let price: DSPrice
        }
    }
    
    // MARK: - Top Product View
    struct TopProductView: View {
        let product: TopProduct
        var body: some View {
            Group {
                DSImageView(url: product.imageUrl)
                    .overlay(alignment: .bottomTrailing) {
                        DSVStack(alignment: .trailing, spacing: .zero) {
                            DSText(product.title, .smallTitle)
                            DSText(product.subtitle, .smallSubtitle)
                        }
                        .dsPadding(.regular)
                        .dsBackground(.secondaryViewBackground)
                        .dsCornerRadius()
                        .dsPadding(.regular)
                    }
            }.dsCornerRadius()
        }
        struct TopProduct: Identifiable, Equatable {
            let id = UUID()
            let title: String
            let subtitle: String
            let imageUrl: URL?
        }
    }
    
    // MARK: - Profile View
    struct ProfileView: View {
        let title: String
        let youHave: String
        let numberOfItemsInCart: String
        let itemsInYourCart: String
        let profileImageUrl: URL?
        var body: some View {
            DSHStack {
                DSVStack(spacing: .zero) {
                    DSText(title, .fontAndSize(.headline, 28))
                    DSHStack(spacing: .small) {
                        DSText(youHave, .font(.subheadline))
                        DSText(numberOfItemsInCart, .fontAndSize(.headline, 12), color: .primaryViewBackground)
                            .dsSize(.medium)
                            .dsBackground(.brandColor)
                            .clipShape(Circle())
                        DSText(itemsInYourCart, .font(.subheadline))
                    }
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
        let category: Category
        let isSelected: Bool
        var body: some View {
            DSHStack {
                DSText(
                    category.title,
                    .smallTitle,
                    color: isSelected ? .primaryViewButtonTitle : .none
                )
                DSText(category.count, .fontAndSize(.headline, 10))
                    .dsSize(20)
                    .dsBackground(isSelected ? .secondaryViewBackground : .primaryViewBackground)
                    .clipShape(Capsule())
            }
            .dsPadding(.horizontal)
            .dsHeight(35)
            .dsBackground(isSelected ? .secondaryViewButtonBackground : .secondaryViewBackground)
            .dsCornerRadius()
        }
        struct Category: Identifiable {
            let id = UUID()
            let title: String
            let count: String
        }
    }
}

// MARK: - Model

final class HomeScreen4Model: ObservableObject {
    
    init() {
        selectedCategory = categories.first!.id
    }
    
    @Published var selectedCategory: UUID
    
    var categories: [HomeScreen4.CategoryView.Category] = [
        .init(title: "Nike", count: "12"),
        .init(title: "Puma", count: "7"),
        .init(title: "Crocs", count: "56"),
        .init(title: "Vans", count: "23"),
        .init(title: "New Balance", count: "12"),
    ]
    
    var topProducts: [HomeScreen4.TopProductView.TopProduct] = [
        .init(title: "Nike", subtitle: "Top quality", imageUrl: sneakersOnWhiteBg),
        .init(title: "Love", subtitle: "Bring the future to light", imageUrl: sneakersNeon),
        .init(title: "Converse", subtitle: "All the stars in the world", imageUrl: sneakersWhiteOnYellowBg)
    ]
    
    var products: [HomeScreen4.ProductView.Product] = [
        .init(
            title: "Total Orange",
            description: "Air Max 95 x Kim Jones",
            image: "nike_1",
            price: DSPrice(amount: "85", regularAmount: "120", currency: "$", discountBadge: "-29%")
        ),
        .init(
            title: "All-Star",
            description: "Kobe 6 Protro",
            image: "nike_2",
            price: DSPrice(amount: "90", regularAmount: "130", currency: "$", discountBadge: "-29%")
        ),
        .init(
            title: "Bacon",
            description: "Air Max 90",
            image: "nike_3",
            price: DSPrice(amount: "75", regularAmount: "110", currency: "$", discountBadge: "-29%")
        ),
        .init(
            title: "Midnight Navy",
            description: "Air Jordan 3",
            image: "nike_4",
            price: DSPrice(amount: "95", regularAmount: "140", currency: "$", discountBadge: "-29%")
        ),
        .init(
            title: "College Navy",
            description: "Women's Dunk Low",
            image: "nike_5",
            price: DSPrice(amount: "80", regularAmount: "115", currency: "$", discountBadge: "-29%")
        ),
        .init(
            title: "Black",
            description: "Dunk Low",
            image: "nike_6",
            price: DSPrice(amount: "100", regularAmount: "150", currency: "$", discountBadge: "-29%")
        )
    ]
}

// MARK: - Testable

struct Testable_HomeScreen4: View {
    var body: some View {
        HomeScreen4()
    }
}

// MARK: - Preview

struct HomeScreen4_Previews: PreviewProvider {
    static var previews: some View {
        PreviewForEach { HomeScreen4() }
    }
}

// MARK: - Image Links

fileprivate let profileOnYellowBg = URL(string: "https://images.pexels.com/photos/3783525/pexels-photo-3783525.jpeg?cs=srgb&dl=pexels-andrea-piacquadio-3783525.jpg&fm=jpg")
fileprivate let sneakersOnWhiteBg = URL(string: "https://images.pexels.com/photos/1858404/pexels-photo-1858404.jpeg?cs=srgb&dl=pexels-athena-1858404.jpg&fm=jpg")
fileprivate let sneakersNeon = URL(string: "https://images.pexels.com/photos/6698232/pexels-photo-6698232.jpeg?cs=srgb&dl=pexels-smith-major-6698232.jpg&fm=jpg")
fileprivate let sneakersWhiteOnYellowBg = URL(string: "https://images.pexels.com/photos/2421374/pexels-photo-2421374.jpeg?cs=srgb&dl=pexels-hoang-loc-2421374.jpg&fm=jpg")
