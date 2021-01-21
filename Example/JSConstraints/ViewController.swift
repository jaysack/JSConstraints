//
//  ViewController.swift
//  JSConstraints
//
//  Created by Jonathan Sack.
//  Copyright © Jonathan Sack. All rights reserved.
//

import UIKit
import JSConstraints

// MARK: - CLASS ViewController
class ViewController: UIViewController {

    // MARK: - Dynamic Constraints
    var dynamicConstraints: [NSLayoutConstraint] = []

    // MARK: - Pink Square
    lazy var pinkSquare: UIView = {
        let view = View.get(color: .systemPink)
        return view
    }()

    // MARK: - Cyan Rectangle
    lazy var cyanRectangle: UIView = {
        let view = View.get(color: .cyan)
        view.setConstraints([ .width(160), .height(380) ])
        return view
    }()

    // MARK: - View Did Load
    override func viewDidLoad() {
        super.viewDidLoad()

        // Add subviews
        [cyanRectangle, pinkSquare].forEach { view.addSubview($0) }

        // Set rectangle constraints (REQUIRED CONSTRAINTS)
        cyanRectangle.setConstraints([
            .top(view.safeAreaLayoutGuide.topAnchor),
            .leading(view.leadingAnchor) + .constant(12)
        ])
        
        // Set square constraints (DYNAMIC CONSTRAINTS)
        dynamicConstraints = pinkSquare.setConstraints([
            .sides(115),
            .xCenter(view.centerXAnchor) + .constant(75),
            .bottom(view.safeAreaLayoutGuide.bottomAnchor) + .constant(8)
        ])
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        // ANIMATE PINK SQUARE:

        // 1. Disable constraints
        dynamicConstraints.forEach { $0.isActive = false }
        
        // 2. Add new constraints
        pinkSquare.setConstraints([
            .bottom(cyanRectangle.bottomAnchor) - .constant(30),
            .leading(cyanRectangle.trailingAnchor) - .constant(30),
            .relHeight(cyanRectangle.widthAnchor),
            .relWidth(view.widthAnchor) * .multiplier(0.3)
        ])
        
        // 3. Animate everything
        UIView.animate(withDuration: 0.45, delay: 1, usingSpringWithDamping: 0.4, initialSpringVelocity: 0) { [weak self] in
            self?.view.layoutIfNeeded()
        }
    }
}
