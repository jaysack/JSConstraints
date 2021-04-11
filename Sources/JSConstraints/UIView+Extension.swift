//
//  UIView+Extension.swift
//  JSConstraintsSample
//
//  Created by Jonathan Sack
//

#if canImport(UIKit)
import UIKit

// MARK: - Custom Constraint Operators
// Custom Operator => i.e: .top(view.topAnchor) + .constant(18)
public func + (lhs: JSConstraint, rhs: JSConstraint) -> JSConstraint {
    return JSConstraint.arithmeticConstructor(lhs, rhs.constantRawValue)
}

// Custom Operator => i.e: .top(view.topAnchor) - .constant(18)
public func - (lhs: JSConstraint, rhs: JSConstraint) -> JSConstraint {
    return JSConstraint.arithmeticConstructor(lhs, -rhs.constantRawValue)
}

// Custom Operator => i.e: .top(view.widthAnchor) * .multiplier(0.5)
public func * (lhs: JSConstraint, rhs: JSConstraint) -> JSConstraint {
    return JSConstraint.multiplierConstructor(lhs, rhs.constantRawValue)
}

public extension UIView {
    
    // MARK: - Pin to Superview
    /**
         Pin child view to superview's edges minus padding value provided as argument.
         The method returns all activated constraints
         
         - parameter superview: self's parent
         - parameter padding: horizontal and vertical padding
         
         - returns: An array of activated constraints
    */
    @discardableResult
    func pinTo(superview: UIView, padding: CGFloat = 0) -> [NSLayoutConstraint] {
        return pinTo(superview: superview, xPadding: padding, yPadding: padding)
    }
/**
     Pin child view to superview's edges minus padding value provided as argument.
     The method returns all activated constraints
     
     - parameter superview: self's parent
     - parameter xPadding: horizontal padding
     - parameter yPadding: veritical padding
     
     - returns: An array of activated constraints
*/
    @discardableResult
    func pinTo(superview: UIView, xPadding: CGFloat = 0, yPadding: CGFloat = 0) -> [NSLayoutConstraint] {
        superview.addSubview(self)
        return self.setConstraints([
            .top(superview.topAnchor) + .constant(yPadding),
            .leading(superview.leadingAnchor) + .constant(xPadding),
            .bottom(superview.bottomAnchor) + .constant(yPadding),
            .trailing(superview.trailingAnchor) + .constant(xPadding)
        ])
    }

    // MARK: - Pin to Superview safe area layout guide
    /**
         Pin child view to superview's layout guide's edges minus padding value provided as argument.
         The method returns all activated constraints
         
         - parameter layoutGuide: self's parent's layout guide
         - parameter padding: horizontal and veritcal padding
         
         - returns: An array of activated constraints
    */
    @discardableResult
    func pinTo(layoutGuide: UILayoutGuide, padding: CGFloat = 0) -> [NSLayoutConstraint] {
        return pinTo(layoutGuide: layoutGuide, xPadding: padding, yPadding: padding)
    }
    /**
         Pin child view to superview's layout guide's edges minus padding value provided as argument.
         The method returns all activated constraints
         
         - parameter layoutGuide: self's parent's layout guide
         - parameter xPadding: horizontal padding
         - parameter yPadding: veritical padding
         
         - returns: An array of activated constraints
    */
    @discardableResult
    func pinTo(layoutGuide: UILayoutGuide, xPadding: CGFloat = 0, yPadding: CGFloat = 0) -> [NSLayoutConstraint] {

        guard #available(iOS 11.0, *) else { return [] }
        guard let superview = layoutGuide.owningView else { return [] }
        
        superview.addSubview(self)
        return self.setConstraints([
            .top(superview.safeAreaLayoutGuide.topAnchor) + .constant(yPadding),
            .leading(superview.safeAreaLayoutGuide.leadingAnchor) + .constant(xPadding),
            .bottom(superview.safeAreaLayoutGuide.bottomAnchor) + .constant(yPadding),
            .trailing(superview.safeAreaLayoutGuide.trailingAnchor) + .constant(xPadding)
        ])
    }

    // MARK: - Center in Superview
    /**
         Center child view in superview's
         The method returns all activated constraints
         
         - parameter superview: self's parent's
         - parameter xOffset: horizontal offset
         - parameter yOffset: veritical offset
         
         - returns: An array of related activated constraints (horizontal and vertical center constraints)
    */
    @discardableResult
    func centerIn(superview: UIView, xOffset: CGFloat = 0, yOffset: CGFloat = 0) -> [NSLayoutConstraint] {
        superview.addSubview(self)
        return self.setConstraints([
            .xCenter(superview.centerXAnchor) + .constant(xOffset),
            .yCenter(superview.centerYAnchor) + .constant(yOffset)
        ])
    }

