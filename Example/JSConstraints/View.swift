//
//  View.swift
//  JSConstraints
//
//  Created by Jonathan Sack.
//  Copyright © Jonathan Sack. All rights reserved.
//

import UIKit
import JSConstraints

let cornerRadius: CGFloat = 4

class View: UIView {
    
    required init?(coder: NSCoder) { return nil }
    init(_ color: UIColor) {
        super.init(frame: .zero)
        backgroundColor = .clear
        getInnerView(color).pinTo(superview: self)
        addShadow()
    }
    
    private func getInnerView(_ color: UIColor) -> UIView {
        let view = UIView()
        view.backgroundColor = color
        view.layer.masksToBounds = true
        view.layer.cornerRadius = cornerRadius
        return view
    }

    private func addShadow() {
        clipsToBounds = false
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 1.15, height: 1.82)
        layer.shadowOpacity = 0.23
        layer.shadowRadius = 3
    }
}

