# JSConstraints

[![CI Status](https://img.shields.io/travis/jaysack/JSConstraints.svg?style=flat)](https://travis-ci.org/jaysack/JSConstraints)
[![Version](https://img.shields.io/cocoapods/v/JSConstraints.svg?style=flat)](https://cocoapods.org/pods/JSConstraints)
[![License](https://img.shields.io/cocoapods/l/JSConstraints.svg?style=flat)](https://cocoapods.org/pods/JSConstraints)
[![Platform](https://img.shields.io/cocoapods/p/JSConstraints.svg?style=flat)](https://cocoapods.org/pods/JSConstraints)

*Swift Fast Constraint-Typing*

## What’s JSConstraints?
**JSConstraints** is a really tiny library extending view’s layout functionalities

## Installation
JSConstraints is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'JSConstraints'
```

## How It Works?
### Install pod
To run the example project, clone the repo, and run `pod install` from the Example directory first.

### Add Constraints
<img src="JSConstraints/Images/pink_square_image.png" alt="pink square in Xcode simulator" width="300">

```swift
// Add pink square to superview
view.addSubview(pinkSquare)

// Set constraints
pinkSquare.setConstraints([
    .bottom(view.safeAreaLayoutGuide.bottomAnchor) + .constant(18),
    .leading(view.leadingAnchor) + .constant(35)
])
```
<br>

1. We’re adding `pinkSquare` to our view controller’s view
```swift
view.addSubview(pinkSquare)
```
<br>

2. We now constraint `pinkSquare` 18 point from our view’s **Safe Area Layout Guide’s bottom** with the following JSConstraint `enum`
```swift
let bottomConstraint = .bottom(view.safeAreaLayoutGuide.bottomAnchor)
```
<br>

3. We then, constraint `pinkSquare` again **15 points from view’s leading anchor**
```swift
let leadingConstraint = .leading(view.leadingAnchor) + .constant(15)
```
<br>

4. Let’s put it all together, and we get
```swift
// Add pink square to superview
view.addSubview(pinkSquare)

// Set constraints
pinkSquare.setConstraints([ bottomConstraint, leadingConstraint ])

/*
You can also write with JSConstraint enums directly with '.anchor() + .constant()' format
*/
```
- - - -
<br>

### Centering a View
<img src="JSConstraints/Images/yellow_circle_image.png" alt="yellow circle in Xcode simulator" width="300">

```swift
yellowCircle.centerIn(superview: self.view)
```
We’re centering  `yellowCircle` in our view controller’s view
> This method’s automatically insert `yellowCircle` in `superview`  
<br>

### Pin to Superview
<img src="JSConstraints/Images/indigo_view_image.png" alt="yellow circle in Xcode simulator" width="300">
```swift
let padding: CGFloat = 18
indigoView.pinTo(superview: self.view, adding: padding)
``` 
> This method’s automatically insert `indigoView` in `superview`.   
<br>

```swift
/*
If you pass an instance of `UILayoutGuide`, Our `indigoView` will also be inserted automatically to `superview`
*/

otherView(layoutGuide: view.safeAreaLayoutGuide)
```
<br>

## How About Animating Constraints?
**JSConstraints** methods always return the collection of successfully activated constraints.
We can use object references to toggle constraints between `active` and `inactive` state as follows

### 1. Create References to Constraints
```swift
// Hold constraints refs
var dynamicConstraints = [NSLayoutConstraint]()

// Save results
let yellowCircleDynamicConstraints = yellowCircle.setConstraints([ .bottom(blueRectangle.topAnchor) ])

// Append to refs holder
dynamicConstraints += yellowCircleDynamicConstraints
```
Here, we’re a list of activatedConstraints of type `[NSLayoutConstraint]` is return to us. We append the result to our array `dynamicConstraints`
<br>

### 2. Update Constraints
```swift
// Deactivate dynamic constraints
dynamicConstraints.forEach { $0.isActive = false }

// Add new constraints
yellowCircle.centerIn(superview: self.view)
```
Here’s we’re setting up `isActive` property to `false` and simply adding new constraints
<br>

### Result
<img src="JSConstraints/Images/dynamic_constraints.gif" alt="dynamic constraints in Xcode simulator" width="300">
<br>

## Author
Jonathan Sack
📨 jonathan.sack91@gmail.com
<br>

## License
JSConstraints is available under the MIT license. See the LICENSE file for more info.
