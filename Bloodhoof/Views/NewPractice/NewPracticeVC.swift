//
//  NewPracticeVC.swift
//  Bloodhoof
//
//  Created by Xiao Yan on 7/24/17.
//  Copyright © 2017 Xiao Yan. All rights reserved.
//

import UIKit

class NewPracticeVC: UIViewController {

    var topView: UIView!
    var createNewView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        topViewInit()
    }
    
    //MARK: UI Inits
    private func topViewInit() {
        topView = UIView(frame: CGRect(x: 0, y: 0, width: device_width, height: 70))
        topView.backgroundColor = Constants.Colors.orange
        self.view.addSubview(topView)
    }
    
    private func createNewViewInit() {
        createNewView = UIView(frame: CGRect(x: device_height*0.5-150, y: 30, width: device_width-60, height: 300))
        createNewView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(createNewView)
        
        let reminderLabel = UILabel(frame: CGRect(x: 0, y: 0, width: device_width-60, height: 150))
        reminderLabel.textAlignment = .center
        reminderLabel.textColor = Constants.Colors.gray
        reminderLabel.text = NSLocalizedString("You don't have any plan for today yet. Let's start one!", comment: "")
        createNewView.addSubview(reminderLabel)
        
        let startButton = UIButton(frame: CGRect(x: 0, y: 0, width: (device_width-60)*0.5, height: 150))
        
        createNewView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: device_height*0.5-150).isActive = true
        createNewView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20).isActive = true
        createNewView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20).isActive = true
        createNewView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0).isActive = true
        createNewView.heightAnchor.constraint(equalToConstant: 300).isActive = true

    }
}
