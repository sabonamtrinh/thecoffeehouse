//
//  NewsCollectionViewCell.swift
//  TheCoffeeHouse
//
//  Created by namtrinh on 9/15/20.
//  Copyright © 2020 namtrinh. All rights reserved.
//

import UIKit

class NewsCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "NewsCollectionViewCell"
    
    private let image: UIImageView = {
        let image = UIImageView()
        return image
    }()
    
    private let title: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private let content: UILabel = {
        let label = UILabel()
        return label
    }()
    
    public func configure(with model: News){
        self.image.image = UIImage(named: model.image)
    }
}
