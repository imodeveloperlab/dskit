//
//  DSBottomContainer.swift
//  DSKitExplorer
//
//  Created by Ivan Borinschi on 13.03.2023.
//

import SwiftUI

/*
## DSBottomContainer

`DSBottomContainer` is component designed to display content at the bottom of the screen, commonly used for adding buttons or contextual information to forms and dialogs. It enhances the display by adding a top shadow and managing spacing, ensuring that the content is both visually appealing and functionally positioned.

#### Initializer:
Initializes a `DSBottomContainer` with a view builder closure that defines its content.
- Parameters:
- `content`: A closure returning the content of the container. This closure is marked with `@ViewBuilder` to allow for multiple views to be composed together.

#### Usage:
`DSBottomContainer` is typically used to anchor controls or information at the bottom of the interface, adding visual structure and focus to bottom-placed elements.
*/

public struct DSBottomContainer<Content: View>: View {
    let content: () -> Content
    public init(
        @ViewBuilder content: @escaping () -> Content
    ) {
        self.content = content
    }
    
    public var body: some View {
        DSVStack{
            content()
        }
        .topShadow(padding: .medium)
        .dsBackground(.primary)
    }
}

struct Testable_DSBottomContainer: View {
    var body: some View {
        DSVStack {
            DSText("Are you sure?")
        }
        .safeAreaInset(edge: .bottom) {
            DSBottomContainer {
                DSText("Save your changes")
                DSButton(title: "Submit", action: {})
            }.dsScreen()
        }
        .dsScreen()
    }
}

struct DSBottomContainer_Previews: PreviewProvider {
    static var previews: some View {
        DSPreviewForEachAppearance {
            Testable_DSBottomContainer()
        }
    }
}
