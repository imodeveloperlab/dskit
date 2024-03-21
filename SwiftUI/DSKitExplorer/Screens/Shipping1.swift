//
//  Shipping1.swift
//  DSKitCore
//
//  Created by Ivan Borinschi on 21.12.2022.
//

import SwiftUI
import DSKit

struct Shipping1: View {
    
    @Environment(\.dismiss) var dismiss
    @ObservedObject var viewModel = Shipping1Model()
    
    var body: some View {
        ScrollView {
            DSVStack {
                RadioPickerView(data: viewModel.deliveryAddresses, id: \.id, selected: $viewModel.selected) { address in
                    DeliveryAddressView(address: address)
                }
                DSButton(
                    title: "Add new address",
                    rightSFSymbolName: "plus.circle",
                    style: .light, action: { dismiss() }
                )
            }.dsPadding(.horizontal)
            
        }.safeAreaInset(edge: .bottom) {
            DSVStack {
                DSHStack {
                    DSText("Next Step:", .smallTitle)
                    DSText("Checkout", .subheadlineWithSize(14))
                }
                DSButton(
                    title: "Continue",
                    rightSFSymbolName: "arrow.right",
                    pushContentToSides: true,
                    style: .default,
                    action: { }
                )
            }.dsPadding()
        }.dsBackground()
    }
}

extension Shipping1 {
    
    // MARK: - Delivery Address
    
    struct DeliveryAddressView: View {
        let address: Data
        var body: some View {
            DSVStack(spacing: .smaller) {
                DSText(address.address, .smallTitle)
                DSHStack(spacing: .smaller) {
                    DSImageView(sfSymbol: "phone", size: 12, tint: .text(.subheadline))
                    DSText(address.phone, .smallSubtitle)
                }
            }
        }
        
        struct Data: Identifiable, Equatable {
            let id = UUID()
            let holder: String
            let address: String
            let phone: String
            var selected: Bool = false
        }
    }
}

// MARK: - View Model

final class Shipping1Model: ObservableObject {
    
    let deliveryAddresses: [Shipping1.DeliveryAddressView.Data] = [
        .init(
            holder: "John Doe",
            address: "201 Torphy Ports, New York",
            phone: "+1(513)516-5999"
        ),
        .init(
            holder: "Albert Deep",
            address: "201 Avenue 32, New York",
            phone: "+1(513)636-5999",
            selected: true
        ),
        .init(
            holder: "John Doe",
            address: "Madison, Park and Lexington",
            phone: "+1(513)616-5699"
        ),
        .init(
            holder: "Borinschi Ivan",
            address: "201 Torphy Park, New York",
            phone: "+1(513)616-5699"
        )
    ]
    
    @Published var selected: Shipping1.DeliveryAddressView.Data
    
    init() {
        self.selected = deliveryAddresses.first!
    }
}


// MARK: - Preview

struct Shipping1_Previews: PreviewProvider {
    static var previews: some View {
        PreviewForEach {
            NavigationView {
                Shipping1()
                    .navigationTitle("Shipping")
            }
        }
    }
}
