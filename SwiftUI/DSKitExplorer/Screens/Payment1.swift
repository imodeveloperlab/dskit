//
//  Payment1.swift
//  DSKit
//
//  Created by Ivan Borinschi on 21.12.2022.
//

import SwiftUI
import DSKit

struct Payment1: View {
    
    @Environment(\.dismiss) var dismiss
    @ObservedObject var viewModel = Payment1Model()
    
    var body: some View {
        ScrollView {
            DSVStack {
                DSRadioPickerView(
                    data: viewModel.paymentMethods,
                    id: \.id,
                    selected: $viewModel.selected
                ) { method, _ in
                    PaymentMethod(method: method)
                }
                
                DSButton(
                    title: "Add new credit card",
                    rightSystemName: "plus.circle",
                    style: .light,
                    action: { dismiss() }
                )
            }
        }.safeAreaInset(edge: .bottom) {
            DSBottomContainer {
                DSHStack {
                    DSText("Next Step:").dsTextStyle(.smallHeadline)
                    DSText("Shipping address")
                        .dsTextStyle(.subheadline, 14)
                }
                DSButton(
                    title: "Continue",
                    rightSystemName: "arrow.right",
                    pushContentToSides: true,
                    style: .default,
                    action: { }
                )
            }
        }.dsScreen()
    }
}

extension Payment1 {
    
    // MARK: - Payment Method
    
    struct PaymentMethod: View {
        let method: Data
        var body: some View {
            DSVStack(spacing: .small) {
                DSHStack(spacing: .medium) {
                    DSImageView(
                        named: method.type.replacingOccurrences(of: " ", with: ""),
                        size: .size(width: 50, height: 30)
                    ).dsCornerRadius()
                    DSVStack(spacing: .zero) {
                        DSText("\(method.type) **** \(method.end)").dsTextStyle(.smallHeadline)
                        DSText("\(method.holder) \(method.expire)").dsTextStyle(.smallSubtitle)
                    }
                }.frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
            }
        }
        
        struct Data: Identifiable, Equatable {
            let id = UUID()
            let holder: String
            let type: String
            let expire: String
            let end: String
            var selected: Bool = false
        }
    }
}

// MARK: - View Model

final class Payment1Model: ObservableObject {
    
    let paymentMethods: [Payment1.PaymentMethod.Data] = [
        .init(
            holder: "John Doe",
            type: "Visa",
            expire: "04/23",
            end: "5110"
        ),
        .init(
            holder: "Jane Doe",
            type: "American Express",
            expire: "04/23",
            end: "324",
            selected: true
        ),
        .init(
            holder: "John Doe",
            type: "Master Card",
            expire: "04/23",
            end: "1246"
        ),
        .init(
            holder: "Jane Doe",
            type: "Visa",
            expire: "04/23",
            end: "3481"
        )
    ]
    
    @Published var selected: Payment1.PaymentMethod.Data
    
    init() {
        self.selected = paymentMethods.first!
    }
}

// MARK: - Testable

struct Testable_Payment1: View {
    var body: some View {
        NavigationView {
            Payment1()
                .navigationTitle("Payment")
        }
    }
}

// MARK: - Preview

struct Payment1_Previews: PreviewProvider {
    static var previews: some View {
        DSPreviewForEachAppearance { Testable_Payment1() }
    }
}
