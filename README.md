<img src="https://images.unsplash.com/photo-1520359319979-f360d010d777?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80" alt="Photo by Bryson Hammer on Unsplash" height="500">

# JSConstraints

[![Version](https://img.shields.io/cocoapods/v/JSConstraints.svg?style=flat)](https://cocoapods.org/pods/JSConstraints)
![CI](https://github.com/jaysack/JSConstraints/workflows/status/badge.svg)
[![Platform](https://img.shields.io/cocoapods/p/JSConstraints.svg?style=flat)](https://cocoapods.org/pods/JSConstraints)
[![License](https://img.shields.io/cocoapods/l/JSConstraints.svg?style=flat)](https://cocoapods.org/pods/JSConstraints)

> 💡 A tiny Swift library written with only one thing in mind: **Blazin' Fast Programmatic Constraints-Typing**

JSConstraints is a really small library extending `UIView` and `UIStackView` functionalities
- - - -
<br>

## Table Of Content
- [📥%20Installation](#-installation)
    * [Cocoapods](#cocoapods)
    * [Swift Package Manager](#swift-package-manager)
- [📓%20How It Works](#-how-it-works)
    * [Import Library](#import-library)
    * [Adding Constraints](#adding-constraints)
    * [Relative Constraints](#relative-constraints)
    * [Sides](#sides)
    * [Centering a View](#centering-a-view)
    * [Pin to Superview](#pin-to-superview)
- [⚠️%20UILayoutGuide Edge Cases](#%EF%B8%8F-what-about-uilayoutguide-cases)
- [♻️%20Dynamic Constraints](#%EF%B8%8F-how-about-dynamic-constraints)
    * [Prepare Constraints](#1-get-active-constraints)
    * [Update Constraints](#2-update-constraints)
    * [Animate](#3-animation)
- [✉️%20Author](#%EF%B8%8F-author)
- [🔏%20License](#-license)
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
Using SPM instead? In Xcode project, select **File** > **Swift Package** > **Add Package Dependecy** and enter the repo URL below.
```
https://github.com/jaysack/JSConstraints
```
- - - -
<br>

## 📓 How It Works?

### Import Library
First, import the library
```swift
import JSConstraints
```
- - - -
<br>

### Adding Constraints
```swift
// 1. Add to superview
view.addSubview(pinkSquare)

// 2. Set constraints
pinkSquare.setConstraints([
    .bottom(view.bottomAnchor),
    .leading(view.leadingAnchor) + .constant(18)
])
```
<img src="https://jonathansack.io/swift/framework/jsconstraints/how_it_works/adding_constraints.png" alt="Pink square in Xcode simulator" height="500">
<br>

#### What Just Happened?
1. We constrained `pinkSquare` to our view’s bottom anchor
```swift
let bottomConstraint = .bottom(view.bottomAnchor)
```
<br>

2. We also constrained `pinkSquare` 18 points away from our view’s leading anchor
```swift
let leadingConstraint = .leading(view.leadingAnchor) + .constant(18)
```
<br>

#### Refactored Form
Let’s put it all back together, and we get:
```swift
// Add pink square to superview
view.addSubview(pinkSquare)

// Set constraints
pinkSquare.setConstraints([ bottomConstraint, leadingConstraint ])
```
> 💡 `constant` argument is optional and replaced by `0` if not provided
- - - -
<br>

### Reliative Constraints
```swift
indigoView.relWidth(pinkSquare.widthAnchor) * .multiplier(2)
```
<img src="https://jonathansack.io/swift/framework/jsconstraints/how_it_works/relative_constraints.png" alt="Indigo rectangle in Xcode simulator" height="500">
<br>

#### What Just Happened?
We set the width of `indigoView` to be twice ( 2 times) as big as  `pinkSquare` width.
> 💡 `multiplier` argument is optional and replaced by `1` if not provided
- - - -
<br>

### Sides
The `.side()` enum allows you to create square views quickly by setting both the view's width and height to the same value.
```swift
pinkSquare.setConstraints([ .sides(165) ])
```

#### What Just Happened?
We set both `width` and `height` constraints to `165`.
- - - -
<br>

### Centering a View
```swift
yellowCircle.centerIn(superview: self.view)
```
<img src="https://jonathansack.io/swift/framework/jsconstraints/how_it_works/centering_a_view.png" alt="Yellow circle in Xcode simulator" height="500">
<br>

#### What Just Happened?
We constrained `yellowCircle` in the **center** of the the screen.
- - - -
<br>


### Pin to Superview
```swift
indigoView.pinTo(superview: self.view, withPadding: 18)
```  
<img src="https://jonathansack.io/swift/framework/jsconstraints/how_it_works/pin_to_superview.png" alt="Indigo view pinned to superview in Xcode simulator" height="500">

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
var dynamicConstraints = yellowCircle.setConstraints([ .bottom(blueRectangle.topAnchor) ])
```
Here, a list of activated constraints of type `[NSLayoutConstraint]` is returned to us. We can save the result in `dynamicConstraints` variable.\
<br>

### 2. Update Constraints
```swift
// Deactivate optional constraints
dynamicConstraints.forEach { $0.isActive = false }

// Set new constraints
yellowCircle.centerIn(superview: self.view)
```
Here, we’re deactivating our optional constraints, then, adding new constraints
- - - -
<br>

### 3. Animation
<img src="https://jonathansack.io/swift/framework/jsconstraints/dynamic_constraints/animation.png" alt="Indigo view pinned to superview in Xcode simulator" height="500">

- - - -
<br>

## ✉️ Author
Jonathan Sack\
email@jonathansack.io
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
