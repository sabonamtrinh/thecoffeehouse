//
//  IntroduceTableViewCell.swift
//  TheCoffeeHouse
//
//  Created by namtrinh on 10/7/20.
//  Copyright © 2020 namtrinh. All rights reserved.
//

import UIKit

class IntroduceTableViewCell: UITableViewCell {

    static let identifier = "IntroduceTableViewCell"
    
    @IBOutlet weak var introduceImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        introduceImage.layer.cornerRadius = 8
        backgroundColor = .systemGray5
    }

    static func nib()-> UINib {
        return UINib(nibName: "IntroduceTableViewCell", bundle: nil)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
