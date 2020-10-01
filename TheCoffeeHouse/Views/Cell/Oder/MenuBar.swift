//
//  MenuBar.swift
//  TheCoffeeHouse
//
//  Created by namtrinh on 9/22/20.
//  Copyright © 2020 namtrinh. All rights reserved.
//

import UIKit

class MenuBar: UIView {
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return cv
    }()
    
    override init(frame: CGRect){
        super.init(frame: frame)
        backgroundColor = .systemBackground
        addSubview(collectionView)
        collectionView.backgroundColor = .systemBlue
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0":collectionView]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0":collectionView]))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
