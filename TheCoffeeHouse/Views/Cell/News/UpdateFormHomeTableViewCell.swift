//
//  UpdateFormHomeTableViewCell.swift
//  TheCoffeeHouse
//
//  Created by namtrinh on 10/6/20.
//  Copyright © 2020 namtrinh. All rights reserved.
//

import UIKit
import RealmSwift

class UpdateFormHomeTableViewCell: UITableViewCell {

    static let identifier = "UpdateFormHomeTableViewCell"
    
    @IBOutlet weak var updateFormHomeCollectionView: UICollectionView!
    
    var dbManager: DBManager!
    var dataList:Results<UpdateFormHome>!
    
    static func nib()-> UINib {
        return UINib(nibName: "UpdateFormHomeTableViewCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        updateFormHomeCollectionView.backgroundColor = .systemGray5
        updateFormHomeCollectionView.showsHorizontalScrollIndicator = false
        updateFormHomeCollectionView.delegate = self
        updateFormHomeCollectionView.dataSource = self
        updateFormHomeCollectionView.register(ItemsNewsCollectionViewCell.nib(), forCellWithReuseIdentifier: ItemsNewsCollectionViewCell.indentififer)
        
        dbManager = DBManager.sharedInstance
        dataList = dbManager.getUpdateFormHome()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension UpdateFormHomeTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
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
    }
}
