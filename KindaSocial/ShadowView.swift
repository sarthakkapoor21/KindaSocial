//
//  ShadowView.swift
//  KindaSocial
//
//  Created by Sarthak Kapoor on 14/07/17.
//  Copyright © 2017 SK21. All rights reserved.
//

import UIKit

class ShadowView: UIView {

    override func awakeFromNib() {
        super.awakeFromNib()
        
        layer.shadowColor = UIColor(red: SHADOW_GRAY, green: SHADOW_GRAY, blue: SHADOW_GRAY, alpha: 0.7).cgColor
        layer.shadowOffset = CGSize(width: 3.0, height: 3.0)
        layer.shadowRadius = 4.0
        layer.shadowOpacity = 0.9
    }
}
