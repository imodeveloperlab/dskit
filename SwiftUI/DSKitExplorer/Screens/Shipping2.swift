//
//  Shipping2.swift
//  DSKitCore
//
//  Created by Ivan Borinschi on 21.12.2022.
//

import SwiftUI
import DSKit

struct Shipping2: View {
    
    @Environment(\.dismiss) var dismiss
    @ObservedObject var viewModel = Shipping2Model()
    
    var body: some View {
        ScrollView {
            DSVStack {
                DSRadioPickerView(data: viewModel.shippingMethods, id: \.id, selected: $viewModel.selected) { method, _ in
                    ShippingMethodView(method: method)
                }
                section(with: "Order Info") {
                    OrderInfo(orderTotals: viewModel.orderTotals)
                }
            }
        }.safeAreaInset(edge: .bottom) {
            DSBottomContainer {
                DSHStack {
                    DSText("Next Step:", .smallTitle)
                    DSText("Order Info", .subheadlineWithSize(14))
                }
                DSButton(
                    title: "Continue",
                    rightSFSymbolName: "arrow.right",
                    pushContentToSides: true,
                    style: .default,
                    action: { }
                )
            }
        }.dsScreen()
    }
    
    func section<Content: View>(with title: String, @ViewBuilder content: @escaping () -> Content) -> some View {
        DSVStack(spacing: .smaller) {
            DSText(title, .smallTitle)
            content()
        }
        .dsPadding(.top)
    }
}

extension Shipping2 {
    
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
    
    // MARK: - Shipping Method
    
    struct ShippingMethodView: View {
        let method: Data
        var body: some View {
            DSText(method.title, .smallTitle)
            DSVStack(spacing: .smaller) {
                DSHStack(spacing: .smaller) {
                    DSImageView(sfSymbol: "calendar", size: 12, tint: .text(.subheadline))
                    DSText(method.description, .smallSubtitle)
                }
                if let price = method.price {
                    DSPriceView(amount: price, currency: "$", size: .medium)
                        .dsPadding(.top, .small)
                } else {
                    DSText("Free", .smallTitle, color: .customColor(.white))
                        .dsPadding(.vertical, .small)
                        .dsPadding(.horizontal)
                        .dsBackground(.customColor(.green))
                        .dsCornerRadius()
                        .dsPadding(.top, .small)
                }
            }
        }
        
        struct Data: Identifiable, Equatable {
            let id = UUID()
            let title: String
            let description: String
            var price: String? = nil
            var selected: Bool = false
        }
    }
}

// MARK: - View Model

final class Shipping2Model: ObservableObject {
    
    let orderTotals: [Shipping2.OrderInfo.Data] = [
        .init(title: "Subtotal", price: DSPrice(amount: "160.00", currency: "$")),
        .init(title: "Shipping", price: DSPrice(amount: "4.70", currency: "$")),
        .init(title: "Total", price: DSPrice(amount: "130.0", currency: "$"), bold: true),
    ]
    
    let shippingMethods: [Shipping2.ShippingMethodView.Data] = [
        .init(
            title: "Free Shipping",
            description: "1 month - Friday, 27 July 2020"
        ),
        .init(
            title: "Standard Shipping",
            description: "2 weeks - Tuesday, 10 July 2020",
            price: "4.70",
            selected: true
        ),
        .init(
            title: "Express Shipping",
            description: "3-4 days - Sunday, 1 July 2020 ",
            price: "30.00"
        )
    ]
    
    @Published var selected: Shipping2.ShippingMethodView.Data
    
    init() {
        self.selected = shippingMethods.first!
    }
}

// MARK: - Preview

struct Shipping2_Previews: PreviewProvider {
    static var previews: some View {
        PreviewForEach {
            NavigationView {
                Shipping2()
                    .navigationTitle("Shipping")
            }
        }
    }
}
