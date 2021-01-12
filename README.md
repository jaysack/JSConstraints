# JSConstraints

[![Version](https://img.shields.io/cocoapods/v/JSConstraints.svg?style=flat)](https://cocoapods.org/pods/JSConstraints)
[![License](https://img.shields.io/cocoapods/l/JSConstraints.svg?style=flat)](https://cocoapods.org/pods/JSConstraints)
[![Platform](https://img.shields.io/cocoapods/p/JSConstraints.svg?style=flat)](https://cocoapods.org/pods/JSConstraints)

> A tiny Swift library written with only one thing in mind: *Blazin Fast Programmatic Constraints-Typing*

**JSConstraints** is a really small library extending `UIView` and `UIStackView` functionalities
- - - -
<br>

## Installation
JSConstraints is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'JSConstraints'
```
- - - -
<br>

## How It Works?

### Adding Constraints
```swift
// 1. Add to superview
view.addSubview(pinkSquare)

// 2. Set constraints
pinkSquare.setConstraints([
.bottom(view.safeAreaLayoutGuide.bottomAnchor),
.leading(view.leadingAnchor) + .constant(35)
])
```
<img src="JSConstraints/Demo/pink_square_image.png" alt="pink square in Xcode simulator" width="300">
<br>

#### What Just Happened?
1. We constrained `pinkSquare` to our view’s safe area layout guide’s bottom
```swift
let bottomConstraint = .bottom(view.safeAreaLayoutGuide.bottomAnchor) + .constant(18)
```
<br>

2. We also constrained `pinkSquare` **35 points** from our view’s leading anchor
```swift
let leadingConstraint = .leading(view.leadingAnchor) + .constant(35)
```
<br>

#### Refactored Form
Let’s put it all back together, and we get:
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

### Reliative Constraints
```swift
indigoView.relWidth(pinkSquare.widthAnchor) * .multiplier(2.15)
```
<img src="JSConstraints/Demo/indigo_rel_width_image.png" alt="relative width constraint" width="300">
<br>

#### What Just Happened?
We set the width of `indigoView` to be `2.15` times the one of `pinkSquare`.
<br>

#### Note
The multiplier is optional and replaced by `1` if not provided
<br>
- - - -

### Centering a View
```swift
yellowCircle.centerIn(superview: self.view)
```
<img src="JSConstraints/Demo/yellow_circle_image.png" alt="yellow circle in Xcode simulator" width="300">
<br>

#### What Just Happened?
We constrained `yellowCircle` in the **center** of the main view
- - - -
<br>


### Pin to Superview
```swift
let padding: CGFloat = 18
indigoView.pinTo(superview: self.view, adding: padding)
```  
<img src="JSConstraints/Demo/indigo_view_image.png" alt="yellow circle in Xcode simulator" width="300">
<br>

#### Note
```swift
/*
If you pass an instance of `UILayoutGuide`, Our `indigoView` will also be inserted automatically to `superview`
*/

otherView(layoutGuide: view.safeAreaLayoutGuide)
```
- - - -
<br>


## How About Dynamic Constraints?
**JSConstraints** methods always return the collection of successfully activated constraints. We can use it to toggle between  `active` and `inactive` state as follows.
<br>

### 1. Get Constraints Refs
```swift
// Get constraints refs returned
var dynamicConstraints: [NSLayoutConstraint] = yellowCircle.setConstraints([ .bottom(blueRectangle.topAnchor) ])
```
Here, a list of activated constraints of type `[NSLayoutConstraint]` is returned to us. We can save the result in the variable called `dynamicConstraints`.
<br>
<br>

### 2. Update Constraints
```swift
// Deactivate dynamic constraints
dynamicConstraints.forEach { $0.isActive = false }

// Set new constraints
yellowCircle.centerIn(superview: self.view)
```
Here, we’re setting up our constraints `isActive` property to `false`. Then, we add new constraints
- - - -
<br>

### Result
<img src="JSConstraints/Demo/dynamic_constraints.gif" alt="dynamic constraints in Xcode simulator" width="300">
<br>

## Author
Jonathan Sack
📨  jonathan.sack91@gmail.com
<br>

## License
JSConstraints is available under the MIT license. See the LICENSE file for more info.
