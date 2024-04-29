//
//  DSDivider.swift
//  DSKitExplorer
//
//  Created by Ivan Borinschi on 04.03.2023.
//

import SwiftUI

/*
## DSDivider

 `DSDivider` is a simple, design-aware component within the DSKit framework that renders a visual separation line between UI elements. It conforms to the design system's aesthetics, adapting its appearance based on environmental settings.

#### Initialization:
The `DSDivider` is initialized without parameters, defaulting to predefined styling that respects the current theme and spacing conventions.

#### Usage:
`DSDivider` is used to visually separate content within a view, often between list items, sections in a form, or alongside layout changes.
*/

public struct DSDivider: View, DSDesignable {
    
    public init() {}
    
    @Environment(\.appearance) public var appearance: DSAppearance
    @Environment(\.viewStyle) public var viewStyle: DSViewStyle

    public var body: some View {
        Divider().background(viewColors.separator.color)
            .frame(minWidth: 1, minHeight: 1)
    }
}

struct Testable_DSDivider: View {
    var body: some View {
        DSDivider()
    }
}

struct DSDivider_Previews: PreviewProvider {
    static var previews: some View {
        DSPreviewForEachAppearance {
            DSPreview {
                Testable_DSDivider()
            }
        }
    }
}

