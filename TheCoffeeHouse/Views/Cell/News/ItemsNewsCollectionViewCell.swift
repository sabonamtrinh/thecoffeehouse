//
//  ItemsNewsCollectionViewCell.swift
//  TheCoffeeHouse
//
//  Created by namtrinh on 9/17/20.
//  Copyright © 2020 namtrinh. All rights reserved.
//

import UIKit

class ItemsNewsCollectionViewCell: UICollectionViewCell {

    static let indentififer = "ItemsNewsCollectionViewCell"
    
    @IBOutlet weak var imagenewsUIImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var detailButton: UIButton!
    
    static func nib()-> UINib {
        return UINib(nibName: "ItemsNewsCollectionViewCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUp()
    }
    
    func setUp(){
        detailButton.layer.cornerRadius = 8
        detailButton.layer.borderWidth = 1
        detailButton.layer.borderColor = UIColor.systemOrange.cgColor
        detailButton.setTitle("Chi tiết", for: .normal)
        imagenewsUIImageView.image = UIImage(named: "abd")
        titleLabel.text = "Tile"
        contentLabel.text = "Content"
    }
    
    public func configure(with model: Model){
        detailButton.layer.cornerRadius = 8
        detailButton.layer.borderWidth = 1
        detailButton.setTitle(model.namebutton, for: .normal)
        imagenewsUIImageView.image = UIImage(named: model.imageName)
        titleLabel.text = model.title
        contentLabel.text = model.content
    }
    
    
}



