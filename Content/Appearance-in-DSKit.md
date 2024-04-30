## Appearance in DSKit

DSKit provides a robust theming mechanism that allows developers to define and apply consistent visual styles throughout an application. The appearance system in DSKit is designed to manage and apply consistent styling across all UI components within an application. It encapsulates colors, fonts, spacing, padding, and other style-related properties. This system ensures that all components adhere to a unified design language, which can be easily adjusted or themed.

### How Appearance Works

The appearance in DSKit is managed through the `DSAppearance` environment object. This object holds all the theme-related settings that determine the look and feel of the components. By leveraging SwiftUI's environment capabilities, `DSAppearance` can be passed down the view hierarchy, ensuring that all components conform to the chosen theme seamlessly.

### Implementation and Usage

1. **Protocol-Driven Design**:
   - `DSAppearance` is a protocol that defines the required properties and methods for an appearance configuration. This includes aspects like views, text fields, buttons, navigation bars, and other UI components.
   - Example properties might include `primaryView`, `secondaryView`, `navigationBar`, `tabBar`, `textField`, and `price`.
2. **Environment Propagation**:
   - Appearance settings are propagated using the environment. SwiftUI's environment allows these settings to be accessed anywhere in the view hierarchy.
   - This is achieved through the `EnvironmentValues` structure, where an appearance instance can be stored and retrieved using an environment key.
3. **Dynamic Theming**:
   - The appearance system supports dynamic theming, allowing for real-time theme switching (e.g., light to dark mode) without the need for a complete reload of the UI.

### Create your custom appearance

When creating a new appearance within a system like DSKit, you leverage the `DSAppearance` protocol. This protocol acts as a template for defining the visual attributes that affect all parts of your application's UI, such as colors, fonts, and component-specific styles. Here’s a step-by-step guide on how to create a new appearance:

#### Step 1: Understand `DSAppearance`
First, review the `DSAppearance` protocol to understand what properties and methods it expects. Typically, this protocol includes properties for:

- View appearances (primary and secondary)
- Spacing and padding standards
- Component-specific appearances (like tab bars and navigation bars)
- Text styles and fonts
- General UI dimensions and color themes

#### Step 2: Create Your Appearance Struct
Create a new Swift file and define a struct that conforms to `DSAppearance`. Here, you will provide concrete implementations of each protocol requirement:

```swift
import SwiftUI

struct CustomAppearance: DSAppearance {
    var title: String = "Custom Theme"

    var primaryView: DSViewAppearanceProtocol
    var secondaryView: DSViewAppearanceProtocol
    var spacing: DSSpacingProtocol = DSSpacingSystem(spatialSystem: 8)
    var padding: DPaddingsProtocol = DSPaddingSystem(spatialSystem: 8)
    var tabBar: DSTabBarAppearanceProtocol
    var navigationBar: DSNavigationBarAppearanceProtocol
    var textField: DSTextFieldAppearanceProtocol
    var price: DSPriceAppearanceProtocol
    var fonts: DSFontsProtocol = DSFonts()
    var actionElementHeight: CGFloat = 50
    var screenMargins: CGFloat = 20

    init() {
        // Initialize primary and secondary views with specific colors and styles
        primaryView = DSViewAppearance(
            button: DSButtonAppearance(accentColor: .blue, supportColor: .white),
            text: DSTextAppearance(largeTitle: .black),
            textField: DSTextFieldAppearance(background: .lightGray, text: .black, placeHolder: .gray),
            background: .white,
            separator: .gray,
            cornerRadius: 10
        )

        secondaryView = DSViewAppearance(
            button: DSButtonAppearance(accentColor: .green, supportColor: .white),
            text: DSTextAppearance(largeTitle: .darkGray),
            textField: DSTextFieldAppearance(background: .darkGray, text: .white, placeHolder: .lightGray),
            background: .black,
            separator: .lightGray,
            cornerRadius: 8
        )

        // Set up other properties as needed
        tabBar = DSTabbarAppearance(
            barTint: .blue,
            itemTint: .white,
            unselectedItemTint: .gray,
            badge: .red,
            translucent: false
        )

        navigationBar = DSNavigationBarAppearance(
            buttons: .blue,
            text: .white,
            bar: .blue,
            translucent: false
        )

        textField = DSTextFieldAppearance(
            background: .lightGray,
            text: .black,
            placeHolder: .gray
        )

        price = DSPriceAppearance(
            regularAmount: .black,
            badgeBackground: .red
        )
    }

    func style(for viewStyle: DSViewStyle) -> DSViewAppearanceProtocol {
        switch viewStyle {
        case .primary:
            return primaryView
        case .secondary:
            return secondaryView
        }
    }
}
```

#### Step 3: Inject Your Appearance
Once your custom appearance is defined, inject it into your SwiftUI environment at the top level of your app:

```swift
@main
struct MyApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.appearance, CustomAppearance())
        }
    }
}
```

#### Step 4: Use Your Appearance
Now that your custom appearance is part of the environment, you can use its properties to style your views:

```swift
struct ContentView: View {
    @Environment(\.appearance) var appearance: DSAppearance

    var body: some View {
        DSText("Welcome to DSKit!")
            .dsPadding()
            .background(Color(appearance.primaryView.background))
    }
}
```

This setup allows you to maintain a consistent look throughout your app while making it easy to switch themes or appearances without significant refactoring. By following these steps, developers can effectively extend an existing appearance protocol to suit their unique design needs.