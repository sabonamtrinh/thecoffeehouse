//
//  OderViewController.swift
//  TheCoffeeHouse
//
//  Created by namtrinh on 9/14/20.
//  Copyright © 2020 namtrinh. All rights reserved.
//

import UIKit
import RealmSwift

class OderViewController: UIViewController {

    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 20
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.showsVerticalScrollIndicator = false
       // cv.scro
        return cv
    }()
    
    let menuBar: MenuBar = {
        let menu = MenuBar()
        return menu
    }()
    var dbManager:DBManager!
    var dataList: Results<ProDucts>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dbManager = DBManager.sharedInstance
        dataList = dbManager.getDataFormDB()
        setUp()
        setUpMenuBar()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
    }

    private func setUpMenuBar(){
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        view.addSubview(menuBar)
        menuBar.frame = CGRect(x: 0, y: view.top, width: view.width, height: 100)
    }
    
    private func setUp(){
        view.backgroundColor = .systemGray5
        view.addSubview(collectionView)
        collectionView.backgroundColor = .systemGray5
        collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 130).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(ProductsCollectionViewCell.nib(),
                                forCellWithReuseIdentifier: ProductsCollectionViewCell.identifier)
    }
}

extension OderViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.frame.width-20)/2, height: 250)
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductsCollectionViewCell.identifier, for: indexPath) as? ProductsCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.backgroundColor = .systemBackground
        let pd = dataList[indexPath.row]
        cell.imageView.image = UIImage(named: pd.imageName)
        cell.titleLabel.text = pd.name
        cell.priceLabel.text = pd.price
        cell.backgroundColor = .white
        cell.layer.borderColor = UIColor.systemGray5.cgColor
        cell.layer.cornerRadius = 8
        cell.layer.borderWidth = 1
        cell.isSelected = true
        return cell
    }
    
    
}
