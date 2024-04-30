

<p align="center">
    <img src="Content/Images/Logo.png" width="150" max-width="100%" alt="DSKit"/>
</p>
<p align="center">
    <img src="https://img.shields.io/badge/iOS-15+-brightgreen.svg?style=flat" alt="iOS"/>
    <img src="https://img.shields.io/badge/SwiftUI-3.0-brightgreen.svg"/>
    <a href="https://swift.org/package-manager">
        <img src="https://img.shields.io/badge/spm-compatible-brightgreen.svg?style=flat" alt="Swift Package Manager"/>
    </a>
</p>


### What is DSKit?

DSKit is a simple **Design System Kit**  for **iOS 15+ SwiftUI**, designed to help developers create simple, consistent and attractive user interfaces with ease. It includes essential view modifiers which ensure that all UI components follow a unified style guide. 

> [!Note]
> If you're looking for the UIKit version of DSKit, you can find it within the same repository under the subfolder named **UIKitVersion**. For more details on the UIKit implementation and its features, please refer to the [UIKit Version documentation](UIKitVersion) provided in the repository.

### Components and Layouts

DSKit offers a library of ready-to-use UI components and full-screen layouts that are designed to be easily integrated and customized within your projects. Each component and screen layout is fully adaptable, allowing you to tweak and refine them to perfectly fit the specific needs of your application. This accessibility accelerates the development process, enabling you to implement complex design solutions efficiently while maintaining a high standard of aesthetics and functionality.

<table>
<tr>
<td>
<img src="Content/Screenshots/HomeScreen3.DSKit_light_screenshot_framed.png">
</td>
<td>
<img src="Content/Screenshots/ItemDetails2.DSKit_light_screenshot_framed.png">
</td>
<td>
<img src="Content/Screenshots/Order1.DSKit_light_screenshot_framed.png">
</td>
</tr>
</table>
<p align="center"><a href="Content/Layout-in-DSKit.md">Learn more about layout in DSKit<a/> or see <a href="Content/Views.md">all available Views</a></p>



### Appearances

DSKit includes a selection of ready-to-use appearances that support both light and dark modes, suitable for immediate integration into your projects. These appearances are fully customizable, allowing you to tweak and modify them according to your specific requirements. This flexibility ensures that you can maintain consistency across different themes while adapting to user preferences. 

<table>
<tr>
<td>
<img src="Content/Screenshots/ItemDetails3.Dark_light_screenshot_framed.png">
</td>
<td>
<img src="Content/Screenshots/ItemDetails3.Peach_light_screenshot_framed.png">
</td>
<td>
<img src="Content/Screenshots/ItemDetails3.Blue_light_screenshot_framed.png">
</td>
</tr>
</table>
<p align="center"><a href="Content/Appearance-in-DSKit.md">Read more about appearance and customization<a/></p>



## Documentation

The most effective way to familiarize yourself with DSKit and its capabilities is by utilizing the **DSKit Explorer app**. To begin, clone the repository and launch the **DSKit Explorer app**. Within the app, you'll have access to all available screens, which you can open in preview mode. This feature allows you to interactively switch between different appearances and make modifications to the screens according to your preferences.

![PlayAndPrototype](Content/Images/PlayAndPrototype.png)

>  [!NOTE]
>  Using the **DSKit Explorer** provides a practical demonstration of how DSKit's components and modifiers integrate to create efficient and cohesive UIs with minimal coding effort. It serves as an excellent visual and interactive guide to understanding the simplicity and power of DSKit in streamlining screen development.

To dive deeper into specific features and functionalities, continue to the sections below. These segments offer detailed insights into the individual elements of DSKit, helping you leverage its full potential in your projects.

- [Layout](Content/Layout-in-DSKit.md)
- [Views / Components](Content/Views.md)
- [Appearance](Content/Appearance-in-DSKit.md)



## Quick Start

To get started with DSKit, a design system toolkit for SwiftUI applications, you can integrate it into your projects using Swift Package Manager (SPM)

### Step 1: Adding DSKit via Swift Package Manager (SPM)
To add DSKit to your project, follow these steps:

1. **Open your Xcode project**: Launch Xcode and open the project where you want to include DSKit.

2. **Add the package dependency**:
   - Go to `File` > `Swift Packages` > `Add Package Dependency...`
   - Enter the repository URL `git@github.com:imodeveloperlab/dskit.git`.
   - Select the version of the package you wish to add. You can choose a specific release or the latest commit.
   - Xcode will download the package and ask which of your project's targets to add it to. Select the target where you want to use DSKit.

### Step 2: Importing DSKit
Once DSKit is added to your project, you can start using it by importing the package at the top of your Swift files where you want to use the design system components:

```swift
import DSKit
```

### Step 3: Using DSKit in Your Screens
To integrate DSKit components and modifiers into your SwiftUI views, simply use them like any other SwiftUI component or modifier. Here’s an example of how you might use DSKit:

```swift
import SwiftUI
import DSKit

struct ContentView: View {
    var body: some View {
        DSVStack {
            DSText("Welcome to DSKit")
                .dsPadding()
                .dsBackground(.primary)
            DSText("Design with ease")
                .dsPadding()
                .dsBackground(.secondary)
        }
        .dsPadding()
    }
}
```

In this example, `DSVStack`, `DSText`, and various modifiers like `dsPadding()` and `dsBackground()` are used. These components and modifiers are part of DSKit and help apply consistent styling and spacing as defined in your design system.

## Contributions and support

DSKit is developed completely in the open, and your contributions are more than welcome.

Before you start using DSKit in any of your projects, it’s highly recommended that you spend a few minutes familiarizing yourself with its documentation and internal implementation, so that you’ll be ready to tackle any issues or edge cases that you might encounter.

Since this is a very young project, it’s likely to have many limitations and missing features, which is something that can really only be discovered and addressed as more people start using it.

This project does not come with GitHub Issues-based support, and users are instead encouraged to become active participants in its continued development — by fixing any bugs that they encounter, or by improving the documentation wherever it’s found to be lacking.

If you wish to make a change, open a [Pull Request](https://github.com/imodeveloperlab/dskit/pulls) — even if it just contains a draft of the changes you’re planning, or a test that reproduces an issue — and we can discuss it further from there.

Hope you’ll enjoy using DSKit!
