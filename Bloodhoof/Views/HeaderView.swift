//
//  HeaderView.swift
//  Bloodhoof
//
//  Created by Xiao Yan on 7/24/17.
//  Copyright © 2017 Xiao Yan. All rights reserved.
//

import UIKit

class HeaderView: UIView {
    
    var titleLabel: UILabel!
    
    init(frame: CGRect, bgColor: UIColor, titleStr: String) {
        super.init(frame: frame)
        self.backgroundColor = bgColor
        titleLabel = UILabel(frame: CGRect(x: 0, y: 30, width: device_width, height: 30))
        titleLabel.adjustsFontSizeToFitWidth = true
        titleLabel.textColor = UIColor.white
        self.titleLabel.text = titleStr
        
    }

    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
