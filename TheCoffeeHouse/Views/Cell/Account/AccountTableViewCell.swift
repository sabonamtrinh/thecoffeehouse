//
//  AccountTableViewCell.swift
//  TheCoffeeHouse
//
//  Created by namtrinh on 9/18/20.
//  Copyright © 2020 namtrinh. All rights reserved.
//

import UIKit

class AccountTableViewCell: UITableViewCell {

    static let identifer = "AccountTableViewCell"
    
    @IBOutlet weak var imagesetting: UIImageView!
    @IBOutlet weak var infoLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = .systemBackground
        imagesetting.layer.masksToBounds = true
        imagesetting.contentMode = .scaleAspectFill
        infoLabel.numberOfLines = 1
//        imagesetting.image = UIImage(named: "abd")
//        infoLabel.text = "Demo"
    }

    static func nib()-> UINib {
        return UINib(nibName: "AccountTableViewCell", bundle: nil)
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    public func configure(image: String, label: String){
        imagesetting?.image = UIImage(named: image)
        infoLabel.text = label
    }
    
}
