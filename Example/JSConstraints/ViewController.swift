//
//  ViewController.swift
//  JSConstraints
//
//  Created by Jonathan Sack.
//  Copyright © Jonathan Sack. All rights reserved.
//

import UIKit
import JSConstraints

class ViewController: UIViewController {

    var dynamicConstraints: [NSLayoutConstraint] = []

    lazy var pinkSquare: UIView = {
        return View(.systemPink)
    }()

    lazy var indigoView: UIView = {
        return View(.systemIndigo)
    }()

    lazy var yellowCircle: UIView = {
        let largeConfig = UIImage.SymbolConfiguration(textStyle: .largeTitle)
        let circle = UIImage(systemName: "circle.fill", withConfiguration: largeConfig)!.withRenderingMode(.alwaysTemplate)
        let imageView = UIImageView(image: circle)
        imageView.tintColor = .systemYellow
        return imageView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Setup UI
        view.backgroundColor = .systemGray6

        addingSubviews()
        setZPositions()

        square()
        directionalConstraints()
        relativeConstraints()
        centeringView()
//        pinToSuperview()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        dynamicConstraints.forEach { $0.isActive = false }
        [pinkSquare, indigoView].forEach { $0.centerIn(superview: view) }

        UIView.animate(withDuration: 0.28, delay: 3, usingSpringWithDamping: 0.63, initialSpringVelocity: 0) {
            self.view.layoutIfNeeded()
        }
    }

    private func addingSubviews() {
        [pinkSquare, indigoView, yellowCircle].forEach { view.addSubview($0) }
    }

    // MARK: - Z-Positions
    private func setZPositions() {
        yellowCircle.layer.zPosition = 3
        pinkSquare.layer.zPosition = 2
        indigoView.layer.zPosition = 1
    }

    // MARK: - Square
    private func square() {
        pinkSquare.setConstraints([ .square(190) ])
    }
    
    // MARK: - Directional Constraints
    private func directionalConstraints() {
        let pinkConstraints = pinkSquare.setConstraints([
            .leading(view.leadingAnchor),
            .bottom(view.bottomAnchor) + .constant(18)
        ])
        dynamicConstraints.append(contentsOf: pinkConstraints)
    }

    // MARK: - Directional Constraints
    private func relativeConstraints() {
        indigoView.setConstraints([
            .relWidth(view.widthAnchor) * .multiplier(0.4),
            .relHeight(pinkSquare.heightAnchor) * .multiplier(1.18)
        ])
        let optionalConstraints = indigoView.setConstraints([
            .top(view.topAnchor) + .constant(32),
            .trailing(view.trailingAnchor) + .constant(12)
        ])
        dynamicConstraints.append(contentsOf: optionalConstraints)
    }
    
    // MARK: - Centering View
    private func centeringView() {
        yellowCircle.setConstraints([ .square(75) ])
        yellowCircle.centerIn(superview: view)
    }
    
    // MARK: - Pin To Superview
    private func pinToSuperview() {
        indigoView.pinTo(superview: view, withPadding: 18)
    }
}

