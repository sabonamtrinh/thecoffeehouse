//
//  NewsTableViewCell.swift
//  TheCoffeeHouse
//
//  Created by namtrinh on 9/15/20.
//  Copyright © 2020 namtrinh. All rights reserved.
//

import UIKit

class NewsTableViewCell: UITableViewCell {

    static let identifier = "NewsTableViewCell"
    
    private let newscollectionview: UICollectionView = {
        let collection = UICollectionView()
        return collection
    }()
    
    var  news = [News]()
    override func awakeFromNib() {
        super.awakeFromNib()
        newscollectionview.register(NewsCollectionViewCell.self,
                                    forCellWithReuseIdentifier: NewsCollectionViewCell.identifier)
        newscollectionview.delegate = self
        newscollectionview.dataSource = self
    }
    
}

extension NewsTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return news.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NewsCollectionViewCell.identifier, for: indexPath) as! NewsCollectionViewCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 250, height: 250)
    }
}
