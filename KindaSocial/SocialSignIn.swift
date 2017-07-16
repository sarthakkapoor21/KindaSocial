//
//  SocialSignIn.swift
//  KindaSocial
//
//  Created by Sarthak Kapoor on 14/07/17.
//  Copyright © 2017 SK21. All rights reserved.
//

import UIKit

class SocialSignIn: UIButton {

    override func awakeFromNib() {
        super.awakeFromNib()
        
        layer.shadowColor = UIColor(red: SHADOW_GRAY, green: SHADOW_GRAY, blue: SHADOW_GRAY, alpha: 0.7).cgColor
        layer.shadowOffset = CGSize(width: 3.0, height: 3.0)
        layer.shadowRadius = 5.0
        layer.shadowOpacity = 0.9
        imageView?.layer.cornerRadius = 5.0
    }

}
