//
//  ToolbarButtonView.swift
//  DSKitExplorer
//
//  Created by Ivan Borinschi on 13.03.2023.
//

import SwiftUI

/*
## DSToolbarSFSymbolButton

`DSToolbarSFSymbolButton` is a SwiftUI component within the DSKit framework designed specifically for toolbars. It utilizes SF Symbols to provide a standard and visually consistent icon-based button, suitable for use in navigation bars, toolbars, or any interface requiring icon buttons.

#### Initialization:
Initializes a `DSToolbarSFSymbolButton` with the SF Symbol name.
- Parameters:
- `name`: The SF Symbol name to use for the button icon, reflecting the button's function or action.

#### Usage:
`DSToolbarSFSymbolButton` is ideal for applications requiring accessible, touch-friendly icon buttons in a toolbar. This component is particularly effective in contexts where space is limited, and icons convey actions more efficiently than text.
*/

public struct DSToolbarSFSymbolButton: View, DSDesignable {
    
    @Environment(\.appearance) public var appearance: DSAppearance
    @Environment(\.viewStyle) public var viewStyle: DSViewStyle
    
    let name: String
    
    public init(name: String) {
        self.name = name
    }
    
    public var body: some View {
        DSImageView(
            systemName: name,
            size: .mediumIcon,
            tint: .navBar(.button)
        )
    }
}

struct Testable_DSToolbarSFSymbolButton: View {
    var body: some View {
        DSToolbarSFSymbolButton(name: "shippingbox")
    }
}

struct DSToolbarSFSymbolButton_Previews: PreviewProvider {
    static var previews: some View {
        DSPreviewForEachAppearance {
            DSPreview {
                Testable_DSToolbarSFSymbolButton()
            }
        }
    }
}

