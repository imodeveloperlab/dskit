//
//  Categories1.swift
//  DSKitCore
//
//  Created by Ivan Borinschi on 21.12.2022.
//

import SwiftUI
import DSKit

struct Categories1: View {
    
    @Environment(\.dismiss) var dismiss
    let viewModel = Categories1Model()
        
    var body: some View {
        ScrollView {
            DSVStack(spacing: .smaller) {
                ForEach(viewModel.categories) { category in
                    CategoryView(category: category)
                        .onTap { }
                }
            }
        }.dsScreen()
    }
}

extension Categories1 {
    
    // MARK: - Category View
    
    struct CategoryView: View {
        let category: Data
        var body: some View {
            DSHStack(spacing: .regular) {
                if category.image != nil {
                    DSImageView(url: category.image,  size: .size(width: 60, height: 60))
                        .dsCornerRadius()
                        .dsPadding(.leading, .small)
                        .dsPadding(.top, .small)
                        .dsPadding(.bottom, .small)
                }
                
                DSVStack {
                    DSVStack(spacing: .extraSmall) {
                        DSText(category.title, .smallTitle)
                        DSText(category.description, .smallSubtitle)
                    }
                }
                .dsPadding(category.image != nil ? .zero : .regular)
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            .overlay(alignment: .trailing) {
                DSChevronView().dsPadding()
            }.dsCardStyle(padding: 0)
        }
        
        struct Data: Identifiable {
            let id = UUID()
            let title: String
            let description: String
            var image: URL? = nil
        }
    }
}

// MARK: - View Model

final class Categories1Model {
    let categories: [Categories1.CategoryView.Data] = [
        .init(
            title: "Shoes",
            description: "812 items",
            image: URL.purpleShoes
        ),
        .init(
             title: "Shirts",
             description: "1.4K items"
         ),
        .init(
             title: "Jeans",
             description: "345 items",
             image: URL.jeansPairs
         ),
        .init(
             title: "Watches",
             description: "20K items",
             image: URL.watchesOnYellowBg
         ),
        .init(
             title: "Shorts",
             description: "2.5k items"
         ),
        .init(
            title: "Track Pants",
            description: "600 items",
            image: URL.pantsTrack
        ),
        .init(
            title: "Jackets",
            description: "20K items"
        ),
        .init(
            title: "Blazers",
            description: "915 items",
            image: URL.blazers
        ),
        .init(
            title: "Socks",
            description: "75.1K items"
        )
    ]
}

// MARK: - Preview

struct Categories1_Previews: PreviewProvider {
    static var previews: some View {
        PreviewForEach {
            NavigationView {
                Categories1()
                    .navigationTitle("Categories")
            }
        }
    }
}

