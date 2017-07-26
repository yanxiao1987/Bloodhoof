//
//  WorkoutTypeVC.swift
//  Bloodhoof
//
//  Created by Xiao Yan on 7/26/17.
//  Copyright © 2017 Xiao Yan. All rights reserved.
//

import UIKit

class WorkoutTypeVC: UIViewController {

    var bodyPartsCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bodyPartsCollectionViewInit()
    }
    
    //MARK: - body parts colloction view ui
    private func bodyPartsCollectionViewInit() {
        let collectionViewHeight = device_height-navi_height-tabbar_height-30-100
        let cellLayout = UICollectionViewFlowLayout()
        cellLayout.itemSize = CGSize(width: device_width/2, height: collectionViewHeight/4)
        cellLayout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        cellLayout.minimumInteritemSpacing = 0
        cellLayout.minimumLineSpacing = 0
        cellLayout.scrollDirection = UICollectionViewScrollDirection.vertical
        bodyPartsCollectionView = UICollectionView(frame: CGRect(x: 0, y: 30, width: device_width, height: collectionViewHeight), collectionViewLayout: cellLayout)
        bodyPartsCollectionView.delegate = self
        bodyPartsCollectionView.dataSource = self
        bodyPartsCollectionView.showsVerticalScrollIndicator = false
        bodyPartsCollectionView.showsHorizontalScrollIndicator = false
        bodyPartsCollectionView.backgroundColor = UIColor.clear
        bodyPartsCollectionView.register(BodyPartsCollectionViewCell.self, forCellWithReuseIdentifier: "BodyPartsCollectionViewCell")
        bodyPartsCollectionView.bounces = false
        self.view.addSubview(bodyPartsCollectionView)
    }
}

//MARK: - UICollectionViewDelegate, UICollectionViewDataSource
extension WorkoutTypeVC: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 7
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BodyPartsCollectionViewCell", for: indexPath) as! BodyPartsCollectionViewCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}

class BodyPartsCollectionViewCell: UICollectionViewCell {
    
    var mainView: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        mainView = UIView()
        mainView.translatesAutoresizingMaskIntoConstraints = false
        mainView.backgroundColor = UIColor.red
        contentView.addSubview(mainView)
        
        setConstraints()
    }
    
    func setConstraints() {
        //MARK: - Constraints
        mainView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5).isActive = true
        mainView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5).isActive = true
        mainView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5).isActive = true
        mainView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
