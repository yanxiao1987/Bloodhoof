//
//  ViewController.swift
//  Bloodhoof
//
//  Created by Xiao Yan on 6/24/17.
//  Copyright © 2017 Xiao Yan. All rights reserved.
//

import UIKit

class DashboardVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        topViewInit()
    }
    
    //MARK: UI Inits
    private func topViewInit() {
        let topView = UIView(frame: CGRect(x: 0, y: 0, width: device_width, height: 70))
        topView.backgroundColor = Constants.Colors.blue
        self.view.addSubview(topView)
        
        
    }
    
}

