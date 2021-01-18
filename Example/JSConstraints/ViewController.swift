//
//  ViewController.swift
//  JSConstraints
//
//  Created by jaysack on 12/11/2020.
//  Copyright (c) 2020 jaysack. All rights reserved.
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
        addSubviews()
        setSubviewsConstraints()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        animatePinkSquare()
    }

    private func addSubviews() {
        // Adding subviews
        [cyanRectangle, pinkSquare].forEach { view.addSubview($0) }
    }

    private func setSubviewsConstraints() {
        // Pink square constraints
        cyanRectangle.setConstraints([
            .top(view.safeAreaLayoutGuide.topAnchor),
            .leading(view.leadingAnchor) + .constant(12)
        ])
        
        // Pink square constraints
        dynamicConstraints = pinkSquare.setConstraints([
            .sides(115),
            .xCenter(view.centerXAnchor) + .constant(75),
            .bottom(view.safeAreaLayoutGuide.bottomAnchor) + .constant(8)
        ])
    }

    private func animatePinkSquare() {
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

// MARK: - CLASS View
class View: UIView {

    static func get(color: UIColor) -> View {
        let view = View()
        let contentView = View()
        contentView.backgroundColor = color
        contentView.pinTo(superview: view)
        return view
    }

    // Init
    required init?(coder: NSCoder) { return nil}
    override init(frame: CGRect) {
        super.init(frame: frame)
        clipsToBounds = false
        backgroundColor = .clear

        layer.shadowRadius = 4
        layer.shadowOpacity = 0.12
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 1.00, height: 1.50)
    }

    // Layout subviews
    override func layoutSubviews() {
        subviews.first?.clipsToBounds = true
        subviews.first?.layer.cornerRadius = 3
        super.layoutSubviews()
    }
}
