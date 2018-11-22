//
//  CustomButton.swift
//  demo20
//
//  Created by NLS17-MAC on 11/20/18.
//  Copyright © 2018 NLS17-MAC. All rights reserved.
//

import UIKit

@IBDesignable
open class CustomButton: UIButton {
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        updateUI()
    }
    
    // MARK: - Update UI
    private func updateUI() {
        addTarget(self, action: #selector(clickAction(_:)), for: UIControl.Event.touchUpInside)
    }
    
    @objc private func clickAction(_ sender: UIButton)
    {
        print("sender Tag :\(sender.tag)")
    }
    
}
