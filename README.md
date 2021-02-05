<img src="https://images.unsplash.com/photo-1520359319979-f360d010d777?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80" alt="Photo by Bryson Hammer on Unsplash">

# 🔗 JSConstraints

[![Version](https://img.shields.io/cocoapods/v/JSConstraints.svg?style=flat)](https://cocoapods.org/pods/JSConstraints)
![CI](https://github.com/jaysack/JSConstraints/workflows/status/badge.svg)
[![Platform](https://img.shields.io/cocoapods/p/JSConstraints.svg?style=flat)](https://cocoapods.org/pods/JSConstraints)
[![License](https://img.shields.io/cocoapods/l/JSConstraints.svg?style=flat)](https://cocoapods.org/pods/JSConstraints)

> 💡 A tiny Swift library written with only one thing in mind: **Blazin' Fast Programmatic Constraints-Typing**.

JSConstraints is a really small library extending `UIView` and `UIStackView` functionalities.
- - - -
<br>

## Table Of Content
- [📥. Installation](#-installation)
    * [Cocoapods](#cocoapods)
    * [Swift Package Manager](#swift-package-manager)
<br>

- [📓. How It Works](#-how-it-works)
    * [Import Library](#import-library)
    * [Square](#square)
    * [Directional Constraints](#adding-constraints)
    * [Relative Constraints](#relative-constraints)
    * [Centering a View](#centering-a-view)
    * [Pin to Superview](#pin-to-superview)
<br>

- [⚠️. UILayoutGuide Edge Cases](#%EF%B8%8F-what-about-uilayoutguide-cases)
<br>

- [♻️. Dynamic Constraints](#%EF%B8%8F-how-about-dynamic-constraints)
    * [Prepare Constraints](#1-get-active-constraints)
    * [Update Constraints](#2-update-constraints)
    * [Animate](#3-animation)
<br>

- [✉️. Author](#%EF%B8%8F-author)
<br>

- [🔏. License](#-license)
- - - -
<br>

## 📥 Installation
JSConstraints is available through [CocoaPods](https://cocoapods.org) and [Swift Package Manager](https://developer.apple.com/documentation/xcode/adding_package_dependencies_to_your_app). 

### Cocoapods
To install via Cocoapods, simply add the following line to your Podfile:

```ruby
pod 'JSConstraints'
```
<br>

### Swift Package Manager
Using SPM instead? In Xcode project, select **File** > **Swift Package** > **Add Package Dependecy** and paste the URL below.
```
https://github.com/jaysack/JSConstraints
```
- - - -
<br>

## 📓 How It Works?
JSConstraints removes all unecessary boilerplate code needed when creating programmatic constraints.\
Simply use one of the methods below to constraint any view:
- `setConstraints()`
- `centerIn()`
- `pintTo()`
```swift
// Default
foo.setConstraints([ .top(view.topAnchor) ])

// Shortcut
foo.🔗([ .top(view.topAnchor) ])

```


### Import Library
First, import the library
```swift
import JSConstraints
```
- - - -
<br>

### Square
<img src="https://jaysack-github-readme.s3.us-east-2.amazonaws.com/jsconstraints/square-example.png" alt="Pink square in Xcode simulator">

The `.square()` enum is pretty straight forward and allows you to make "squared" view. It sets both, width and height, to the value provided.
```swift
pinkSquare.setConstraints([ .square(185) ])
```

#### What Just Happened?
We set both `width` and `height` constraints to `185`.
- - - -
<br>

### Directional Constraints
<img src="https://jaysack-github-readme.s3.us-east-2.amazonaws.com/jsconstraints/directional-constraints-example.png" alt="Pink constraints to left and bottom in Xcode simulator">

```swift
// 1. Add to superview
view.addSubview(pinkSquare)

// 2. Set constraints
pinkSquare.setConstraints([
    .leading(view.leadingAnchor),
    .bottom(view.bottomAnchor) + .constant(18)
])
```
<br>

#### What Just Happened?
1. We constrained `pinkSquare` to its superview's leading anchor.
```swift
let leadingConstraint = .leading(view.leadingAnchor)
```
<br>

2. We then constrained  `pinkSquare` again 18 points aways from its superview bottom anchor.
```swift
let bottomConstraint = .bottom(view.bottomAnchor) + .constant(18)
```
<br>


#### Refactored Form
Let’s put it all back together, and we get:
```swift
// Add pink square to superview
view.addSubview(pinkSquare)

// Set constraints
pinkSquare.🔗([ bottomConstraint, leadingConstraint ])
```
> 💡 `constant` argument is optional and replaced by 0 if not provided.
- - - -
<br>

### Reliative Constraints
<img src="https://jaysack-github-readme.s3.us-east-2.amazonaws.com/jsconstraints/relative-constraints-example.png" alt="Pink constraints to left and bottom in Xcode simulator">

```swift
indigoView.setConstraints([
    .relWidth(view.widthAnchor) * .multiplier(0.4),
    .relHeight(pinkSquare.heightAnchor) * .multiplier(1.18)
])

// We're assuming here that the indigo view's in already in
// its superview's stack and has been constrained from its top and right sides.
```
<br>

#### What Just Happened?
We set the width of `indigoView` to be 0.4 times the size of  `view` width.\
We also set `indigoView` to be slightly taller than our `pinkSquare`.

> 💡 `multiplier` argument is optional and replaced by 1 if not provided.
- - - -
<br>

### Centering a View
<img src="https://jaysack-github-readme.s3.us-east-2.amazonaws.com/jsconstraints/centering-view-example.png" alt="Yellow circle in Xcode simulator">

```swift
yellowCircle.centerIn(superview: self.view)
```
<br>

#### What Just Happened?
We constrained `yellowCircle` in the **center** of the the screen.
- - - -
<br>


### Pin to Superview
<img src="https://jaysack-github-readme.s3.us-east-2.amazonaws.com/jsconstraints/pin-to-superview-example.png" alt="Indigo view pinned to superview in Xcode simulator">

```swift
indigoView.pinTo(superview: self.view, withPadding: 18)
```  

- - - -
<br>

## ⚠️ What About `UILayoutGuide` Cases?
Depending on your design, you may opt to pin your view to either your ViewController's `view` or it's `layoutGuide` as both are supported with JSConstraints.\
Using `layoutGuide` will automatically add a child view to the layout guide's owner view:
```swift
indigoView.pinTo(layoutGuide: view.safeAreaLayoutGuide) 

// Indigo view was automatically added to `view` subviews
```
- - - -
<br>


## ♻️ How About Dynamic Constraints?
JSConstraints methods always return the collection of successfully activated constraints.\
We can use it to toggle between  `active` and `inactive` states.
<br>

### 1. Get Active Constraints
```swift
// Save returned constraints
var pinkOptionalConstraints = pinkSquare.setConstraints([ bottomConstraint, leadingConstraint ])
var indigoOptionalConstraints = indigoView.setConstraints([ topConstraint, trailingConstraint ])

// Append to array of dynamic constraints
dynamicConstraints.append(contentsOf: pinkOptionalConstraints)
dynamicConstraints.append(contentsOf: indigoOptionalConstraints)
```
Here, a list of activated constraints of type `[NSLayoutConstraint]` is returned to us. We can save the result in `dynamicConstraints` variable.\
<br>

### 2. Update Constraints
```swift
// Deactivate optional constraints
dynamicConstraints.forEach { $0.isActive = false }

// Set new constraints
[pinkSquare, indigoView].forEach { $0.centerIn(superview: view) }
```
Here, we’re deactivating our optional constraints, then, adding new constraints.
- - - -
<br>

### 3. Animation
<img src="https://jaysack-github-readme.s3.us-east-2.amazonaws.com/jsconstraints/dynamic-constraints-example.gif" alt=" Subviews animations" height>

- - - -
<br>

## ✉️ Author
Jonathan Sack\
dev@jonathansack.io
- - - -
<br>

## 🔏 License
Copyright © 2020 Jonathan Sack

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
