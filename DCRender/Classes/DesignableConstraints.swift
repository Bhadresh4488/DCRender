//
//  DesignableConstraints.swift
//  DesignableDemo
//
//  Created by NLS17-MAC on 11/21/18.
//  Copyright © 2018 NLS17-MAC. All rights reserved.
//

import UIKit

@IBDesignable
open class DesignableConstraints: NSLayoutConstraint {

    @IBInspectable var barHeight:CGFloat = 0{
        didSet{
            updateConstant()
        }
    }
    
    required public override init() {
        super.init()
        updateConstant()
    }

    private func updateConstant() {
        
        if UIDevice.current.model == "iPhone"
        {
            switch UIScreen.main.nativeBounds.height{
            case 960:
                return self.constant = barHeight //.iPhones_4_4S
            case 1136:
                return self.constant = barHeight //.iPhones_5_5s_5c_SE
            case 1334:
                return self.constant = barHeight//.iPhones_6_6s_7_8
            case 1792:
                return self.constant = 80//.iPhone_XR
            case 1920, 2208:
                return self.constant = barHeight//.iPhones_6Plus_6sPlus_7Plus_8Plus
            case 2436:
                return self.constant = 80//.iPhones_X_XS
            case 2688:
                return self.constant = 80//.iPhone_XSMax
            default:
                return self.constant = barHeight
            }
        }
        else{
            self.constant = barHeight
        }
    }
    
}
