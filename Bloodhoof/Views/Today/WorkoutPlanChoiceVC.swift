//
//  WorkoutPlanChoiceVC.swift
//  Bloodhoof
//
//  Created by Xiao Yan on 7/28/17.
//  Copyright © 2017 Xiao Yan. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class WorkoutPlanChoiceVC: UIViewController {

    var myPlansTableView: UITableView!
    var addNewPlanButton: UIButton!
    
    var templatePlanButton: UIButton!
    
    let viewModel = WorkoutPlanChoiceVM()
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myPlansTableViewInit()
    }
}

//MARK: - draw UI
extension WorkoutPlanChoiceVC {
    fileprivate func myPlansTableViewInit() {
        myPlansTableView = UITableView()
        myPlansTableView.register(MyPlansTableViewCell.self, forCellReuseIdentifier: "MyPlansTableViewCell")
        myPlansTableView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(myPlansTableView)
        
        addNewPlanButton = UIButton()
        addNewPlanButton.setTitle(NSLocalizedString("Add a new plan", comment: ""), for: .normal)
        addNewPlanButton.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(addNewPlanButton)
        
        templatePlanButton = UIButton()
        templatePlanButton.setTitle(NSLocalizedString("Recommand a plan to me", comment: ""), for: .normal)
        templatePlanButton.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(templatePlanButton)
        
        myPlansTableView.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor, constant: 0).isActive = true
        myPlansTableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0).isActive = true
        myPlansTableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0).isActive = true
        
        addNewPlanButton.topAnchor.constraint(equalTo: myPlansTableView.bottomAnchor, constant: 30).isActive = true
        addNewPlanButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0).isActive = true
        addNewPlanButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0).isActive = true
        
        templatePlanButton.topAnchor.constraint(equalTo: addNewPlanButton.bottomAnchor, constant: 30).isActive = true
        templatePlanButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0).isActive = true
        templatePlanButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0).isActive = true
        templatePlanButton.bottomAnchor.constraint(equalTo: bottomLayoutGuide.topAnchor, constant: 30).isActive = true
    }
}

//MARK: - Rx Settings
extension WorkoutPlanChoiceVC {
    func rxSet() {
        viewModel.planList.asObservable()
            .bindTo(myPlansTableView
                .rx
                .items(cellIdentifier: "MyPlansTableViewCell")) {
                    
        }
    }
}

class MyPlansTableViewCell: UITableViewCell {
    
}
