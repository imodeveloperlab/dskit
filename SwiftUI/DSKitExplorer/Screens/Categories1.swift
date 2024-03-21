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
        
    var body: some View {
        ScrollView {
            DSVStack {
                DSVStack {
                    CategoryView(
                        title: "Shoes",
                        description: "812 items",
                        image: URL.purpleShoes
                    )
                     CategoryView(
                         title: "Shirts",
                         description: "1.4K items"
                     )
                     CategoryView(
                         title: "Jeans",
                         description: "345 items",
                         image: URL.jeansPairs
                     )
                     CategoryView(
                         title: "Watches",
                         description: "20K items",
                         image: URL.watchesOnYellowBg
                     )
                     CategoryView(
                         title: "Shorts",
                         description: "2.5k items"
                     )
                    CategoryView(
                        title: "Track Pants",
                        description: "600 items",
                        image: URL.pantsTrack
                    )
                    CategoryView(
                        title: "Jackets",
                        description: "20K items"
                    )
                    CategoryView(
                        title: "Blazers",
                        description: "915 items",
                        image: URL.blazers
                    )
                    CategoryView(
                        title: "Socks",
                        description: "75.1K items"
                    )
                }
            }.dsPadding(.horizontal)
        }
        .dsBackground()
    }
}

fileprivate struct CategoryView: View {
    
    @Environment(\.appearance) var appearance: DSAppearance
    
    let title: String
    let description: String
    var image: URL? = nil
    
    var body: some View {
        DSHStack(spacing: .regular) {
            if image != nil {
                DSImageView(url: image,  size: .size(width: 60, height: 60))
                    .dsCornerRadius()
                    .dsPadding(.leading, .small)
                    .dsPadding(.top, .small)
                    .dsPadding(.bottom, .small)
            }
            
            DSVStack {
                DSVStack(spacing: .extraSmall) {
                    DSText(title, .smallTitle)
                    DSText(description, .smallSubtitle)
                }
            }
            .dsPadding(image != nil ? .zero : .regular)
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .overlay(alignment: .trailing) {
            ChevronView()
                .dsPadding()
        }
        .dsSecondaryBackground()
        .dsCornerRadius()
        .onTap { }
    }
}

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

