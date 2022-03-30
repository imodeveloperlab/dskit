

<p align="center">
    <img src="Content/Images/Logo.png" width="528" max-width="100%" alt="DSKit"/>
</p>

<p align="center">
    <img src="https://img.shields.io/badge/Swift-5.5-brightgreen.svg" />
    <a href="https://swift.org/package-manager">
        <img src="https://img.shields.io/badge/spm-compatible-brightgreen.svg?style=flat" alt="Swift Package Manager" />
    </a>
    <img src="https://img.shields.io/badge/platforms-iOS-brightgreen.svg?style=flat" alt="iOS"/>
    <img src="https://img.shields.io/badge/iOS-13+-brightgreen.svg?style=flat" alt="iOS"/>
</p>

Welcome to **DSKit** a Design System Kit for iOS 13+ is an iOS SDK written in Swift with a collection of reusable components, guided by clear standards, that can be assembled to build any number of applications.

[![CircleCI](https://circleci.com/gh/imodeveloperlab/dskit/tree/main.svg?style=svg)](https://circleci.com/gh/imodeveloperlab/dskit/tree/main)


# Why DSKit?

We can find a lot of design systems that can help you build any app you want. The problem is that they all are overwhelmingly complicated; this means there is a big learning curve from starting a new project to delivering it to the store.

DSKit will not cover everything, but if it fits your needs it will deliver flawless functionality. It’s the easiest way to make simple iOS Applications and business white labels with great design and Pixel Perfect UI.

#### All you have to do is:

* Chose your components
* Define the application flow
* Define colors, spacings, fonts, and further you don't care about spaces, layout, dimensions, etc.
* DSKit will take care of the rest.

<p align="center">
    <img src="Content/Images/ListGridGallery.png" max-width="100%" alt="DSKit"/>
</p>

## Demo Projects

To get you started Design System Kit provides app demonstration code where you can see all the possibilities. You can even use this ready-made code for your next project.

* [E-commerce](https://github.com/imodeveloperlab/E-commerce)
* [Barbershop](https://github.com/imodeveloperlab/Barbershop)
* [Food Delivery](https://github.com/imodeveloperlab/Food-Delivery)
* [Flowers Store](https://github.com/imodeveloperlab/Flower-Store)

## Ducumentation

* [Code Example](https://dskit.app/home-code-example)
* [Components](https://dskit.app/components)
* [Layout](https://dskit.app/layout)
* [Appearance](https://dskit.app/appearance)

## Get Started !

Start working with DSKit which will help you quickly build your app user interface

## Installation

DSKit is distributed using the [Swift Package Manager](https://swift.org/package-manager). 

To use DSKit within an iOS, then use Xcode’s `File > Add Packages...` menu command to add it to your project.

Then import DSKit wherever you’d like to use it:

```swift
import DSKit
```

For more information on how to use the Swift Package Manager, check out [this article](https://www.swiftbysundell.com/articles/managing-dependencies-using-the-swift-package-manager), or [its official documentation](https://swift.org/package-manager).

## Show Content

Displaying content in DSKit is easy, all you have to do is just call one function with content you want to display or want to update.

```swift
show(content: [YOUR_SECTION])
```

Content is composed of two data structures **DSSection** and **DSViewModel**

**DSSection** - is used to describe how content will be displayed on the screen, in one word: Layout **DSViewModel** - is used to describe your content on the screen, labels, texts, images, actions, and so on.

You can display your view models in **Lists**, **Grids**, and **Galleries**.

To easily transform an array of **DSViewModel**'s in a section just call .list() .grid() .gallery() method on your view models array.

Every time your need to update content on the screen, add, delete, change position, just change your content structure and call show(content: [YOUR_SECTION]) DSKit will automatically update the changes, remove non-existent content, or switch position, and it will be animated.

```swift
let texts = ["Petrichor","Sumptuous","Angst","Aesthete","Nadir"]

let viewModels = texts.map { (text) -> DSViewModel in
    DSLabelVM(.body, text: text)
}

show(content: viewModels.list())
```
### List

```swift
let texts = ["Petrichor","Sumptuous","Angst","Aesthete","Nadir"]

let viewModels = texts.map { (text) -> DSViewModel in
    DSLabelVM(.body, text: text)
}

show(content: viewModels.list())
```

### Grid

```swift
let viewModels = [1,2,3,4,5].map { (index) -> DSViewModel in
    var viewModel = DSImageVM(image: UIImage(named: "picture-\(index)"))
    viewModel.height = .absolute(150)
    return viewModel
}

show(content: viewModels.grid())
```

### Gallery

```swift
let viewModels = [1,2,3,4,5,6,7,8,9,10,11,12].map { (index) -> DSViewModel in

    var viewModel = DSImageVM(image: UIImage(named: "picture-\(index)"))
    viewModel.height = .absolute(150)
    viewModel.width = .absolute(150)
    return viewModel
}

show(content: viewModels.gallery())
```