    /**
     Shortcut method for `setConstraints(_ constraints: [JSConstraint])`
     */
    @discardableResult
    func 🔗(_ constraints: [JSConstraint]) -> [NSLayoutConstraint] {
        return setConstraints(constraints)
    }

    // MARK: - Set Constraints
    /**
     Set programmatic constraints
     The method returns all activated constraints
     
     The shortcut for this method is `🔗(_ constraints: [JSConstraint])`
     
     - parameter constraints: array of constraints
     
     - returns: An array of activated constraints
     */
    @discardableResult
    func setConstraints(_ constraints: [JSConstraint]) -> [NSLayoutConstraint] {
        
        // Enable Auto Layout
        self.translatesAutoresizingMaskIntoConstraints = false

        // Actived constraints
        var activedConstraints = [NSLayoutConstraint]()

        // Simple constraints only
        for constraint in constraints {
            switch constraint {
            case .top(let topAnchor):
                let constraint = self.topAnchor.constraint(equalTo: topAnchor)
                activedConstraints.append(activated(constraint))
                
            case .topLessThanOrEqualTo(let topAnchor):
                let constraint = self.topAnchor.constraint(lessThanOrEqualTo: topAnchor)
                activedConstraints.append(activated(constraint))
                
            case .topGreaterThanOrEqualTo(let topAnchor):
                let constraint = self.topAnchor.constraint(greaterThanOrEqualTo: topAnchor)
                activedConstraints.append(activated(constraint))

            case .leading(let leadingAnchor):
                let constraint = self.leadingAnchor.constraint(equalTo: leadingAnchor)
                activedConstraints.append(activated(constraint))
                
            case .leadingLessThanOrEqualTo(let leadingAnchor):
                let constraint = self.leadingAnchor.constraint(lessThanOrEqualTo: leadingAnchor)
                activedConstraints.append(activated(constraint))
                
            case .leadingGreaterThanOrEqualTo(let leadingAnchor):
                let constraint = self.leadingAnchor.constraint(greaterThanOrEqualTo: leadingAnchor)
                activedConstraints.append(activated(constraint))

            case .bottom(let bottomAnchor):
                let constraint = self.bottomAnchor.constraint(equalTo: bottomAnchor)
                activedConstraints.append(activated(constraint))
                
            case .bottomLessThanOrEqualTo(let bottomAnchor):
                let constraint = self.bottomAnchor.constraint(lessThanOrEqualTo: bottomAnchor)
                activedConstraints.append(activated(constraint))
                
            case .bottomGreaterThanOrEqualTo(let bottomAnchor):
                let constraint = self.bottomAnchor.constraint(greaterThanOrEqualTo: bottomAnchor)
                activedConstraints.append(activated(constraint))

            case .trailing(let trailingAnchor):
                let constraint = self.trailingAnchor.constraint(equalTo: trailingAnchor)
                activedConstraints.append(activated(constraint))
                
            case .trailingLessThanOrEqualTo(let trailingAnchor):
                let constraint = self.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor)
                activedConstraints.append(activated(constraint))
                
            case .trailingGreaterThanOrEqualTo(let trailingAnchor):
                let constraint = self.trailingAnchor.constraint(greaterThanOrEqualTo: trailingAnchor)
                activedConstraints.append(activated(constraint))
                
            case .xCenter(let centerXAnchor):
                let constraint = self.centerXAnchor.constraint(equalTo: centerXAnchor)
                activedConstraints.append(activated(constraint))

            case .yCenter(let centerYAnchor):
                let constraint = self.centerYAnchor.constraint(equalTo: centerYAnchor)
                activedConstraints.append(activated(constraint))

            case .width(let constant):
                let constraint = self.widthAnchor.constraint(equalToConstant: constant)
                activedConstraints.append(activated(constraint))
                
            case .widthLessThanOrEqualTo(let constant):
                let constraint = self.widthAnchor.constraint(lessThanOrEqualToConstant: constant)
                activedConstraints.append(activated(constraint))
                
            case .widthGreaterThanOrEqualTo(let constant):
                let constraint = self.widthAnchor.constraint(greaterThanOrEqualToConstant: constant)
                activedConstraints.append(activated(constraint))

            case .height(let constant):
                let constraint = self.heightAnchor.constraint(equalToConstant: constant)
                activedConstraints.append(activated(constraint))
                
            case .heightLessThanOrEqualTo(let constant):
                let constraint = self.heightAnchor.constraint(lessThanOrEqualToConstant: constant)
                activedConstraints.append(activated(constraint))
                
            case .heightGreaterThanOrEqualTo(let constant):
                let constraint = self.heightAnchor.constraint(greaterThanOrEqualToConstant: constant)
                activedConstraints.append(activated(constraint))

            case .squared(let constant):
                let widthConstraint = self.widthAnchor.constraint(equalToConstant: constant)
                let heightConstraint = self.heightAnchor.constraint(equalToConstant: constant)
                [widthConstraint, heightConstraint].forEach { activedConstraints.append(activated($0)) }

            case .relWidth(let anchor):
                let constraint = self.widthAnchor.constraint(equalTo: anchor)
                activedConstraints.append(activated(constraint))

            case .relHeight(let anchor):
                let constraint = self.heightAnchor.constraint(equalTo: anchor)
                activedConstraints.append(activated(constraint))

            case .relSquared(let anchor):
                let widthConstraint = self.widthAnchor.constraint(equalTo: anchor)
                let heightConstraint = self.heightAnchor.constraint(equalTo: anchor)
                [widthConstraint, heightConstraint].forEach { activedConstraints.append(activated($0)) }

            case .ratio(let multiplier):
                let widthConstraint = self.widthAnchor.constraint(equalTo: heightAnchor, multiplier: multiplier)
                let heightConstraint = self.heightAnchor.constraint(equalTo: widthAnchor, multiplier: 1/multiplier)
                [widthConstraint, heightConstraint].forEach { activedConstraints.append(activated($0)) }

            // Constant & Multiplier
            case .constant, .multiplier:
                break

            // Constraints and multiplier values
            case .multiplierConstructor(let anchor, let multiplier):
                switch anchor {
                case .relWidth(let widthAnchor):
                    let constraint = self.widthAnchor.constraint(equalTo: widthAnchor, multiplier: multiplier)
                    activedConstraints.append(activated(constraint))

                case .relHeight(let heightAnchor):
                    let constraint = self.heightAnchor.constraint(equalTo: heightAnchor, multiplier: multiplier)
                    activedConstraints.append(activated(constraint))
                    
                case .relSquared(let anchor):
                    let widthConstraint = self.widthAnchor.constraint(equalTo: anchor, multiplier: multiplier)
                    let heightConstraint = self.heightAnchor.constraint(equalTo: anchor, multiplier: multiplier)
                    [widthConstraint, heightConstraint].forEach { activedConstraints.append(activated($0)) }
                    
                default:
                    break
                }

            // Constraints and constant values
            case .arithmeticConstructor(let anchor, let constant):
                switch anchor {
                case .top(let topAnchor):
                    let constraint = self.topAnchor.constraint(equalTo: topAnchor, constant: constant)
                    activedConstraints.append(activated(constraint))
                    
                case .topLessThanOrEqualTo(let topAnchor):
                    let constraint = self.topAnchor.constraint(lessThanOrEqualTo: topAnchor, constant: constant)
                    activedConstraints.append(activated(constraint))
                    
                case .topGreaterThanOrEqualTo(let topAnchor):
                    let constraint = self.topAnchor.constraint(greaterThanOrEqualTo: topAnchor, constant: constant)
                    activedConstraints.append(activated(constraint))

                case .leading(let leadingAnchor):
                    let constraint = self.leadingAnchor.constraint(equalTo: leadingAnchor, constant: constant)
                    activedConstraints.append(activated(constraint))
                    
                case .leadingLessThanOrEqualTo(let leadingAnchor):
                    let constraint = self.leadingAnchor.constraint(lessThanOrEqualTo: leadingAnchor, constant: constant)
                    activedConstraints.append(activated(constraint))
                    
                case .leadingGreaterThanOrEqualTo(let leadingAnchor):
                    let constraint = self.leadingAnchor.constraint(greaterThanOrEqualTo: leadingAnchor, constant: constant)
                    activedConstraints.append(activated(constraint))
                    
                case .bottom(let bottomAnchor):
                    let constraint = self.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -constant)
                    activedConstraints.append(activated(constraint))
                    
                case .bottomLessThanOrEqualTo(let bottomAnchor):
                    let constraint = self.bottomAnchor.constraint(lessThanOrEqualTo: bottomAnchor, constant: -constant)
                    activedConstraints.append(activated(constraint))
                    
                case .bottomGreaterThanOrEqualTo(let bottomAnchor):
                    let constraint = self.bottomAnchor.constraint(greaterThanOrEqualTo: bottomAnchor, constant: -constant)
                    activedConstraints.append(activated(constraint))
                    
                case .trailing(let trailingAnchor):
                    let constraint = self.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -constant)
                    activedConstraints.append(activated(constraint))
                    
                case .trailingLessThanOrEqualTo(let trailingAnchor):
                    let constraint = self.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor, constant: -constant)
                    activedConstraints.append(activated(constraint))
                    
