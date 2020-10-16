//
//  CoffeeLoveTableViewCell.swift
//  TheCoffeeHouse
//
//  Created by namtrinh on 10/6/20.
//  Copyright © 2020 namtrinh. All rights reserved.
//

import UIKit
import RealmSwift

class CoffeeLoveTableViewCell: UITableViewCell {

    static let identifier = "CoffeeLoveTableViewCell"
    
    var dbManager: DBManager!
    var dataList:Results<CoffeLove>!
    @IBOutlet weak var coffeeLoveCollectionView: UICollectionView!
    
    static func nib()-> UINib {
        return UINib(nibName: "CoffeeLoveTableViewCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        coffeeLoveCollectionView.backgroundColor = .systemGray5
        coffeeLoveCollectionView.showsHorizontalScrollIndicator = false
        coffeeLoveCollectionView.delegate = self
        coffeeLoveCollectionView.dataSource = self
        coffeeLoveCollectionView.register(ItemsNewsCollectionViewCell.nib(), forCellWithReuseIdentifier: ItemsNewsCollectionViewCell.indentififer)
        
        dbManager = DBManager.sharedInstance
        dataList = dbManager.getCoffeeLove()
    }

    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension CoffeeLoveTableViewCell: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, UICollectionViewDelegate {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataList.count
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 200, height: 300)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20.0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ItemsNewsCollectionViewCell.indentififer,
                                                      for: indexPath) as! ItemsNewsCollectionViewCell
        let newCell = dataList[indexPath.row]
        cell.titleLabel.text = newCell.title
        cell.contentLabel.text = newCell.content
        cell.imagenewsUIImageView.image = UIImage(named: newCell.imageName)
        cell.backgroundColor = .white
        cell.layer.borderColor = UIColor.systemGray5.cgColor
        cell.layer.cornerRadius = 8
        cell.layer.borderWidth = 1
        cell.isSelected = true
        return cell
    }}
