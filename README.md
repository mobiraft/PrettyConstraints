# PrettyConstraints

PrettyConstraints helps you create your views faster programmatically using AutoLayout constraints.

## Installation
### CocoaPods
Using <a href="http://cocoapods.org/" rel="nofollow">CocoaPods</a>, install it by adding the following line to your Podfile:
```
pod 'PrettyConstraints'
```
### Swift Package Manager
Using <a href="https://swift.org/package-manager/" rel="nofollow">Swift Package Manager</a>, add it as a Swift Package in Xcode 11.0 or later, `select File > Swift Packages > Add Package Dependency...` and add the repository URL:
```
https://github.com/mobiraft/PrettyConstraints
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

<h2>Blog</h2>
<ul>
<li><a href="https://mobiraft.com/ios/create-app-without-storyboards-using-prettyconstraints/">Create app without Storyboards using PrettyConstraints | Mobiraft</a></li>
<li><a href="https://medium.com/@hardikparmarj/ios-app-without-storyboards-using-prettyconstraints-ec8e7dd7df9d">iOS app without Storyboards using PrettyConstraints | by Hardik Parmar | Nov, 2020 | Medium</a></li>
</ul>

<h2>Contant us</h2>

<a href="https://twitter.com/mobiraft">Twitter</a>


<h2>Website</h2>

Visit us for more Android, SwiftUI and Swift articles.
<a href="http://www.mobiraft.com/">www.mobiraft.com</a>
