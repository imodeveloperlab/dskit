//
//  HeaderView.swift
//  DSKitExplorer
//
//  Created by Ivan Borinschi on 11.03.2023.
//

import SwiftUI

/*
## DSSectionHeaderView

`DSSectionHeaderView` is a SwiftUI component within the DSKit framework designed to provide a standard header for sections in interfaces. It typically includes a title and an actionable button, often used in list views, dashboards, or as part of more complex layouts where sections need clear labels and optional actions.

#### Initialization:
Initializes a `DSSectionHeaderView` with a title, action title, and a closure for handling button taps.
- Parameters:
- `title`: The text to display as the section header.
- `actionTitle`: The text for the action button.
- `action`: The closure to execute when the action button is tapped.

#### Usage:
`DSSectionHeaderView` is ideally used at the top of sections where a clear distinction and optional user interaction are needed, such as in settings menus, content lists, or information panels.
*/

public struct DSSectionHeaderView: View {
    @Environment(\.dismiss) var dismiss
    let title: String
    let actionTitle: String
    let action: () -> Void
    
    public init(title: String, actionTitle: String, action: @escaping () -> Void) {
        self.title = title
        self.actionTitle = actionTitle
        self.action = action
    }
    
    public var body: some View {
        DSHStack {
            DSText(title).dsTextStyle(.headline)
            Spacer()
            DSButton.callToActionLink(title: actionTitle, action: action)
        }.dsHeight(20)
    }
}

struct Testable_DSSectionHeaderView: View {
    var body: some View {
        DSSectionHeaderView(
            title: "Top Products",
            actionTitle: "View All",
            action: { }
        )
    }
}

struct DSSectionHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        DSPreviewForEachAppearance {
            DSPreview {
                Testable_DSSectionHeaderView()
            }
        }
    }
}
