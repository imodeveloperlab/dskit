//
//  DSTermsAndConditions.swift
//  DSKitExplorer
//
//  Created by Ivan Borinschi on 04.03.2023.
//

import SwiftUI

/*
## DSTermsAndConditions

`DSTermsAndConditions` is a SwiftUI component within the DSKit framework designed to display terms and privacy policy information clearly and interactively. It typically includes a preamble message followed by links to the terms of service and privacy policy documents.

#### Initialization:
Initializes a `DSTermsAndConditions` with a specific message.
- Parameters:
- `message`: The text that precedes the links to terms and privacy policy.

#### Usage:
`DSTermsAndConditions` is ideal for registration screens, checkout processes, or any application section where legal agreements or policy acknowledgments are necessary.
*/

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

struct Testable_DSTermsAndConditions: View {
    var body: some View {
        DSTermsAndConditions(message: "By pressing confirm order, you agree to our")
    }
}

struct DSTermsAndConditions_Previews: PreviewProvider {
    static var previews: some View {
        DSPreviewForEachAppearance {
            DSPreview {
                Testable_DSTermsAndConditions()
            }
        }
    }
}
