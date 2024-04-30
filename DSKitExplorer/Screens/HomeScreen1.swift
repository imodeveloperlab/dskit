//
//  HomeScreen1.swift
//  DSKit
//
//  Created by Ivan Borinschi on 21.12.2022.
//

import SwiftUI
import DSKit

struct HomeScreen1: View {
    
    @StateObject var viewModel = HomeScreen1Model()
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ScrollView() {
            DSVStack {
                ProfileView(title: "Your Shop", subtitle: "The best experience", profileUrl: profile)
                DSCoverFlow(height: 220, data: viewModel.topProducts, id: \.self) { imageUrl in
                    DSImageView(url: imageUrl, style: .capsule).onTap { self.dismiss() }
                }
                DSVStack {
                    DSSectionHeaderView(title: "New arrivals", actionTitle: "View All", action: { dismiss() })
                    DSGrid(viewHeight: 180, data: viewModel.newArrivals, id: \.id) { arrival in
                        ProductView(product: arrival).onTap { dismiss() }
                    }
                }
            }
        }.dsScreen()
    }
}

extension HomeScreen1 {
    
    // MARK: - Product View
    struct ProductView: View {
        let product: Product
        var body: some View {
            DSVStack {
                DSImageView(url: product.imageUrl, style: .capsule)
                DSVStack(spacing: .zero) {
                    DSText(product.title).dsTextStyle(.smallHeadline)
                    DSText(product.description).dsTextStyle(.smallSubtitle)
                }
            }.dsPadding(.bottom, .regular)
        }
        struct Product: Identifiable {
            let id = UUID()
            let title: String
            let description: String
            let imageUrl: URL?
        }
    }
    
    // MARK: - Profile View
    struct ProfileView: View {
        let title: String
        let subtitle: String
        let profileUrl: URL?
        var body: some View {
            DSHStack {
                DSVStack(spacing: .zero) {
                    DSText(title).dsTextStyle(.largeHeadline)
                    DSText(subtitle).dsTextStyle(.subheadline)
                }
                Spacer()
                DSImageView(url: profileUrl, style: .circle, size: .size(50))
            }
        }
    }
}

// MARK: - Model

final class HomeScreen1Model: ObservableObject {
        
    var topProducts: [URL?] = [
        sneakersWhiteOnYellowBg,
        sneakersBlackOnBlueBg,
        sneakersThreePairs
    ]
    
    var newArrivals: [HomeScreen1.ProductView.Product] = [
        .init(title: "New trend", description: "Colourful sneakers", imageUrl: sneakersThreePairs),
        .init(title: "Shirts", description: "Fresh prints of Bel-Air", imageUrl: shirtsThreePairs),
        .init(title: "Shoes", description: "Bring power to you", imageUrl: shoesThreePairs),
        .init(title: "Watches", description: "Time is what you make", imageUrl: watchesOnYellowBg),
        .init(title: "Jeans", description: "Quality newer goes down", imageUrl: jeansOnBlackBg),
        .init(title: "T-Shirts", description: "Blink if you want me", imageUrl: tShirtGirlOnYellowBg)
    ]
}

// MARK: - Testable

struct Testable_HomeScreen1: View {
    var body: some View {
        HomeScreen1()
    }
}

// MARK: - Preview

struct HomeScreen1_Previews: PreviewProvider {
    static var previews: some View {
        DSPreviewForEachAppearance { HomeScreen1() }
    }
}

// MARK: - Image Links

fileprivate let profile = URL(string: "https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&auto=format&fit=crop&w=1400&q=80")

fileprivate let sneakersThreePairs = URL(string: "https://images.pexels.com/photos/2300334/pexels-photo-2300334.jpeg?cs=srgb&dl=pexels-adrian-dorobantu-2300334.jpg&fm=jpg")
fileprivate let sneakersBlackOnBlueBg = URL(string: "https://images.pexels.com/photos/1478442/pexels-photo-1478442.jpeg?cs=srgb&dl=pexels-ray-piedra-1478442.jpg&fm=jpg")
fileprivate let sneakersWhiteOnYellowBg = URL(string: "https://images.pexels.com/photos/2421374/pexels-photo-2421374.jpeg?cs=srgb&dl=pexels-hoang-loc-2421374.jpg&fm=jpg")

fileprivate let shirtsThreePairs = URL(string: "https://images.unsplash.com/photo-1602810318383-e386cc2a3ccf?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MXx8c2hpcnRzfGVufDB8fDB8&ixlib=rb-1.2.1&auto=format&fit=crop&w=900&q=60")
fileprivate let shoesThreePairs = URL(string: "https://images.pexels.com/photos/267301/pexels-photo-267301.jpeg?cs=srgb&dl=pexels-pixabay-267301.jpg&fm=jpg")
fileprivate let watchesOnYellowBg = URL(string: "https://images.pexels.com/photos/277390/pexels-photo-277390.jpeg?cs=srgb&dl=pexels-pixabay-277390.jpg&fm=jpg")
fileprivate let jeansOnBlackBg = URL(string: "https://images.pexels.com/photos/1598507/pexels-photo-1598507.jpeg?cs=srgb&dl=pexels-mnz-1598507.jpg&fm=jpg")
fileprivate let tShirtGirlOnYellowBg = URL(string: "https://images.pexels.com/photos/761963/pexels-photo-761963.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260")
