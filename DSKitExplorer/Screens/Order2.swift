//
//  Order2.swift
//  DSKit
//
//  Created by Ivan Borinschi on 21.12.2022.
//

import SwiftUI
import DSKit

struct Order2: View {
    
    @Environment(\.dismiss) var dismiss
    
    let viewModel = Order2Model()
    
    var body: some View {
        ScrollView {
            DSVStack {
                
                DSGrid(spacing: .regular, data: viewModel.checkoutInfo, id: \.id) { card in
                    CardView(card: card).onTap {}
                }
                
                DSVStack {
                    DSGroupedList(data: viewModel.promoCodes, id: \.id) { code in
                        PromoCodeView(code: code)
                    }
                    
                    DSButton(
                        title: "Add Promo Code",
                        rightSystemName: "tag.fill",
                        style: .light
                    ) {}
                }.dsSectionStyle(title: "Promo Codes")
                
                OrderInfo(orderTotals: viewModel.orderTotals)
                    .dsSectionStyle(title: "Order Info")
            }
            
        }.safeAreaInset(edge: .bottom) {
            DSBottomContainer {
                DSButton(
                    title: "Confirm Order",
                    rightSystemName: "checkmark.circle.fill"
                ) {
                    dismiss()
                }
                DSTermsAndConditions(message: "By pressing confirm order, you agree to our")
            }
        }.dsScreen()
    }
    
    func section<Content: View>(with title: String, @ViewBuilder content: @escaping () -> Content) -> some View {
        DSVStack(spacing: .small) {
            DSText(title).dsTextStyle(.smallHeadline)
            content()
        }
        .dsPadding(.horizontal)
        .dsPadding(.top)
    }
}

extension Order2 {
    
    // MARK: - Card
    
    struct CardView: View, DSDesignable {
        
        @Environment(\.appearance) var appearance: DSAppearance
        @Environment(\.viewStyle) var viewStyle: DSViewStyle
        
        let card: Data
        var body: some View {
            DSVStack(alignment: .center) {
                DSImageView(systemName: card.icon, size: 28, tint: .view(.button(.accentColor)))
                DSVStack(alignment: .center) {
                    DSText(card.title)
                        .dsTextStyle(.headline, .view(.button(.accentColor)))
                    DSVStack(alignment: .center, spacing: .small) {
                        DSText(card.subtitle).dsTextStyle(.smallSubtitle)
                        DSText(card.description).dsTextStyle(.smallSubtitle)
                    }
                }.frame(maxWidth: .infinity, alignment: .center)
            }
            .dsPadding()
            .dsHeight(160)
            .dsSecondaryBackground()
            .dsCornerRadius()
        }
        
        struct Data: Identifiable {
            var id = UUID()
            let icon: String
            let title: String
            let subtitle: String
            let description: String
        }
    }
    
    // MARK: - Order Info
    
    struct OrderInfo: View {
        let orderTotals: [Data]
        var body: some View {
            DSGroupedList(data: orderTotals, id: \.id) { total in
                DSHStack {
                    DSText(total.title)
                        .dsTextStyle(total.bold ? .smallHeadline : .smallSubtitle)
                    Spacer()
                    DSPriceView(price: total.price, size: total.bold ? .smallHeadline : .smallSubtitle)
                }.dsHeight(25)
            }
        }
        
        struct Data: Identifiable {
            let id = UUID()
            let title: String
            let price: DSPrice
            var bold: Bool = false
        }
    }
    
    // MARK: - Promo Code
    
    struct PromoCodeView: View {
        
        @Environment(\.appearance) var appearance: DSAppearance
        let code: Data
        
        var body: some View {
            DSHStack {
                DSText(code.title).dsTextStyle(.smallHeadline)
                Spacer()
                DSPriceView(price: code.price, size: .smallHeadline)
                DSSFSymbolButton(name: "minus.circle.fill", size: .mediumIcon)
                    .dsPadding(.leading, .regular)
            }.dsHeight(25)
        }
        
        struct Data: Identifiable {
            let id = UUID()
            let title: String
            let price: DSPrice
        }
    }
}

// MARK: - View Model

final class Order2Model {

    let checkoutInfo: [Order2.CardView.Data] = [
        .init(icon: "cart.fill", title: "My Cart", subtitle: "3 items", description: "$167.00"),
        .init(icon: "mappin.circle.fill", title: "Address", subtitle: "4863 West Virginia", description: "New York, US"),
        .init(icon: "shippingbox.fill", title: "Shipping", subtitle: "Standard Shipping", description: "2 weeks for $0"),
        .init(icon: "creditcard.fill", title: "Payment", subtitle: "MasterCard", description: "**** 8314")
    ]
    
    let orderTotals: [Order2.OrderInfo.Data] = [
        .init(title: "Subtotal", price: DSPrice(amount: "160.00", currency: "$")),
        .init(title: "Shipping", price: DSPrice(amount: "4.70", currency: "$")),
        .init(title: "30OFFCODE", price: DSPrice(amount: "134.70", regularAmount: "164.70", currency: "$")),
        .init(title: "FREEDELIVERY", price: DSPrice(amount: "130.00", regularAmount: "134.70", currency: "$")),
        .init(title: "Total", price: DSPrice(amount: "130.0", currency: "$"), bold: true),
    ]
    
    let promoCodes: [Order2.PromoCodeView.Data] = [
        .init(title: "30OFFCODE", price: DSPrice(amount: "134.70", regularAmount: "164.70", currency: "$")),
        .init(title: "FREEDELIVERY", price: DSPrice(amount: "130.00", regularAmount: "134.70", currency: "$"))
    ]
}

// MARK: - Testable

struct Testable_Order2: View {
    var body: some View {
        NavigationView {
            Order2()
                .navigationTitle("Order")
        }
    }
}

// MARK: - Preview

struct Order2_Previews: PreviewProvider {
    static var previews: some View {
        DSPreviewForEachAppearance { Testable_Order2() }
    }
}
