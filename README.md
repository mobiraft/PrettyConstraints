# PrettyConstraints

PrettyConstraints helps you create your views faster programmatically using AutoLayout constraints.

## Installation
### CocoaPods
PrettyConstraints is available through <a href="http://cocoapods.org/" rel="nofollow">CocoaPods</a>. To install it, simply add the following line to your Podfile:
```
pod 'PrettyConstraints'
```
### Manual Installation
Download and include the `PrettyConstraints` folder and files in your codebase.

### Requirements
- iOS 11
- Swift 5

## How To Use
### Embedding View in another View:

```
let view = UIView(frame: CGRect(origin: .zero, size: CGSize(width: 100, height: 100)))
view.backgroundColor = .black
let subView = UIView()
subView.backgroundColor = .gray
view.addSubview(subView)
subView.applyConstraints(.fitInView(view, inset: 10))
```

![](https://mobiraft.com/wp-content/uploads/2020/10/Screenshot-2020-10-30-at-8.01.20-PM.png)

### Centering View inside another View:

```
subView.applyConstraints(.center(in: view),
                         .width(constant: 50),
                         .height(constant: 50))
```

![](https://mobiraft.com/wp-content/uploads/2020/10/Screenshot-2020-10-30-at-8.15.16-PM.png)

### Other Constraints examples:

```
subView.applyConstraints(.top(to: view.topAnchor),
                         .bottom(to: view.bottomAnchor),
                         .leading(to: view.leadingAnchor, equality: .greaterThanOrEqual),
                         .trailing(to: view.trailingAnchor, equality: .lessThanOrEqual),
                         .centerX(to: view.centerXAnchor),
                         .width(constant: 50),
                         .height(constant: 50))
```

![](https://mobiraft.com/wp-content/uploads/2020/10/Screenshot-2020-10-30-at-8.21.26-PM.png)

### Store constraints and modify when needed:

```
let constraints:[NSLayoutConstraint] = subView.applyConstraints(.center(in: view),
                                                                .width(constant: 50),
                                                                .height(constant: 50))
constraints[1].constant = 20 // Modifies the width as 20.0
```

<!--<h2>Blog</h2>
<ul>
<li><a href="https://mobiraft.com/ios/swiftui/animations-in-swiftui/" rel="nofollow">Animations in SwiftUI</a></li>
 
</ul-->

<h2>Contant us</h2>

<a href="https://twitter.com/mobiraft" rel="nofollow">Twitter</a>


<h2>Website</h2>

Visit us for more Android, SwiftUI and Swift articles.
<a href="http://www.mobiraft.com/" rel="nofollow">www.mobiraft.com</a>
