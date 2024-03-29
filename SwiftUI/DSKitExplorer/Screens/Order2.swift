//
//  Order2.swift
//  DSKitCore
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
                
                DSGrid(spacing: .small, data: viewModel.checkoutInfo, id: \.id) { card in
                    CardView(card: card).onTap {}
                }
                
                DSVStack {
                    DSGroupedList(data: viewModel.promoCodes, id: \.id) { code in
                        PromoCodeView(code: code)
                    }
                    
                    DSButton(
                        title: "Add Promo Code",
                        rightImage: DSImage(sfSymbolName: "tag.fill", size: .regular),
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
                    rightImage: DSImage(sfSymbolName: "checkmark.circle.fill", size: .medium)
                ) {
                    dismiss()
                }
                DSTermsAndConditions(message: "By pressing confirm order, you agree to our")
            }
        }.dsScreen()
    }
    
    func section<Content: View>(with title: String, @ViewBuilder content: @escaping () -> Content) -> some View {
        DSVStack(spacing: .smaller) {
            DSText(title, .smallTitle)
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
        @Environment(\.colorGroup) var colorGroup: DSColorGroup
        
        let card: Data
        var body: some View {
            DSVStack(alignment: .center) {
                DSImageView(sfSymbol: card.icon, size: 28, tint: .custom(viewColors.button.background))
                DSVStack(alignment: .center) {
                    DSText(card.title, .text(font: .headline, color: .custom(viewColors.button.background)))
                    DSVStack(alignment: .center, spacing: .smaller) {
                        DSText(card.subtitle, .smallSubtitle)
                        DSText(card.description, .smallSubtitle)
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
                    DSText(total.title, total.bold ? .smallTitle : .smallSubtitle)
                    Spacer()
                    DSPriceView(price: total.price, size: total.bold ? .medium : .regular)
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
                DSText(code.title, .smallTitle)
                Spacer()
                DSPriceView(price: code.price)
                DSSFSymbolButton(name: "minus.circle", size: .mediumIcon)
                    .dsPadding(.leading, .small)
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
        .init(icon: "cart.fill", title: "Cart", subtitle: "3 items", description: "$167.00"),
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
                .navigationTitle("Order details")
        }
    }
}

// MARK: - Preview

struct Order2_Previews: PreviewProvider {
    static var previews: some View {
        PreviewForEach { Testable_Order2() }
    }
}
