Displaying content in DSKit is easy, all you have to do is just call one function with content you want to display or want to update.

```swift 
show(content: [YOUR_SECTION])
```

Content is composed of two data structures **DSSection** and **DSViewModel**

**DSSection** - is used to describe how content will be displayed on the screen, in one word: [Layout ](https://dskit.app/layout.html) **DSViewModel** - is used to describe your content on the screen, labels, texts, images, actions, and so on.

You can display your view models in **Lists, Grids, and Galleries**.

To easily transform an array of **DSViewModel's** in a section just call **.list() .grid() .gallery()** method on your view models array.

Every time your need to update content on the screen, add, delete, change position, just change your content structure and `call show(content: [YOUR_SECTION])` DSKit will automatically update the changes, remove non-existent content, or switch position, and it will be animated.

