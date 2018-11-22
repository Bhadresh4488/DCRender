//
//  DesignableUITextView.swift
//  DesignableDemo
//
//  Created by NLS17-MAC on 11/21/18.
//  Copyright © 2018 NLS17-MAC. All rights reserved.
//

import UIKit

@IBDesignable
open class DesignableUITextView: UITextView , UITextViewDelegate
{
    private var placeholderLabel = UILabel()
    
    @IBInspectable var placeHolderText : String = ""{
        didSet{
            updateUI()
        }
    }
    
    @IBInspectable var placeHolderColor:UIColor?{
        didSet{
            placeholderLabel.textColor = placeHolderColor
            updateUI()
        }
    }
    
    @IBInspectable var cornerRadius:CGFloat = 0{
        didSet{
            updateUI()
        }
    }
    
    @IBInspectable var borderColor:UIColor?{
        didSet{
            updateUI()
        }
    }
    
    @IBInspectable var borderWidth:CGFloat = 1{
        didSet{
            updateUI()
        }
    }
    
    private func updateUI()
    {
        delegate = self
        placeholderLabel.text = placeHolderText
        placeholderLabel.font = UIFont.italicSystemFont(ofSize: (font?.pointSize)!)
        placeholderLabel.sizeToFit()
        addSubview(placeholderLabel)
        placeholderLabel.frame.origin = CGPoint(x: 5, y: (font?.pointSize)! / 2)
        placeholderLabel.textColor = placeHolderColor
        placeholderLabel.isHidden = !text.isEmpty
        layer.cornerRadius = cornerRadius
        layer.borderColor = borderColor?.cgColor
        layer.borderWidth = borderWidth
    }

    private func textViewDidChange(_ textView: UITextView) {
        placeholderLabel.isHidden = !textView.text.isEmpty
    }
    
}
