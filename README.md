


<p align="center">
    <img src="Content/Images/Logo.png" width="528" max-width="100%" alt="DSKit"/>
</p>



<p align="center">
    <img src="https://img.shields.io/badge/Swift-5.5-brightgreen.svg" />
    <a href="https://swift.org/package-manager">
        <img src="https://img.shields.io/badge/spm-compatible-brightgreen.svg?style=flat" alt="Swift Package Manager" />
    </a>
    <img src="https://img.shields.io/badge/iOS-13+-brightgreen.svg?style=flat" alt="iOS"/>
    <img src="https://circleci.com/gh/imodeveloperlab/dskit/tree/main.svg?style=shield" alt="iOS"/>
    <img src="https://img.shields.io/github/issues/imodeveloperlab/dskit"/>
    
</p>


Welcome to **DSKit** a Design System Kit for iOS 13+ is an iOS SDK written in Swift with a collection of reusable components, guided by clear standards, that can be assembled to build any number of applications.



# Why DSKit?

<p align="center">
    <img src="Content/Images/ListGridGallery.png" max-width="100%" alt="DSKit"/>
</p>


We can find a lot of design systems that can help you build any app you want. The problem is that they all are overwhelmingly complicated; this means there is a big learning curve from starting a new project to delivering it to the store.

DSKit is trying to do everithing simplier, it will not cover everything, but if it fits your needs it will deliver flawless functionality. It’s the easiest way to make simple iOS Applications and business white labels with great design and Pixel Perfect UI.

#### All you have to do is:

* Chose your components
* Define the application flow
* Define colors, spacings, fonts, and further you don't care about spaces, layout, dimensions, etc.
* DSKit will take care of the rest.




## Ducumentation

<p align="center">
    <img src="https://d33wubrfki0l68.cloudfront.net/67cf3042d369b91b1259f981e3550811a68bd56e/645ec/images/app/dskit_home.jpg" width="50%" alt="DSKit"/>
</p>

DSKit provides the easiest way to design, build complex and pixel-perfect user interfaces.

Working with DSKit, you will work with three base layout sections List, Grids, and Galleries, each section will manage and display your view models.

```swift
let texts = ["Petrichor", "Sumptuous", "Angst", "Aesthete","Nadir"]

let viewModels = texts.map { (text) -> DSViewModel in
    DSTextVM(.body, text: text)
}

show(content: viewModels.list())
```

