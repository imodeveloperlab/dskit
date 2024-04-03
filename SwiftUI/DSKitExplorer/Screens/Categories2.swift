//
//  Categories2.swift
//  DSKit
//
//  Created by Ivan Borinschi on 21.12.2022.
//

import SwiftUI
import DSKit

struct Categories2: View {
    
    @Environment(\.dismiss) var dismiss
    let viewModel = Categories2Model()
    
    var body: some View {
        ScrollView {
            DSGrid(data: viewModel.categories, id: \.id) { category in
                CategoryView(category: category)
            }
        }.dsScreen()
    }
}

extension Categories2 {
    
    // MARK: - Category View
    
    struct CategoryView: View {
        let category: Data
        var body: some View {
            ZStack(alignment: .bottom) {
                ZStack {
                    DSImageView(url: category.image)
                    LinearGradient(gradient: Gradient(colors: [Color.black.opacity(0.0), Color.black.opacity(0.2), Color.black.opacity(1)]),
                                   startPoint: .top,
                                   endPoint: .bottom)
                }
                DSVStack(alignment: .center, spacing: .zero) {
                    DSText(category.title, .styleWithColor(.headline, .customColor(.white)))
                    DSText(category.description, .reStyleWithColor(.smallSubtitle, .customColor(.white.opacity(0.8))))
                }
                .dsPadding(.bottom)
            }
            .dsSecondaryBackground()
            .dsCornerRadius()
            .dsHeight(250)
            .onTap { }
        }
        
        struct Data: Identifiable {
           var id = UUID()
           let title: String
           let description: String
           let image: URL?
       }
    }
}

// MARK: - View Model

final class Categories2Model {
    let categories: [Categories2.CategoryView.Data] = [
        .init(title: "Shorts", description: "2.5k items", image: personInWhite),
        .init(title: "Jackets", description: "20K items", image: personOnOrangeBg),
        .init(title: "Blazers", description: "915 items", image: blazers),
        .init(title: "Track Pants", description: "600 items", image: pantsTrack),
        .init(title: "Shirts", description: "1.4K items", image: shirtsThreePairs),
        .init(title: "Jeans", description: "345 items", image: jeansOnBlackBg),
        .init(title: "Shoes", description: "812 items", image: shoesThreePairs),
        .init(title: "Watches", description: "20K items", image: watchesOnYellowBg)
    ]
}

// MARK: - Testable

struct Testable_Categories2: View {
    var body: some View {
        NavigationView {
            Categories2()
                .navigationTitle("Categories")
        }
    }
}

// MARK: - Preview

struct Categories2_Previews: PreviewProvider {
    static var previews: some View {
        DSPreviewForEachAppearance { Testable_Categories2() }
    }
}

// MARK: - Image Links

fileprivate let personInWhite = URL(string: "https://images.pexels.com/photos/3622624/pexels-photo-3622624.jpeg?cs=srgb&dl=pexels-wesley-carvalho-3622624.jpg&fm=jpg")

fileprivate let personOnOrangeBg = URL(string: "https://images.pexels.com/photos/3641363/pexels-photo-3641363.jpeg?cs=srgb&dl=pexels-mikotoraw-3641363.jpg&fm=jpg")

fileprivate let blazers = URL(string: "https://images.pexels.com/photos/3555456/pexels-photo-3555456.jpeg?cs=srgb&dl=pexels-mikotoraw-3555456.jpg&fm=jpg")

fileprivate let pantsTrack = URL(string: "https://images.pexels.com/photos/5067705/pexels-photo-5067705.jpeg?cs=srgb&dl=pexels-anna-shvets-5067705.jpg&fm=jpg")

fileprivate let shirtsThreePairs = URL(string: "https://images.unsplash.com/photo-1602810318383-e386cc2a3ccf?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MXx8c2hpcnRzfGVufDB8fDB8&ixlib=rb-1.2.1&auto=format&fit=crop&w=900&q=60")

fileprivate let jeansOnBlackBg = URL(string: "https://images.pexels.com/photos/1598507/pexels-photo-1598507.jpeg?cs=srgb&dl=pexels-mnz-1598507.jpg&fm=jpg")

fileprivate let shoesThreePairs = URL(string: "https://images.pexels.com/photos/267301/pexels-photo-267301.jpeg?cs=srgb&dl=pexels-pixabay-267301.jpg&fm=jpg")

fileprivate let watchesOnYellowBg = URL(string: "https://images.pexels.com/photos/277390/pexels-photo-277390.jpeg?cs=srgb&dl=pexels-pixabay-277390.jpg&fm=jpg")
