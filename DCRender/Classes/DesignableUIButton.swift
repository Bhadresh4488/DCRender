//
//  DesignableUIButton.swift
//  Demo
//
//  Created by NLS17-MAC on 11/14/18.
//  Copyright © 2018 NLS17-MAC. All rights reserved.
//

import UIKit

@IBDesignable
open class DesignableUIButton: UIButton {

    @IBInspectable var cornerRadius : CGFloat = 0{
        didSet{
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = cornerRadius > 0
            updateUI()
        }
    }
    
    @IBInspectable var borderWidth : CGFloat = 0 {
        didSet{
            layer.borderWidth = borderWidth
            updateUI()
        }
    }
    
    /// Renders vertical gradient if true else horizontal
    @IBInspectable public var verticalGradient: Bool = true {
        didSet {
            updateUI()
        }
    }
    
    @IBInspectable var borderColor : UIColor? {
        didSet {
            layer.borderColor = borderColor?.cgColor
            updateUI()
        }
    }
    
    /// Start color of the gradient
    @IBInspectable public var startColor: UIColor = .clear {
        didSet {
            updateUI()
        }
    }
    
    /// End color of the gradient
    @IBInspectable public var endColor: UIColor = .clear {
        didSet {
            updateUI()
        }
    }
    
    private var gradientlayer = CAGradientLayer()
    
    // MARK: - init methods
    override public init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupUI()
    }
    
    // MARK: - Layout
    override open func layoutSubviews() {
        super.layoutSubviews()
        updateFrame()
    }
    
    // MARK: - UI Setup
    private func setupUI() {
        gradientlayer = CAGradientLayer()
        updateUI()
        layer.addSublayer(gradientlayer)
    }
    
    // MARK: - Update frame
    private func updateFrame() {
        gradientlayer.frame = bounds
    }
    
    // MARK: - Update UI
    private func updateUI() {
        gradientlayer.colors = [startColor.cgColor, endColor.cgColor]
        if verticalGradient {
            gradientlayer.startPoint = CGPoint(x: 0, y: 0)
            gradientlayer.endPoint = CGPoint(x: 0, y: 1)
        } else {
            gradientlayer.startPoint = CGPoint(x: 0, y: 0)
            gradientlayer.endPoint = CGPoint(x: 1, y: 0)
        }
        layer.cornerRadius = cornerRadius
        layer.borderWidth = borderWidth
        layer.borderColor = borderColor?.cgColor ?? tintColor.cgColor
        if cornerRadius > 0 {
            layer.masksToBounds = true
        }
        updateFrame()
    }
}
