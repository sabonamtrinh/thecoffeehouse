//
//  ProductsCollectionViewCell.swift
//  TheCoffeeHouse
//
//  Created by namtrinh on 9/21/20.
//  Copyright © 2020 namtrinh. All rights reserved.
//

import UIKit

class ProductsCollectionViewCell: UICollectionViewCell {

    static let identifier = "ProductsCollectionViewCell"
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    static func nib()-> UINib {
        return UINib(nibName: "ProductsCollectionViewCell", bundle: nil)
    }
    
    @IBAction func handelOderButton(_ sender: Any) {
        
    }
  
}


