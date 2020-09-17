//
//  HeaderInfoTableViewCell.swift
//  TheCoffeeHouse
//
//  Created by namtrinh on 9/17/20.
//  Copyright © 2020 namtrinh. All rights reserved.
//

import UIKit

class HeaderInfoTableViewCell: UITableViewCell {

    static let identifier = "HeaderInfoTableViewCell"
    
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = .systemGray5
    }
    
    static func nib()-> UINib {
        return UINib(nibName: "HeaderInfoTableViewCell", bundle: nil)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func setTitleHeader(title: String) {
        titleLabel.text = title
    }
    
    @IBAction func extendButton(_ sender: Any) {
        
    }
    
}
