# Welcome to DSAppKit

In order to get started to display DSKit view models on the screen, you should

```
import DSKit
```

 and subclass your view controller from **DSViewController**, and you are ready to show content.

> In order to get started to display DSKit view models on the screen, you should import DSKit and subclass your view controller from **DSViewController**, and you are ready to show content.

## Welcome to DSAppKit

### Welcome to DSAppKit

another example of our code here

```
show(content: [viewModels3.gallery(), viewModels5.gallery()])
```

DSKit and subclass your view controller from **DSViewController**

```swift
let numbers = [1,2,3,4,5]

let viewModels3 = numbers.map { (index) -> DSViewModel in
    
    var viewModel = DSBoxVM(text: index.string())
    viewModel.height = .absolute(150)
    viewModel.width = .fractional(0.7)
    return viewModel
}

let viewModels5 = numbers.map { (index) -> DSViewModel in
    
    var viewModel = DSBoxVM(text: index.string())
    viewModel.height = .absolute(50)
    viewModel.width = .fractional(0.5)
    return viewModel
}

show(content: [viewModels3.gallery(), viewModels5.gallery()])

```
