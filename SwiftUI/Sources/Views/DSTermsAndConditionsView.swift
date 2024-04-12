//
//  DSTermsAndConditions.swift
//  DSKitExplorer
//
//  Created by Ivan Borinschi on 04.03.2023.
//

import SwiftUI

public struct DSTermsAndConditions: View {
    
    let message: String
    
    public  init(message: String) {
        self.message = message
    }
    
    public var body: some View {
        DSVStack(spacing: .small) {
            DSText(message)
                .dsTextStyle(.smallSubtitle)
                .frame(maxWidth: .infinity, alignment: .center)
            DSHStack(spacing: .small) {
                DSText("Terms")
                    .dsTextStyle(.headline, 12)
                    .onTap { }
                DSText("and").dsTextStyle(.smallSubtitle)
                DSText("Privacy")
                    .dsTextStyle(.headline, 12)
                    .onTap { }
                DSText("policy").dsTextStyle(.smallSubtitle)
            }.frame(maxWidth: .infinity, alignment: .center)
        }
    }
}

struct TermsAndConditionsView_Previews: PreviewProvider {
    static var previews: some View {
        DSVStack {
            DSTermsAndConditions(
                message: "By pressing confirm order, you agree to our"
            )
        }.dsPadding()
    }
}
