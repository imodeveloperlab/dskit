## Layout in DSKit

DSKit streamlines the process of creating consistent and visually appealing layouts in SwiftUI applications. By leveraging the design system's predefined spacing and layout rules, DSKit ensures that all interface elements are harmoniously aligned and spaced, significantly simplifying the development process.

### Core Layout Components

#### **DSVStack** and **DSHStack**
`DSVStack` and `DSHStack` are vertical and horizontal stack views, respectively, that extend SwiftUI's native `VStack` and `HStack`. These components automatically incorporate DSKit's design system spacing, ensuring consistent margins and paddings that adapt across different screen sizes and orientations. They use environmental values from `DSAppearance` to dynamically adjust spacing between elements, making it easy to maintain visual consistency throughout the app.

#### Spacing in DSKit
DSKit defines several types of spacing to ensure flexibility and adaptability in various layout contexts:
- **Regular**: The standard spacing used for most elements within the stacks.
- **None**: Allows elements to sit flush against each other.
- **Small**, **Medium**, and **Large**: Provide incremental adjustments to spacing, allowing for finer control over the layout aesthetics.

### Consistent Spacing Across Components
All components in DSKit, including `DSText`, `DSButton`, `DSImageView`, and others, utilize the same spacing and margins system. This uniform approach ensures that elements within any DSKit layout inherently align with each other, providing a seamless user experience.

- **DSImageView**: Applies consistent margins and paddings that align with other components within a layout. For example, when used alongside `DSText` within a `DSVStack`, both components will have matching horizontal alignments and spacing.
  
- **DSTextField**: Uses predefined spacing rules for internal elements such as icons and clear buttons, ensuring they match the overall layout's rhythm established by `DSVStack` or `DSHStack`.

### Utilizing DSKit for Layouts
Using DSKit's layout components like `DSVStack` and `DSHStack`, along with text, button, and image components, allows developers to efficiently create layouts that are consistent with the overarching design language.

### Example: Creating a Consistent Layout
Here’s a simple example demonstrating how to use DSKit's layout components to create a consistent interface:

```swift
struct ExampleView: View {
    var body: some View {
        DSVStack {
            DSText("Welcome to DSKit", multilineTextAlignment: .center)
                .dsTextStyle(.title1)

            DSImageView(named: "logo", size: .mediumIcon)
                .dsPadding(.small)

            DSText("Start building beautiful and consistent layouts today!")
                .dsTextStyle(.body)

            DSButton(title: "Get Started", action: {
                print("Button tapped")
            })
        }
        .dsPadding(.medium)
        .dsSecondaryBackground()
        .dsCornerRadius()
    }
}
```

In this example, `DSVStack` is used to vertically stack the text, image, and button elements. Each component adheres to the same spacing and styling rules, ensuring a cohesive and visually appealing layout.
