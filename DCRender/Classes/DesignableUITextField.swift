//
//  DesignableUITextField.swift
//  RandomColor
//
//  Created by NLS17-MAC on 11/14/18.
//  Copyright © 2018 NLS17-MAC. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
open class DesignableUITextField: UITextField {
    
    override open func leftViewRect(forBounds bounds: CGRect) -> CGRect {
        var textRect = super.leftViewRect(forBounds: bounds)
        textRect.origin.x += leftPadding
        return textRect
    }
    
    override open func rightViewRect(forBounds bounds: CGRect) -> CGRect {
        var textRect = super.rightViewRect(forBounds: bounds)
        textRect.origin.x -= rightPadding
        return textRect
    }
    
    @IBInspectable var leftImage: UIImage? {
        didSet {
            updateLeftView()
        }
    }
    
    @IBInspectable var rightImage: UIImage? {
        didSet {
            updateRightView()
        }
    }
    
    @IBInspectable var leftPadding: CGFloat = 0
    @IBInspectable var rightPadding: CGFloat = 0
    
    @IBInspectable var colorLeftView: UIColor = UIColor.lightGray {
        didSet {
            updateLeftView()
        }
    }
    
    @IBInspectable var colorRightView: UIColor = UIColor.lightGray {
        didSet {
            updateRightView()
        }
    }
    
    func updateRightView() {
        if let image = rightImage {
            rightViewMode = UITextField.ViewMode.always
            let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
            imageView.contentMode = .scaleAspectFit
            imageView.image = image
            imageView.tintColor = colorRightView
            rightView = imageView
        } else {
            rightViewMode = UITextField.ViewMode.never
            rightView = nil
        }
        
        attributedPlaceholder = NSAttributedString(string: placeholder != nil ?  placeholder! : "", attributes:[NSAttributedString.Key.foregroundColor: colorRightView])
    }
    
    func updateLeftView() {
        if let image = leftImage {
            leftViewMode = UITextField.ViewMode.always
            let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
            imageView.contentMode = .scaleAspectFit
            imageView.image = image
            imageView.tintColor = colorLeftView
            leftView = imageView
        } else {
            leftViewMode = UITextField.ViewMode.never
            leftView = nil
        }
        
        attributedPlaceholder = NSAttributedString(string: placeholder != nil ?  placeholder! : "", attributes:[NSAttributedString.Key.foregroundColor: colorLeftView])
    }
    
//    @IBInspectable var placeholderColor : UIColor? {
//        didSet {
//            let rawString = attributedPlaceholder?.string != nil ? attributedPlaceholder!.string : ""
//            let str = NSAttributedString(string: rawString, attributes: [NSAttributedString.Key.foregroundColor : placeholderColor!])
//            attributedPlaceholder = str
//        }
//    }
    
    @IBInspectable var cornerRadius : CGFloat = 0{
        didSet{
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = cornerRadius > 0
        }
    }
    
    @IBInspectable var borderWidth : CGFloat = 0 {
        didSet{
            layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var borderColor : UIColor? {
        didSet {
            layer.borderColor = borderColor?.cgColor
        }
    }
    
    @IBInspectable var bgColor : UIColor? {
        didSet {
            backgroundColor = bgColor
        }
    }
    
    //MARK:- Set Font Variation for all Devices
    
    @IBInspectable var fontVariant : String = "" {
        didSet{
            updateUI()
        }
    }
    
    @IBInspectable var fontSize : CGFloat = 0 {
        didSet{
            updateUI()
        }
    }
    
    var format:String = ""
    
    private func updateUI()
    {
        if UIDevice.current.model == "iPhone"
        {
            switch UIScreen.main.nativeBounds.height{
            case 960:
                return font = UIFont.init(name: fontVariant, size: fontSize) //.iPhones_4_4S
            case 1136:
                return font = UIFont.init(name: fontVariant, size: fontSize) //.iPhones_5_5s_5c_SE
            case 1334:
                return font = UIFont.init(name: fontVariant, size: fontSize)//.iPhones_6_6s_7_8
            case 1792:
                return font = UIFont.init(name: fontVariant, size: fontSize + 2)//.iPhone_XR
            case 1920, 2208:
                return font = UIFont.init(name: fontVariant, size: fontSize)//.iPhones_6Plus_6sPlus_7Plus_8Plus
            case 2436:
                return font = UIFont.init(name: fontVariant, size: fontSize)//.iPhones_X_XS
            case 2688:
                return font = UIFont.init(name: fontVariant, size: fontSize + 3)//.iPhone_XSMax
            default:
                return font = UIFont.init(name: fontVariant, size: fontSize)
            }
        }
        else{
            switch UIScreen.main.nativeBounds.height{
            case 2048:
                return font = UIFont.init(name: fontVariant, size: fontSize + 6) //9.7 Inch, 5thGen,6thGen,Air,Air2
            case 2224:
                return font = UIFont.init(name: fontVariant, size: fontSize + 8) //10.5 Inch
            case 2732:
                return font = UIFont.init(name: fontVariant, size: fontSize + 12) //12.9 Inch, 12.9 Inch 2ndGen
            default:
                return font = UIFont.init(name: fontVariant, size: fontSize + 6)
            }
        }
    }
}
