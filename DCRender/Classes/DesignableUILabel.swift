//
//  DesignableUILabel.swift
//  DesignableDemo
//
//  Created by NLS17-MAC on 11/21/18.
//  Copyright © 2018 NLS17-MAC. All rights reserved.
//

import UIKit

@IBDesignable
open class DesignableUILabel: UILabel {
    
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
  
    private func updateUI()
    {
        if UIDevice.current.model == "iPhone"
        {
            switch UIScreen.main.nativeBounds.height{
            case 960:
                return self.font = UIFont.init(name: fontVariant, size: fontSize) //.iPhones_4_4S
            case 1136:
                return self.font = UIFont.init(name: fontVariant, size: fontSize) //.iPhones_5_5s_5c_SE
            case 1334:
                return self.font = UIFont.init(name: fontVariant, size: fontSize)//.iPhones_6_6s_7_8
            case 1792:
                return self.font = UIFont.init(name: fontVariant, size: fontSize + 2)//.iPhone_XR
            case 1920, 2208:
                return self.font = UIFont.init(name: fontVariant, size: fontSize)//.iPhones_6Plus_6sPlus_7Plus_8Plus
            case 2436:
                return self.font = UIFont.init(name: fontVariant, size: fontSize)//.iPhones_X_XS
            case 2688:
                return self.font = UIFont.init(name: fontVariant, size: fontSize + 3)//.iPhone_XSMax
            default:
                return self.font = UIFont.init(name: fontVariant, size: fontSize)
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
