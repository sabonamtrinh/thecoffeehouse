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
        return cv
    }()
    
    private let segmentedControl: UISegmentedControl = {
        let control = UISegmentedControl(items: ["Phổ biến","Thức uống","Đồ ăn"])
        control.selectedSegmentIndex = 0
        control.backgroundColor = .systemBackground
        control.layer.borderWidth = 0
        control.layer.cornerRadius = 0
        control.addTarget(self, action: #selector(handelSegmentChange), for: .valueChanged)
        return control
    }()
    
    private let searchButton: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named:"icon_search"), for: .normal)
        btn.contentMode = .scaleAspectFill
        return btn
    }()
    
    var dbManager:DBManager!
    var dataList: Results<ProDucts>!
    var drinkList: Results<Drinks>!
    var foodList: Results<Foods>!
    lazy var rowtoDisplay = dataList.count
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = false
        self.navigationController?.navigationBar.topItem?.title = "Oder"
        dbManager = DBManager.sharedInstance
        dataList = dbManager.getDataFormDB()
        drinkList = dbManager.getDrinks()
        foodList = dbManager.getFoods()
        setUp()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
    }
    
    @objc fileprivate func handelSegmentChange() {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            rowtoDisplay = dataList.count
        case 1:
            rowtoDisplay = drinkList.count
        case 2:
            rowtoDisplay = foodList.count
        default:
            rowtoDisplay = dataList.count
        }
        collectionView.reloadData()
    }
    private func setUp(){
        view.backgroundColor = .systemGray5
        view.addSubview(collectionView)
        view.addSubview(segmentedControl)
        view.addSubview(searchButton)
        segmentedControl.frame = CGRect(x: 0, y: 80, width: view.width-40, height: 40)
        searchButton.frame = CGRect(x: segmentedControl.width, y: 80, width: 40, height: 40)
        collectionView.backgroundColor = .systemGray5
        collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 150).isActive = true
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
        return rowtoDisplay
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.frame.width-20)/2, height: 250)
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductsCollectionViewCell.identifier, for: indexPath) as? ProductsCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.backgroundColor = .systemBackground
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            let pd = dataList[indexPath.row]
            cell.imageView.image = UIImage(named: pd.imageName)
            cell.titleLabel.text = pd.name
            cell.priceLabel.text = pd.price
        case 1:
            let dr = drinkList[indexPath.row]
            cell.imageView.image = UIImage(named: dr.imageName)
            cell.titleLabel.text = dr.name
            cell.priceLabel.text = dr.price
        case 2:
            let fd = foodList[indexPath.row]
            cell.imageView.image = UIImage(named: fd.imageName)
            cell.titleLabel.text = fd.name
            cell.priceLabel.text = fd.price
        default:
            let pd = dataList[indexPath.row]
            cell.imageView.image = UIImage(named: pd.imageName)
            cell.titleLabel.text = pd.name
            cell.priceLabel.text = pd.price
        }
        cell.backgroundColor = .white
        cell.layer.borderColor = UIColor.systemGray5.cgColor
        cell.layer.cornerRadius = 8
        cell.layer.borderWidth = 1
        cell.isSelected = true
        return cell
    }
    
    
}
