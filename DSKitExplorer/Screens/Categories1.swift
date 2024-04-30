//
//  Categories1.swift
//  DSKit
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
            DSVStack(spacing: .small) {
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
            DSHStack(spacing: .medium) {
                if category.image != nil {
                    DSImageView(url: category.image,  size: .size(width: 60, height: 60))
                        .dsCornerRadius()
                        .dsPadding(.leading, .regular)
                        .dsPadding(.top, .regular)
                        .dsPadding(.bottom, .regular)
                }
                
                DSVStack {
                    DSVStack(spacing: .zero) {
                        DSText(category.title).dsTextStyle(.smallHeadline)
                        DSText(category.description).dsTextStyle(.smallSubtitle)
                    }
                }
                .dsPadding(category.image != nil ? .zero : .medium)
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
            image: purpleShoes
        ),
        .init(
             title: "Shirts",
             description: "1.4K items"
         ),
        .init(
             title: "Jeans",
             description: "345 items",
             image: jeansPairs
         ),
        .init(
             title: "Watches",
             description: "20K items",
             image: watchesOnYellowBg
         ),
        .init(
             title: "Shorts",
             description: "2.5k items"
         ),
        .init(
            title: "Track Pants",
            description: "600 items",
            image: pantsTrack
        ),
        .init(
            title: "Jackets",
            description: "20K items"
        ),
        .init(
            title: "Blazers",
            description: "915 items",
            image: blazers
        ),
        .init(
            title: "Socks",
            description: "75.1K items"
        )
    ]
}

// MARK: - Testable

struct Testable_Categories1: View {
    var body: some View {
        NavigationView {
            Categories1()
                .navigationTitle("Categories")
        }
    }
}

// MARK: - Preview

struct Categories1_Previews: PreviewProvider {
    static var previews: some View {
        DSPreviewForEachAppearance { Testable_Categories1() }
    }
}

fileprivate let purpleShoes = URL(string: "https://images.pexels.com/photos/2351858/pexels-photo-2351858.jpeg?cs=srgb&dl=pexels-lorena-mart%C3%ADnez-2351858.jpg&fm=jpg")
fileprivate let jeansPairs = URL(string: "https://images.pexels.com/photos/4210863/pexels-photo-4210863.jpeg?cs=srgb&dl=pexels-karolina-grabowska-4210863.jpg&fm=jpg")
fileprivate let watchesOnYellowBg = URL(string: "https://images.pexels.com/photos/277390/pexels-photo-277390.jpeg?cs=srgb&dl=pexels-pixabay-277390.jpg&fm=jpg")
fileprivate let pantsTrack = URL(string: "https://images.pexels.com/photos/5067705/pexels-photo-5067705.jpeg?cs=srgb&dl=pexels-anna-shvets-5067705.jpg&fm=jpg")
fileprivate let blazers = URL(string: "https://images.pexels.com/photos/3555456/pexels-photo-3555456.jpeg?cs=srgb&dl=pexels-mikotoraw-3555456.jpg&fm=jpg")