* [Code Example](https://dskit.app/home-code-example)
* [Documentation](https://dskit.app/components)
* [Layout](https://dskit.app/layout)
* [Appearance](https://dskit.app/appearance)
* [Custom View Model](https://github.com/imodeveloperlab/dskit/blob/main/Content/CustomViewModels.md)

## Get Started !

To get started using DSKit you can download this git repo and build and explore the DSKit Explorer app, which will show all available components and guide you on how to get DSKit in your project.

<p align="center">
    <img src="Content/Images/Project.png" max-width="100%" alt="DSKit"/>
</p>

### Installation

DSKit is distributed using the [Swift Package Manager](https://swift.org/package-manager). 

To use DSKit within an iOS, then use Xcode’s `File > Add Packages...` menu command to add it to your project.

Then import DSKit wherever you’d like to use it:

```swift
import DSKit
```

For more information on how to use the Swift Package Manager, check out [this article](https://www.swiftbysundell.com/articles/managing-dependencies-using-the-swift-package-manager), or [its official documentation](https://swift.org/package-manager).

### Live coding demo

<p align="center">
   <a href="https://www.youtube.com/watch?v=EeZZqMMsjNw"> <img src="Content/Images/LiveCoding.png" max-width="100%" alt="DSKit"/></a>
</p>

## Demo Projects

To get you started Design System Kit provides app demonstration code where you can see all the possibilities. You can even use this ready-made code for your next project.

### RSS-Feed App Template
App template for RSS Feeds
[GitHub Project](https://github.com/imodeveloperlab/RSS-Feed)
<table>
  <tr>
    <td><img src="https://github.com/imodeveloperlab/RSS-Feed/blob/main/Content/Images/2.png"/></td>
    <td><img src="https://github.com/imodeveloperlab/RSS-Feed/blob/main/Content/Images/6.png"/></td>
    <td><img src="https://github.com/imodeveloperlab/RSS-Feed/blob/main/Content/Images/3.png"/></td>
    <td><img src="https://github.com/imodeveloperlab/RSS-Feed/blob/main/Content/Images/5.png"/></td>  
  <tr>   
</table>

### E-commerce
Over 60 UI/UX Interfaces for E-Commerce Apps
[GitHub Project](https://github.com/imodeveloperlab/E-commerce) | [View more](https://dskit.app/demo-ecommerce)
<table>
    <tr>
      <td><img src="https://d33wubrfki0l68.cloudfront.net/7fc5a774ae091677f957c45ae14fc2aae34c1523/21740/images/demo/ecommerce/ecommerce-design20.png" class="img-fluid rounded work-image" alt="barber-shop, ui, ux, ios design, design system, apple"></td>
      <td><img src="https://d33wubrfki0l68.cloudfront.net/9ae63d9147c4c91fd773f66864eb1a6d221f2ffa/98067/images/demo/ecommerce/ecommerce-design21.png" class="img-fluid rounded work-image" alt="barber-shop, ui, ux, ios design, design system, apple"></td> 
      <td><img src="https://d33wubrfki0l68.cloudfront.net/611e902665cf10dc26fa0a2c7288f9cadc3df09d/9de90/images/demo/ecommerce/ecommerce-design43.png" class="img-fluid rounded work-image" alt="barber-shop, ui, ux, ios design, design system, apple"></td>
      <td><img src="https://d33wubrfki0l68.cloudfront.net/a37f93e66cb180ab1c0bd8beb15d37e43ecf4aac/a31b1/images/demo/ecommerce/ecommerce-design60.png" class="img-fluid rounded work-image" alt="barber-shop, ui, ux, ios design, design system, apple"></td>
    </tr>
</table>

### Food Delivery
Over 30 UI/UX Interfaces for Food Delivery
[GitHub Project](https://github.com/imodeveloperlab/Food-Delivery) | [View more](https://dskit.app/demo-food-delivery)
<table>
    <tr>
      <td><img src="https://d33wubrfki0l68.cloudfront.net/2af56f1ce489897f343a01168040dab7ad4c3096/0831f/images/demo/fooddelivery/food-delivery16.png" class="img-fluid rounded work-image" alt="barber-shop, ui, ux, ios design, design system, apple"></td>
      <td><img src="https://d33wubrfki0l68.cloudfront.net/0d5ef3aa6963fb876e285e45a3b80486bc413418/72d3f/images/demo/fooddelivery/food-delivery19.png" class="img-fluid rounded work-image" alt="barber-shop, ui, ux, ios design, design system, apple"></td> 
      <td><img src="https://d33wubrfki0l68.cloudfront.net/88f5af944b0abfe957cec095f80ea20761899553/77718/images/demo/fooddelivery/food-delivery21.png" class="img-fluid rounded work-image" alt="barber-shop, ui, ux, ios design, design system, apple"></td>
      <td><img src="https://d33wubrfki0l68.cloudfront.net/1dfddb72887272fd743dc39d103c66e2c976d79b/aac5b/images/demo/fooddelivery/food-delivery23.png" class="img-fluid rounded work-image" alt="barber-shop, ui, ux, ios design, design system, apple"></td>
    </tr>
</table>

### Flowers Store
Over 15 UI/UX Interfaces for Flowers Store Apps
[GitHub Project](https://github.com/imodeveloperlab/Flower-Store) | [View more](https://dskit.app/demo-flowersstore)
<table>
    <tr>
      <td><img src="https://d33wubrfki0l68.cloudfront.net/9b5cd1a44eaff6bc864cb9914672b48825a3e817/e030a/images/demo/flowersstore/flowers-store-design15.png" class="img-fluid rounded work-image" alt="barber-shop, ui, ux, ios design, design system, apple"></td>
      <td><img src="https://d33wubrfki0l68.cloudfront.net/f03a3b3b8d268a4d4629a49ce93c771ec824201d/b3add/images/demo/flowersstore/flowers-store-design1.png" class="img-fluid rounded work-image" alt="barber-shop, ui, ux, ios design, design system, apple"></td> 
      <td><img src="https://d33wubrfki0l68.cloudfront.net/052dac15e878e5e3660df5f3541d0fd8d8dd557a/99352/images/demo/flowersstore/flowers-store-design17.png" class="img-fluid rounded work-image" alt="barber-shop, ui, ux, ios design, design system, apple"></td>
      <td><img src="https://d33wubrfki0l68.cloudfront.net/81186fcb4b245c84aec41b52aaa758bc4880e53e/e8865/images/demo/flowersstore/flowers-store-design12.png" class="img-fluid rounded work-image" alt="barber-shop, ui, ux, ios design, design system, apple"></td>
    </tr>
</table>

### Barbershop
Over 20 UI/UX Interfaces for Barbershop Apps
[GitHub Project](https://github.com/imodeveloperlab/Barbershop) | [View more](https://dskit.app/demo-barbershop)
<table>
    <tr>
      <td><img src="https://d33wubrfki0l68.cloudfront.net/972da119cefb9fdb17e4fa3bb0dc420e6e44eede/6eef7/images/demo/barbershop-dark/barbershop-ios-design1.png" class="img-fluid rounded work-image" alt="barber-shop, ui, ux, ios design, design system, apple"></td>
      <td><img src="https://d33wubrfki0l68.cloudfront.net/bba9483eab087362cb3307dfcfd38b5ee5ba5008/dce76/images/demo/barbershop-dark/barbershop-ios-design2.png" class="img-fluid rounded work-image" alt="barber-shop, ui, ux, ios design, design system, apple"></td> 
      <td><img src="https://d33wubrfki0l68.cloudfront.net/314ac3a92fd54847d1abf980d3c5a6d94c755732/7191d/images/demo/barbershop-dark/barbershop-ios-design3.png" class="img-fluid rounded work-image" alt="barber-shop, ui, ux, ios design, design system, apple"></td>
      <td><img src="https://d33wubrfki0l68.cloudfront.net/215b9a3676ddf905127c91f4073748c6640a253a/a7781/images/demo/barbershop-dark/barbershop-ios-design4.png" class="img-fluid rounded work-image" alt="barber-shop, ui, ux, ios design, design system, apple"></td>
    </tr>
</table>



## Idea

The idea revolves around the design problem for mobile applications, in the company I worked for, there has always been the design problem, namely that designers make beautiful interfaces, only that they are not practical, difficult to implement.

In the business segment, small business, not all the time, there are enough resources, time and knowledge to generate content exclusively for mobile applications, pictures, illustrations, icons and perfect texts. The design that looks perfect at first, become problematic, the real content does not fit, the images are not so perfect, the buttons are not in place, and so on.

This is the first reason, I started working on DSKit, it is a tool, with the help of which it is possible to quickly create new interfaces, in which the typography, spaces, colors will be consistent in all the application screens.

The second reason is that there are a lot of applications, for online appointments, shopping, delivery, that work, but have an ugly design (in my opinion), and all because the business does not have the resources to hire a company or a designer to develop a special design. for their business.

Unlike Material Design, Flutter and other, design systems, that are overwhelmingly complicated, DSKit should be focused on fast delivery, with the most useful and simple components, and a lot of code examples, for different use cases.

DSKit will not, (and should not) cover everything, but if it fits the business requirements it should deliver flawless functionality. It should be the easiest way to make simple iOS applications and business white labels with a great, clean design and pixel-perfect UI.


## Contributions and support

DSKit is developed completely in the open, and your contributions are more than welcome.

Before you start using DSKit in any of your projects, it’s highly recommended that you spend a few minutes familiarizing yourself with its documentation and internal implementation, so that you’ll be ready to tackle any issues or edge cases that you might encounter.

Since this is a very young project, it’s likely to have many limitations and missing features, which is something that can really only be discovered and addressed as more people start using it.

This project does not come with GitHub Issues-based support, and users are instead encouraged to become active participants in its continued development — by fixing any bugs that they encounter, or by improving the documentation wherever it’s found to be lacking.

If you wish to make a change, open a [Pull Request](https://github.com/imodeveloperlab/dskit/pulls) — even if it just contains a draft of the changes you’re planning, or a test that reproduces an issue — and we can discuss it further from there.

Hope you’ll enjoy using DSKit!
