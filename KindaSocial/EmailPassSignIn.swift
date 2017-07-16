//
//  EmailPassSignIn.swift
//  KindaSocial
//
//  Created by Sarthak Kapoor on 14/07/17.
//  Copyright © 2017 SK21. All rights reserved.
//

import UIKit

class EmailPassSignIn: UITextField {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        layer.borderColor = UIColor(red: SHADOW_GRAY, green: SHADOW_GRAY, blue: SHADOW_GRAY, alpha: 0.2).cgColor
        layer.borderWidth = 1.0
        layer.cornerRadius = 5.0
    }

    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: 10, dy: 0)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: 10, dy: 0)
    }
}
