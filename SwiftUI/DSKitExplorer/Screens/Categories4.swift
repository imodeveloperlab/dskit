//
//  Categories4.swift
//  DSKitCore
//
//  Created by Ivan Borinschi on 21.12.2022.
//

import SwiftUI
import DSKit

struct Categories4: View {
    
    @Environment(\.dismiss) var dismiss
    private let categories: [Category] = [
        Category(title: "Shorts", description: "2.5k items", image: personInWhite),
        Category(title: "Jackets", description: "20K items", image: personOnOrangeBg),
        Category(title: "Blazers", description: "915 items", image: blazers),
        Category(title: "Track Pants", description: "600 items", image: pantsTrack),
        Category(title: "Shirts", description: "1.4K items", image: shirtsThreePairs),
        Category(title: "Jeans", description: "345 items", image: jeansOnBlackBg),
        Category(title: "Shoes", description: "812 items", image: shoesThreePairs),
        Category(title: "Watches", description: "20K items", image: watchesOnYellowBg)
    ]
    
    var body: some View {
        ScrollView {
            DSGrid(data: categories, id: \.id) { category in
                CategoryView(category: category).onTap { dismiss() }
            }.dsPadding(.horizontal)
        }.dsBackground()
    }
}

fileprivate struct CategoryView: View {
        
    let category: Category
    
    var body: some View {
        DSVStack(alignment: .center, spacing: .zero) {
            DSImageView(url: category.image)
            DSVStack(alignment: .center, spacing: .extraSmall) {
                DSText(category.title, .smallTitle)
                DSText(category.description, .subheadline)
            }.dsPadding(.small)
        }
        .dsSecondaryBackground()
        .dsCornerRadius()
        .dsHeight(250)
    }
}

fileprivate struct Category: Identifiable {
    var id = UUID()
    let title: String
    let description: String
    let image: URL?
}

struct Categories4_Previews: PreviewProvider {
    static var previews: some View {
        PreviewForEach {
            NavigationView {
                Categories4()
                    .navigationTitle("Categories")
            }
        }
    }
}

fileprivate let personInWhite = URL(string: "https://images.pexels.com/photos/3622624/pexels-photo-3622624.jpeg?cs=srgb&dl=pexels-wesley-carvalho-3622624.jpg&fm=jpg")
fileprivate let personOnOrangeBg = URL(string: "https://images.pexels.com/photos/3641363/pexels-photo-3641363.jpeg?cs=srgb&dl=pexels-mikotoraw-3641363.jpg&fm=jpg")
fileprivate let blazers = URL(string: "https://images.pexels.com/photos/3555456/pexels-photo-3555456.jpeg?cs=srgb&dl=pexels-mikotoraw-3555456.jpg&fm=jpg")
fileprivate let pantsTrack = URL(string: "https://images.pexels.com/photos/5067705/pexels-photo-5067705.jpeg?cs=srgb&dl=pexels-anna-shvets-5067705.jpg&fm=jpg")
fileprivate let shirtsThreePairs = URL(string: "https://images.unsplash.com/photo-1602810318383-e386cc2a3ccf?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MXx8c2hpcnRzfGVufDB8fDB8&ixlib=rb-1.2.1&auto=format&fit=crop&w=900&q=60")
fileprivate let jeansOnBlackBg = URL(string: "https://images.pexels.com/photos/1598507/pexels-photo-1598507.jpeg?cs=srgb&dl=pexels-mnz-1598507.jpg&fm=jpg")
fileprivate let shoesThreePairs = URL(string: "https://images.pexels.com/photos/267301/pexels-photo-267301.jpeg?cs=srgb&dl=pexels-pixabay-267301.jpg&fm=jpg")
fileprivate let watchesOnYellowBg = URL(string: "https://images.pexels.com/photos/277390/pexels-photo-277390.jpeg?cs=srgb&dl=pexels-pixabay-277390.jpg&fm=jpg")
