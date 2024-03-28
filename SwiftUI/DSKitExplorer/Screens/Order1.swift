//
//  Order1.swift
//  DSKitCore
//
//  Created by Ivan Borinschi on 21.12.2022.
//

import SwiftUI
import DSKit

struct Order1: View {
    
    @Environment(\.dismiss) var dismiss
    @ObservedObject var viewModel = Order1Model()
    
    var body: some View {
        ScrollView {
            DSVStack {
                
                DSVStack(spacing: .small) {
                    DSList(data: viewModel.products, id: \.id) { product in
                        ProductView(product: product)
                    }
                    DSButton(
                        title: "Search for more products",
                        rightSFSymbolName: "magnifyingglass",
                        style: .light
                    ) {}
                }
                
                DSVStack {
                    DeliveryAddress(address: viewModel.address)
                    DSDivider()
                    ShippingMethod(shipping: viewModel.shipping)
                }
                .dsCardStyle()
                .dsSectionStyle(title: "Delivery")
                
                PaymentMethod(method: viewModel.paymentMethod)
                    .dsSectionStyle(title: "Payment")
                
                OrderInfo(orderTotals: viewModel.orderTotals)
                    .dsSectionStyle(title: "Order Info")
            }
        }
        .safeAreaInset(edge: .bottom) {
            BottomContainerView {
                DSButton(
                    title: "Confirm Order",
                    rightImage: DSImage(sfSymbolName: "checkmark.circle.fill", size: .medium)
                ) {
                    dismiss()
                }
                TermsAndConditionsView(message: "By pressing confirm order, you agree to our")
            }
        }.dsScreen()
    }
}

extension Order1 {
    
    // MARK: - Order Info
    
