//
//  DSRatingView.swift
//  DSKitExplorer
//
//  Created by Ivan Borinschi on 29.02.2023.
//

import SwiftUI

public struct DSRatingView: View {
    
    let rating: Float
    let maximumRating = 5
    let size: CGFloat
    let fullStarSymbol = "star.fill"
    let halfStarSymbol = "star.leadinghalf.fill"
    let emptyStarSymbol = "star"
    
    public init(rating: Float, size: CGFloat = 14) {
        self.rating = rating
        self.size = size
    }
    
    public var body: some View {
        HStack(spacing: 3) {
            ForEach(1...maximumRating, id: \.self) { index in
                Image(systemName: symbolName(for: index))
                    .resizable()
                    .scaledToFit()
                    .frame(width: size, height: size)
                    .foregroundColor(index <= Int(rating) ? Color.yellow : Color.gray)
            }
        }
    }
    
    private func symbolName(for index: Int) -> String {
        if Float(index) <= rating {
            return fullStarSymbol
        } else if Float(index) - 0.5 == rating {
            return halfStarSymbol
        } else {
            return emptyStarSymbol
        }
    }
}

struct RatingView_Previews: PreviewProvider {
    static var previews: some View {
        DSVStack {
            DSRatingView(rating: 1)
            DSRatingView(rating: 2, size: 20)
            DSRatingView(rating: 3, size: 30)
            DSRatingView(rating: 4.5, size: 40)
            DSRatingView(rating: 5, size: 50)
        }
    }
}
