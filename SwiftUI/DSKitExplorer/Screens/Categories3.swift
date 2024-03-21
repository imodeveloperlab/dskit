//
//  Categories3.swift
//  DSKitCore
//
//  Created by Ivan Borinschi on 21.12.2022.
//

import SwiftUI
import DSKit

struct Categories3: View {
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ScrollView {
            DSVStack {
                CategoryView(
                    title: "Shorts",
                    description: "2.5k items",
                    image: URL.personInWhite
                )
                CategoryView(
                    title: "Jackets",
                    description: "20K items",
                    image: URL.personOnOrangeBg
                )
                CategoryView(
                    title: "Blazers",
                    description: "915 items",
                    image: URL.blazers
                )
                CategoryView(
                    title: "Track Pants",
                    description: "600 items",
                    image: URL.pantsTrack
                )
                CategoryView(
                    title: "Shirts",
                    description: "1.4K items",
                    image: URL.shirtsThreePairs
                )
                CategoryView(
                    title: "Jeans",
                    description: "345 items",
                    image: URL.jeansOnBlackBg
                )
                CategoryView(
                    title: "Shoes",
                    description: "812 items",
                    image: URL.shoesThreePairs
                )
                CategoryView(
                    title: "Watches",
                    description: "20K items",
                    image: URL.watchesOnYellowBg
                )
            }.dsPadding(.horizontal)
        }
        .dsBackground()
    }
}

fileprivate struct CategoryView: View {
        
    let title: String
    let description: String
    let image: URL?
    
    var body: some View {
        ZStack(alignment: .center) {
            ZStack {
                DSImageView(url: image)
                LinearGradient(gradient: Gradient(colors: [Color.black.opacity(0), Color.black.opacity(0.4), Color.black.opacity(0)]),
                               startPoint: .top,
                               endPoint: .bottom)
            }
            DSVStack(alignment: .center, spacing: .extraSmall) {
                DSText(title, .headlineWithSize(25), color: .customColor(.white))
                DSText(description, .subheadline, color: .customColor(.white.opacity(0.8)))
            }
        }
        .dsSecondaryBackground()
        .dsCornerRadius()
        .dsHeight(200)
        .onTap { }
    }
}

struct Categories3_Previews: PreviewProvider {
    static var previews: some View {
        PreviewForEach {
            NavigationView {
                Categories3()
                    .navigationTitle("Categories")
            }
        }
    }
}

