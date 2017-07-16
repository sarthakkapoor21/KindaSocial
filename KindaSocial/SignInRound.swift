//
//  SignInRound.swift
//  KindaSocial
//
//  Created by Sarthak Kapoor on 14/07/17.
//  Copyright © 2017 SK21. All rights reserved.
//

import UIKit

class SignInRound: UIButton {

    override func awakeFromNib() {
        super.awakeFromNib()
        
        layer.shadowColor = UIColor(red: SHADOW_GRAY, green: SHADOW_GRAY, blue: SHADOW_GRAY, alpha: 0.7).cgColor
        layer.shadowOffset = CGSize(width: 3.0, height: 3.0)
        layer.shadowRadius = 10.0
        layer.shadowOpacity = 0.9
        layer.cornerRadius = 4.0
    }
}
