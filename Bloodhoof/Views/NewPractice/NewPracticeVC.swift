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
    var newWorkoutView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationBarInit()
        newWorkoutViewInit()
    }
    
    //MARK: UI Inits
    func navigationBarInit() {
        navigationController?.navigationBar.barTintColor = Constants.Colors.orange
        navigationItem.title = NSLocalizedString("Today", comment: "")
        
//        //navi left button
//        let img = UIImage(named: "menu")!.imageWithColor(UIColor.white)
//        menuButton = UIButton(type: .custom);
//        menuButton.frame = CGRect(x: 0, y: 0, width: 25, height: 25)
//        menuButton.setBackgroundImage(img, for: .normal)
//        menuButton.addTarget(self, action: #selector(self.didTapOpenButton(sender:)), for: .touchUpInside)
//        let naviLeftButton = UIBarButtonItem()
//        naviLeftButton.customView = menuButton
//        navigationItem.leftBarButtonItem = naviLeftButton
//        
//        //navi right button
//        helpButton = UIButton(type: .custom)
//        helpButton.frame = CGRect(x: 0, y: 0, width: 40, height: 25)
//        helpButton.setTitle("Help", for: .normal)
//        helpButton.addTarget(self, action: #selector(self.didTapHelpButton(sender:)), for: .touchUpInside)
//        let naviRightButton = UIBarButtonItem()
//        naviRightButton.customView = helpButton
//        navigationItem.rightBarButtonItem = naviRightButton
    }
    
    //If no workout today, display this view
    private func newWorkoutViewInit() {
        newWorkoutView = UIView()
        newWorkoutView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(newWorkoutView)
        
        let reminderLabel = UILabel(frame: CGRect(x: 0, y: 0, width: device_width-60, height: 150))
        reminderLabel.textAlignment = .center
        reminderLabel.textColor = Constants.Colors.gray
        reminderLabel.numberOfLines = 0
        reminderLabel.text = NSLocalizedString("You don't have any plan for today yet. Let's start one!", comment: "")
        newWorkoutView.addSubview(reminderLabel)
        
        //button click to create new workout for today
        let startButton = UIButton()
        startButton.setTitle(NSLocalizedString("Start", comment: ""), for: .normal)
        startButton.setTitleColor(Constants.Colors.orange, for: UIControlState())
        startButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 23)
        startButton.layer.cornerRadius = 5
        startButton.layer.borderColor = Constants.Colors.orange.cgColor
        startButton.layer.borderWidth = 1
//        startButton.addTarget(self, action: #selector(self.btnClicked_skip), for: UIControlEvents.touchUpInside)
        startButton.translatesAutoresizingMaskIntoConstraints = false
        newWorkoutView.addSubview(startButton)
        
        newWorkoutView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: device_height*0.5-150).isActive = true
        newWorkoutView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20).isActive = true
        newWorkoutView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20).isActive = true
        newWorkoutView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0).isActive = true
        newWorkoutView.heightAnchor.constraint(equalToConstant: 300).isActive = true

        reminderLabel.topAnchor.constraint(equalTo: newWorkoutView.topAnchor, constant: 0).isActive = true
        reminderLabel.leadingAnchor.constraint(equalTo: newWorkoutView.leadingAnchor, constant: 20).isActive = true
        reminderLabel.trailingAnchor.constraint(equalTo: newWorkoutView.trailingAnchor, constant: -20).isActive = true
        reminderLabel.heightAnchor.constraint(equalToConstant: 150).isActive = true
        
        startButton.topAnchor.constraint(equalTo: reminderLabel.bottomAnchor, constant: 50).isActive = true
        startButton.centerXAnchor.constraint(equalTo: newWorkoutView.centerXAnchor, constant: 0).isActive = true
        startButton.widthAnchor.constraint(equalTo: newWorkoutView.widthAnchor, multiplier: 0.6, constant: 0).isActive = true
        startButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
}