    struct OrderInfo: View {
        let orderTotals: [Data]
        var body: some View {
            DSList(data: orderTotals, id: \.id) { total in
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
    
    // MARK: - Payment Method
    
    struct PaymentMethod: View {
            
        let method: Data
        
        var body: some View {
            DSHStack(spacing: .regular) {
                DSImageView(uiImageName: method.icon, size: .size(width: 50, height: 30))
                    .dsCornerRadius()
                DSVStack(spacing: .zero) {
                    DSText(method.title, .smallTitle)
                    DSText(method.subtitle, .smallSubtitle)
                }
            }
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
            .overlay(alignment: .trailing, content: {
                DSButton.sfSymbol(name: "pencil.circle", style: .clear, size: .mediumIcon, action: {})
            }).dsCardStyle()
        }
        
        struct Data {
            let title: String
            let subtitle: String
            let icon: String
        }
    }
    
    // MARK: - Delivery Address
    
    struct DeliveryAddress: View {
            
        let address: Data
        
        var body: some View {
            DSVStack(alignment: .leading) {
                DSText(address.holder, .smallTitle)
                DSVStack(spacing: .smaller) {
                    DSHStack {
                        DSImageView(sfSymbol: "house", size: 12, tint: .text(.subheadline))
                        DSText(address.address, .smallSubtitle)
                    }
                    DSHStack {
                        DSImageView(sfSymbol: "phone", size: 12, tint: .text(.subheadline))
                        DSText(address.phone, .smallSubtitle)
                    }
                }
            }
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
            .overlay(alignment: .trailing, content: {
                DSButton.sfSymbol(name: "pencil.circle", style: .clear, size: .mediumIcon, action: {})
            })
        }
        
        struct Data {
            let holder: String
            let address: String
            let phone: String
        }
    }
    
    // MARK: - Shipping Method
    
    struct ShippingMethod: View {
        
        @Environment(\.appearance) var appearance: DSAppearance
        
        let shipping: Data
        
        var body: some View {
            DSVStack(alignment: .leading) {
                DSText(shipping.method, .smallTitle)
                DSVStack(spacing: .smaller) {
                    DSHStack {
                        DSImageView(sfSymbol: "calendar", size: 12, tint: .text(.subheadline))
                        DSText(shipping.date, .smallSubtitle)
                    }
                    DSPriceView(price: shipping.price)
                }
            }
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
            .overlay(alignment: .trailing, content: {
                DSButton.sfSymbol(name: "pencil.circle", style: .clear, size: .mediumIcon, action: {})
            })
            .onTap { }
        }
        
        struct Data {
            let method: String
            let date: String
            let price: DSPrice
        }
    }
    
    // MARK: - Product View
    
    struct ProductView: View {
        
        let product: Data
        
        var body: some View {
            DSHStack(alignment: .center, spacing: .regular) {
                DSImageView(url: product.image, size: .size(width: 50, height: 60))
                    .dsCornerRadius()
                
                DSVStack(alignment: .leading, spacing: .smaller) {
                    DSText(product.title, .smallTitle)
                    DSText(product.subtitle, .smallSubtitle)
                    DSPriceView(price: product.price, size: .regular)
                }.frame(maxWidth: .infinity, alignment: .leading)
            }
            .onTap { }
        }
        
        struct Data: Identifiable {
            let id = UUID()
            let title: String
            let subtitle: String
            let price: DSPrice
            let image: URL?
        }
    }
}

// MARK: - View Model

final class Order1Model: ObservableObject {
    
    let products: [Order1.ProductView.Data] = [
        .init(
            title: "The Iconic Mesh Polo Shirt - All Fits",
            subtitle: "Polo Ralph Lauren",
            price: DSPrice(amount: "250", regularAmount: "270", currency: "$", discountBadge: "-20$"),
            image: p1Image
        ),
        .init(
            title: "Polo Team Mesh Polo Shirt",
            subtitle: "House & Versace",
            price: DSPrice(amount: "99", currency: "$"),
            image: p6Image
        ),
        .init(
            title: "Polo Team Mesh Polo Shirt",
            subtitle: "House & Versace",
            price: DSPrice(amount: "500", regularAmount: "600", currency: "$", discountBadge: "-100$"),
            image: p7Image
        )
    ]
    
    let address: Order1.DeliveryAddress.Data = .init(
        holder: "John Doe",
        address: "201 Torphy Ports, New York",
        phone: "+1(513)516-5999"
    )
    
    let shipping: Order1.ShippingMethod.Data = .init(
        method: "Standart Shipping",
        date: "2 weeks - Tuesday, 10 July 2020",
        price: DSPrice(amount: "4.70", currency: "$")
    )
    
    let paymentMethod: Order1.PaymentMethod.Data = .init(
        title: "Visa **** 5110",
        subtitle: "John Doe",
        icon: "Visa"
    )
    
    let orderTotals: [Order1.OrderInfo.Data] = [
        .init(title: "Subtotal", price: DSPrice(amount: "160.00", currency: "$")),
        .init(title: "Shipping", price: DSPrice(amount: "4.70", currency: "$")),
        .init(title: "Total", price: DSPrice(amount: "164.70", currency: "$"), bold: true),
    ]
}

// MARK: - Preview

struct Order1_Previews: PreviewProvider {
    static var previews: some View {
        PreviewForEach {
            NavigationView {
                Order1()
                    .navigationTitle("Order details")
            }
        }
    }
}

// MARK: - Image Links

fileprivate let p1Image = URL(string: "https://images.pexels.com/photos/4969888/pexels-photo-4969888.jpeg?cs=srgb&dl=pexels-maria-orlova-4969888.jpg&fm=jpg")
fileprivate let p6Image = URL(string: "https://images.pexels.com/photos/5372767/pexels-photo-5372767.jpeg?cs=srgb&dl=pexels-johanser-martinez-5372767.jpg&fm=jpg")
fileprivate let p7Image = URL(string: "https://images.pexels.com/photos/5303044/pexels-photo-5303044.jpeg?cs=srgb&dl=pexels-elijah-o%27donnell-5303044.jpg&fm=jpg")
