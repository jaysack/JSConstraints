//
//  UIView+Extension.swift
//  JSConstraintsSample
//
//  Created by Jonathan Sack
//

import UIKit

// MARK: - Custom Constraint Operators
// Custom Operator => i.e: .top(view.topAnchor) + .constant(18)
public func + (lhs: JSConstraint, rhs: JSConstraint) -> JSConstraint {
    return JSConstraint.constructor(lhs, rhs.constantRawValue)
}

// Custom Operator => i.e: .top(view.topAnchor) - .constant(18)
public func - (lhs: JSConstraint, rhs: JSConstraint) -> JSConstraint {
    return JSConstraint.constructor(lhs, -rhs.constantRawValue)
}

public extension UIView {
    
    // MARK: - Pin to Superview
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
    @discardableResult
    func centerIn(superview: UIView, xOffset: CGFloat = 0, yOffset: CGFloat = 0) -> [NSLayoutConstraint] {
        superview.addSubview(self)
        return self.setConstraints([
            .xCenter(superview.centerXAnchor) + .constant(xOffset),
            .yCenter(superview.centerYAnchor) + .constant(yOffset)
        ])
    }
    
    // MARK: - Set size
    @discardableResult
    func setSize(width: CGFloat? = nil, height: CGFloat? = nil) -> [NSLayoutConstraint] {
        
        // Enable Auto Layout
        self.translatesAutoresizingMaskIntoConstraints = false

        // Actived constraints
        var activedConstraints = [NSLayoutConstraint]()
        
        if let width = width {
            let constraint = self.widthAnchor.constraint(equalToConstant: width)
            activedConstraints.append(activated(constraint))
        }
        if let height = height {
            let constraint = self.heightAnchor.constraint(equalToConstant: height)
            activedConstraints.append(activated(constraint))
        }

        return activedConstraints
    }

    // MARK: - Set Constraints
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

            case .leading(let leadingAnchor):
                let constraint = self.leadingAnchor.constraint(equalTo: leadingAnchor)
                activedConstraints.append(activated(constraint))

            case .bottom(let bottomAnchor):
                let constraint = self.bottomAnchor.constraint(equalTo: bottomAnchor)
                activedConstraints.append(activated(constraint))

            case .trailing(let trailingAnchor):
                let constraint = self.trailingAnchor.constraint(equalTo: trailingAnchor)
                activedConstraints.append(activated(constraint))
                
            case .xCenter(let centerXAnchor):
                let constraint = self.centerXAnchor.constraint(equalTo: centerXAnchor)
                activedConstraints.append(activated(constraint))

            case .yCenter(let centerYAnchor):
                let constraint = self.centerYAnchor.constraint(equalTo: centerYAnchor)
                activedConstraints.append(activated(constraint))

            case .constant(_):
                break

            // Constraints and constant values
            case .constructor(let anchor, let constant):
                switch anchor {
                case .top(let topAnchor):
                    let constraint = self.topAnchor.constraint(equalTo: topAnchor, constant: constant)
                    activedConstraints.append(activated(constraint))

                case .leading(let leadingAnchor):
                    let constraint = self.leadingAnchor.constraint(equalTo: leadingAnchor, constant: constant)
                    activedConstraints.append(activated(constraint))
                    
                case .bottom(let bottomAnchor):
                    let constraint = self.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -constant)
                    activedConstraints.append(activated(constraint))
                    
                case .trailing(let trailingAnchor):
                    let constraint = self.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -constant)
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
    case top(NSLayoutAnchor<NSLayoutYAxisAnchor>)
    case leading(NSLayoutAnchor<NSLayoutXAxisAnchor>)
    case bottom(NSLayoutAnchor<NSLayoutYAxisAnchor>)
    case trailing(NSLayoutAnchor<NSLayoutXAxisAnchor>)
    case xCenter(NSLayoutAnchor<NSLayoutXAxisAnchor>)
    case yCenter(NSLayoutAnchor<NSLayoutYAxisAnchor>)
    case constant(CGFloat)
    indirect case constructor(JSConstraint, CGFloat)

    var constantRawValue: CGFloat {
        switch self {
        case .constant(let value):
            return value
        default:
            return 0
        }
    }
}
