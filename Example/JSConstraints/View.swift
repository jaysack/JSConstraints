//
//  View.swift
//  JSConstraints
//
//  Created by Jonathan Sack.
//  Copyright © Jonathan Sack. All rights reserved.
//

import UIKit

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
