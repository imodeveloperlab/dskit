//
//  DSChevronView.swift
//  DSKitExplorer
//
//  Created by Ivan Borinschi on 04.03.2023.
//

import SwiftUI

/*
## DSChevronView

`DSChevronView` is a simple, reusable view component within the DSKit framework designed to display a chevron icon. This component is typically used to indicate navigation or the ability to disclose more information, commonly found in list items or collapsible sections.

#### Initialization:
The `DSChevronView` is initialized without any parameters, defaulting to a predefined configuration:
- Initializes with a default system image named "chevron.right".

#### Usage:
`DSChevronView` is straightforward to use in various UI components where a visual indication for navigation or expansion is required.
*/

public struct DSChevronView: View {
    public init() { }
    public var body: some View {
        DSImageView(systemName: "chevron.right", size: .unspecified, tint: .viewStyle(.secondary, .text(.font(.headline))))
            .dsHeight(14)
            .opacity(0.5)
    }
}

struct Testable_DSChevronView: View {
    var body: some View {
        DSChevronView()
    }
}

struct ChevronView_Previews: PreviewProvider {
    static var previews: some View {
        DSPreviewForEachAppearance {
            DSPreview {
                Testable_DSChevronView()
            }
        }
    }
}
