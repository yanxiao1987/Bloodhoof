//
//  NewPracticeVC.swift
//  Bloodhoof
//
//  Created by Xiao Yan on 7/24/17.
//  Copyright © 2017 Xiao Yan. All rights reserved.
//

import UIKit

class NewWorkoutVC: UIViewController {

    var topView: UIView!
    var startNewView: UIView!
    var bodyPartsView: UIView!
    var bodyPartsViewTopConstraint: NSLayoutConstraint
    
    var viewModel = NewWorkoutVM()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationBarInit()
        startNewViewInit()
        bodyPartsViewInit()
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
    private func startNewViewInit() {
        startNewView = UIView()
        startNewView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(startNewView)
        
        let reminderLabel = UILabel(frame: CGRect(x: 0, y: 0, width: device_width-60, height: 150))
        reminderLabel.textAlignment = .center
        reminderLabel.textColor = Constants.Colors.gray
        reminderLabel.numberOfLines = 0
        reminderLabel.text = NSLocalizedString("You don't have any plan for today yet. Let's start one!", comment: "")
        startNewView.addSubview(reminderLabel)
        
        //button click to create new workout for today
        let createNewButton = UIButton()
        createNewButton.setTitle(NSLocalizedString("Start", comment: ""), for: .normal)
        createNewButton.setTitleColor(Constants.Colors.orange, for: UIControlState())
        createNewButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 23)
        createNewButton.layer.cornerRadius = 5
        createNewButton.layer.borderColor = Constants.Colors.orange.cgColor
        createNewButton.layer.borderWidth = 1
        createNewButton.addTarget(self, action: #selector(self.createNewButtonClicked), for: UIControlEvents.touchUpInside)
        createNewButton.translatesAutoresizingMaskIntoConstraints = false
        startNewView.addSubview(createNewButton)
        
        startNewView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: device_height*0.5-150).isActive = true
        startNewView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20).isActive = true
        startNewView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20).isActive = true
        startNewView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0).isActive = true
        startNewView.heightAnchor.constraint(equalToConstant: 300).isActive = true

        reminderLabel.topAnchor.constraint(equalTo: startNewView.topAnchor, constant: 0).isActive = true
        reminderLabel.leadingAnchor.constraint(equalTo: startNewView.leadingAnchor, constant: 20).isActive = true
        reminderLabel.trailingAnchor.constraint(equalTo: startNewView.trailingAnchor, constant: -20).isActive = true
        reminderLabel.heightAnchor.constraint(equalToConstant: 150).isActive = true
        
        createNewButton.topAnchor.constraint(equalTo: reminderLabel.bottomAnchor, constant: 50).isActive = true
        createNewButton.centerXAnchor.constraint(equalTo: startNewView.centerXAnchor, constant: 0).isActive = true
        createNewButton.widthAnchor.constraint(equalTo: startNewView.widthAnchor, multiplier: 0.6, constant: 0).isActive = true
        createNewButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    //After user click 'Start' button, popup this view for body parts choosing
    private func bodyPartsViewInit() {
        bodyPartsView = UIView()
        bodyPartsView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(bodyPartsView)
        
        bodyPartsViewTopConstraint = bodyPartsView.topAnchor
        bodyPartsViewTopConstraint.constraint(equalTo: self.view.topAnchor, constant: device_height).isActive = true
        startNewView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 30).isActive = true
        startNewView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -30).isActive = true
        startNewView.heightAnchor.constraint(equalToConstant: device_height-184).isActive = true
    }
    
    //MARK: - Button action
    func createNewButtonClicked() {
        bodyPartsViewTopConstrant.constant = 30
    }
}
