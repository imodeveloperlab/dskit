//
//  Categories5.swift
//  DSKitCore
//
//  Created by Ivan Borinschi on 21.12.2022.
//

import SwiftUI
import DSKit

struct Categories5: View {
    
    @Environment(\.dismiss) var dismiss
    let viewModel = Categories5Model()
    
    var body: some View {
        ScrollView {
            DSGrid(data: viewModel.categories, id: \.id) { category in
                CategoryView(category: category).onTap { dismiss() }
            }
        }.dsBackground()
    }
}

extension Categories5 {
    
    // MARK: - Categories View
    
    struct CategoryView: View {
        let category: Data
        var body: some View {
            Group {
                DSVStack(alignment: .center, spacing: .zero) {
                    DSImageView(url: category.image)
                    DSVStack(alignment: .center, spacing: .extraSmall) {
                        DSText(category.title, .smallTitle)
                        DSText(category.description, .subheadline)
                    }.dsPadding(.small)
                }
                .dsSecondaryBackground()
                .dsHeight(220)
                .overlay(alignment: .topTrailing) {
                    DSImageView(
                        sfSymbol: "heart.fill",
                        size: .regular,
                        tint: .customColor(category.favourite ? .red : .white)
                    )
                    .dsPadding(.small)
                    .dsBlurBackground(style: .light)
                    .dsCornerRadius()
                    .dsPadding(.small)
                }
                .overlay(alignment: .topLeading) {
                    if let tag = category.tag {
                        DSText(tag, .headlineWithSize(10), color: .customColor(.white))
                        .dsPadding(.small)
                        .dsBlurBackground(style: .light)
                        .dsCornerRadius()
                        .dsPadding(.small)
                    }
                }
            }
            .dsCornerRadius()
        }
        
        struct Data: Identifiable {
            var id = UUID()
            let title: String
            let description: String
            let image: URL?
            var tag: String? = nil
            var favourite: Bool = false
        }
    }
}

// MARK: - View Model

final class Categories5Model {
    let categories: [Categories5.CategoryView.Data] = [
        .init(title: "Shoes", description: "812 items", image: sneakersNeon, tag: "Sales"),
        .init(title: "Shirts", description: "1.4K items", image: personOnNeonRegBg),
        .init(title: "Watches", description: "20K items", image: watchesOnYellowBg, favourite: true),
        .init(title: "Shorts", description: "2.5k items", image: personInWhite),
        .init(title: "Jackets", description: "20K items", image: personOnOrangeBg),
        .init(title: "Blazers", description: "915 items", image: personOnPurpleNeonBg, favourite: true),
        .init(title: "Track Pants", description: "600 items", image: pantsTrack),
        .init(title: "Jeans", description: "345 items", image: personOnMarineBg),
    ]
}

// MARK: - Preview

struct Categories5_Previews: PreviewProvider {
    static var previews: some View {
        PreviewForEach {
            NavigationView {
                Categories5()
                    .navigationTitle("Categories")
            }
        }
    }
}

// MARK: - Image Links

fileprivate let sneakersNeon = URL(string: "https://images.pexels.com/photos/6698232/pexels-photo-6698232.jpeg?cs=srgb&dl=pexels-smith-major-6698232.jpg&fm=jpg")
fileprivate let personOnNeonRegBg = URL(string: "https://images.pexels.com/photos/1809393/pexels-photo-1809393.jpeg?cs=srgb&dl=pexels-garret-schappacher-1809393.jpg&fm=jpg")
fileprivate let watchesOnYellowBg = URL(string: "https://images.pexels.com/photos/277390/pexels-photo-277390.jpeg?cs=srgb&dl=pexels-pixabay-277390.jpg&fm=jpg")
fileprivate let personInWhite = URL(string: "https://images.pexels.com/photos/3622624/pexels-photo-3622624.jpeg?cs=srgb&dl=pexels-wesley-carvalho-3622624.jpg&fm=jpg")
fileprivate let personOnOrangeBg = URL(string: "https://images.pexels.com/photos/3641363/pexels-photo-3641363.jpeg?cs=srgb&dl=pexels-mikotoraw-3641363.jpg&fm=jpg")
fileprivate let personOnPurpleNeonBg = URL(string: "https://images.pexels.com/photos/3596555/pexels-photo-3596555.jpeg?cs=srgb&dl=pexels-yogendra-singh-3596555.jpg&fm=jpg")
fileprivate let pantsTrack = URL(string: "https://images.pexels.com/photos/5067705/pexels-photo-5067705.jpeg?cs=srgb&dl=pexels-anna-shvets-5067705.jpg&fm=jpg")
fileprivate let personOnMarineBg = URL(string: "https://images.pexels.com/photos/3760852/pexels-photo-3760852.jpeg?cs=srgb&dl=pexels-sound-on-3760852.jpg&fm=jpg")
