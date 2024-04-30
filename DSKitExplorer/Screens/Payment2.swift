//
//  Payment2.swift
//  DSKit
//
//  Created by Ivan Borinschi on 21.12.2022.
//

import SwiftUI
import DSKit

struct Payment2: View {
    
    @Environment(\.dismiss) var dismiss
    let viewModel = Payment2Model()
    
    var body: some View {
        ScrollView {
            DSVStack {
                ForEach(viewModel.creditCards) { card in
                    CreditCard(card: card)
                }
            }
        }.safeAreaInset(edge: .bottom) {
            DSBottomContainer {
                DSButton(
                    title: "Add new credit card",
                    rightSystemName: "plus.circle",
                    action: { dismiss() }
                )
            }
        }.dsScreen()
    }
}

extension Payment2 {
    
    // MARK: - Credit Card
    
    struct CreditCard: View {
        let card: Data
        var body: some View {
            Group {
                DSImageView(named: card.background, size: .unspecified)
                    .dsHeight(200)
                    .overlay(alignment: .bottomTrailing) {
                        DSImageView(
                            named: card.type.replacingOccurrences(of: " ", with: ""),
                            size: .size(width: 50, height: 35)
                        )
                        .dsCornerRadius()
                        .dsPadding()
                    }
                    .overlay(alignment: .topLeading) {
                        DSVStack(spacing: .small) {
                            DSText(card.holder).dsTextStyle(.title2, .white)
                            DSText("\(card.type) **** \(card.end)").dsTextStyle(.headline, .white).opacity(0.9)
                            DSText(card.expire)
                                .dsTextStyle(.subheadline, .white)
                                .opacity(0.5)
                        }.dsPadding()
                    }
            }
            .dsCornerRadius()
            .onTap { }
        }
        
        struct Data: Identifiable {
            let id = UUID()
            let holder: String
            let type: String
            let expire: String
            let end: String
            let background: String
            var selected: Bool = false
        }
    }
}

// MARK: - View Model

final class Payment2Model {
    let creditCards: [Payment2.CreditCard.Data] = [
        .init(
            holder: "John Doe",
            type: "Visa",
            expire: "04/23",
            end: "5110",
            background: "CardBackground_4"
        ),
        .init(
            holder: "Jane Doe",
            type: "Master Card",
            expire: "04/23",
            end: "324",
            background: "CardBackground_3"
        )
    ]
}

// MARK: - Testable

struct Testable_Payment2: View {
    var body: some View {
        NavigationView {
            Payment2()
                .navigationTitle("My Cards")
        }
    }
}

// MARK: - Preview

struct Payment2_Previews: PreviewProvider {
    static var previews: some View {
        DSPreviewForEachAppearance { Testable_Payment2() }
    }
}