                case .trailingGreaterThanOrEqualTo(let trailingAnchor):
                    let constraint = self.trailingAnchor.constraint(greaterThanOrEqualTo: trailingAnchor, constant: -constant)
                    activedConstraints.append(activated(constraint))
                    
                case .xCenter(let centerXAnchor):
                    let constraint = self.centerXAnchor.constraint(equalTo: centerXAnchor, constant: constant)
                    activedConstraints.append(activated(constraint))
                    
                case .yCenter(let centerYAnchor):
                    let constraint = self.centerYAnchor.constraint(equalTo: centerYAnchor, constant: constant)
                    activedConstraints.append(activated(constraint))
                    
                default:
                    break
                }
            }
        }

        return activedConstraints
    }

    // MARK: - Helper Method
    private func activated(_ constraint: NSLayoutConstraint) -> NSLayoutConstraint {
        constraint.isActive = true
        return constraint
    }
}

// MARK: 🔀 Constraint
public enum JSConstraint {
    // Directional constraints
    case top(NSLayoutAnchor<NSLayoutYAxisAnchor>)
    case topLessThanOrEqualTo(NSLayoutAnchor<NSLayoutYAxisAnchor>)
    case topGreaterThanOrEqualTo(NSLayoutAnchor<NSLayoutYAxisAnchor>)
    case leading(NSLayoutAnchor<NSLayoutXAxisAnchor>)
    case leadingLessThanOrEqualTo(NSLayoutAnchor<NSLayoutXAxisAnchor>)
    case leadingGreaterThanOrEqualTo(NSLayoutAnchor<NSLayoutXAxisAnchor>)
    case bottom(NSLayoutAnchor<NSLayoutYAxisAnchor>)
    case bottomLessThanOrEqualTo(NSLayoutAnchor<NSLayoutYAxisAnchor>)
    case bottomGreaterThanOrEqualTo(NSLayoutAnchor<NSLayoutYAxisAnchor>)
    case trailing(NSLayoutAnchor<NSLayoutXAxisAnchor>)
    case trailingLessThanOrEqualTo(NSLayoutAnchor<NSLayoutXAxisAnchor>)
    case trailingGreaterThanOrEqualTo(NSLayoutAnchor<NSLayoutXAxisAnchor>)
    case xCenter(NSLayoutAnchor<NSLayoutXAxisAnchor>)
    case yCenter(NSLayoutAnchor<NSLayoutYAxisAnchor>)

    // Absolute constraints
    case width(CGFloat)
    case widthLessThanOrEqualTo(CGFloat)
    case widthGreaterThanOrEqualTo(CGFloat)
    case height(CGFloat)
    case heightLessThanOrEqualTo(CGFloat)
    case heightGreaterThanOrEqualTo(CGFloat)
    case squared(CGFloat)

    // Relative constraints
    case relWidth(NSLayoutDimension)
    case relHeight(NSLayoutDimension)
    case relSquared(NSLayoutDimension)
    case ratio(CGFloat)

    // Utilities
    case constant(CGFloat)
    case multiplier(CGFloat)
    indirect case arithmeticConstructor(JSConstraint, CGFloat)
    indirect case multiplierConstructor(JSConstraint, CGFloat)

    var constantRawValue: CGFloat {
        switch self {
        case .constant(let value),
             .multiplier(let value),
             .width(let value),
             .widthLessThanOrEqualTo(let value),
             .widthGreaterThanOrEqualTo(let value),
             .height(let value),
             .heightLessThanOrEqualTo(let value),
             .heightGreaterThanOrEqualTo(let value),
             .squared(let value):
            return value
        default:
            return 0
        }
    }
}
#endif
