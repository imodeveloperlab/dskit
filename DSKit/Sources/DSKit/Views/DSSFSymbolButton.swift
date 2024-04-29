//
//  DSSFSymbolButton.swift
//  DSKitExplorer
//
//  Created by Ivan Borinschi on 13.03.2023.
//

import SwiftUI

/*
## DSSFSymbolButton

`DSSFSymbolButton` is a SwiftUI component within the DSKit framework designed to create a button with a system symbol icon. This view leverages SwiftUI's SF Symbols to provide a versatile and scalable button that can be used across various parts of an application, ensuring consistency with the design system.

#### Initialization:
Initializes a `DSSFSymbolButton` with a symbol name and size.
- Parameters:
- `name`: The SF Symbol name to use for the button icon.
- `size`: The size of the icon, affecting both the icon's scale and the overall button size.

#### Usage:
`DSSFSymbolButton` is suitable for a wide range of applications where icons are preferred over text for button labels, such as toolbars, navigation bars, or any user interface element requiring concise visual cues.
*/

public struct DSSFSymbolButton: View, DSDesignable {
    
    @Environment(\.appearance) public var appearance: DSAppearance
    @Environment(\.viewStyle) public var viewStyle: DSViewStyle
    
    let name: String
    let size: DSSize
    
    public init(name: String, size: DSSize) {
        self.name = name
        self.size = size
    }
    
    public var body: some View {
        DSImageView(
            systemName: name,
            size: size,
            tint: .view(.button(.accentColor))
        )
    }
}

struct Testable_DSSFSymbolButton: View {
    var body: some View {
        DSSFSymbolButton(name: "square.stack.3d.down.right", size: 60)
    }
}

struct DSSFSymbolButton_Previews: PreviewProvider {
    static var previews: some View {
        DSPreviewForEachAppearance {
            DSPreview {
                Testable_DSSFSymbolButton()
            }
        }
    }
}
