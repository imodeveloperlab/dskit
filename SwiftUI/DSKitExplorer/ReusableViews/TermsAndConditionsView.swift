//
//  TermsAndConditionsView.swift
//  DSKitExplorer
//
//  Created by Ivan Borinschi on 04.03.2023.
//

import DSKit
import SwiftUI

struct TermsAndConditionsView: View {
    let message: String
    var body: some View {
        DSVStack(spacing: .smaller) {
            DSText(message, .smallSubtitle).frame(maxWidth: .infinity, alignment: .center)
            DSHStack(spacing: .smaller) {
                DSText("Terms", .headlineWithSize(12)).onTap { }
                DSText("and", .smallSubtitle)
                DSText("Privacy", .headlineWithSize(12)).onTap { }
                DSText("policy", .smallSubtitle)
            }.frame(maxWidth: .infinity, alignment: .center)
        }
    }
}

struct TermsAndConditionsView_Previews: PreviewProvider {
    static var previews: some View {
        DSVStack {
            TermsAndConditionsView(
                message: "By pressing confirm order, you agree to our"
            )
        }.dsPadding()
    }
}
