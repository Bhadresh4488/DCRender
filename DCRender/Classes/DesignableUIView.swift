//
//  DesignableUIView.swift
//  Demo
//
//  Created by NLS17-MAC on 11/15/18.
//  Copyright © 2018 NLS17-MAC. All rights reserved.
//

import UIKit

@IBDesignable
open class DesignableUIView: UIView {

    @IBInspectable var circle: Bool = false{
        didSet{
            setupUI()
        }
    }
    
    @IBInspectable var cornerRadius : CGFloat = 0{
        didSet{
            setupUI()
        }
    }
    
    @IBInspectable var borderWidth : CGFloat = 0{
        didSet{
            setupUI()
        }
    }
    
    @IBInspectable var borderColor : UIColor?{
        didSet{
            setupUI()
        }
    }
    
    @IBInspectable var fillColor:UIColor? {
        didSet{
            setupUI()
        }
    }
    
    @IBInspectable var shadowColor:UIColor = .clear {
        didSet{
            
            setupUI()
        }
    }
    
    @IBInspectable var shadowRadius: CGFloat = 0.0 {
        didSet{
            setupUI()
        }
    }
    
    @IBInspectable var shadowOpacity: CGFloat = 1.0 {
        didSet{
            setupUI()
        }
    }
    
    @IBInspectable var shadowOffset: CGSize {
        set {
            layer.shadowOffset = newValue
            setupUI()
        }
        get {
            return layer.shadowOffset
        }
    }
    
    private var imageView = UIImageView()
    private var shadowLayer = CAShapeLayer()
    
    @IBInspectable var fillImage: UIImage? {
        didSet{
            setupUI()
        }
    }
    
    @IBInspectable var leading: CGFloat = 10{
        didSet{
            updateFrame()
            setupUI()
        }
    }
    
    // MARK: - UI Setup
    private func setupUI() {

        imageView.image = fillImage
        imageView.contentMode = .scaleAspectFit
        addSubview(imageView)

        if circle
        {
            layer.cornerRadius = bounds.size.height / 2
        }
        else{
            layer.cornerRadius = cornerRadius
        }
        
        shadowLayer.path = UIBezierPath(roundedRect: bounds, cornerRadius: circle ? bounds.size.height / 2 : cornerRadius).cgPath
        shadowLayer.fillColor = fillColor?.cgColor
        
        layer.borderColor = borderColor?.cgColor
        
        layer.borderWidth = borderWidth
        
        layer.shadowColor = shadowColor.cgColor
        shadowLayer.shadowPath = shadowLayer.path
        layer.shadowOffset = shadowOffset
        layer.shadowRadius = shadowRadius
        layer.shadowOpacity = Float(shadowOpacity)
        layer.insertSublayer(shadowLayer, at: 0)
        updateFrame()
    }
    
    private func updateFrame()
    {
        imageView.frame = CGRect(x: leading, y: leading, width: bounds.size.width - (leading * 2), height: bounds.size.height - (leading * 2))
    }
    
}
