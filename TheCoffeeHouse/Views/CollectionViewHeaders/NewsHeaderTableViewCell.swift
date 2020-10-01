//
//  NewsHeaderTableViewCell.swift
//  TheCoffeeHouse
//
//  Created by namtrinh on 9/18/20.
//  Copyright © 2020 namtrinh. All rights reserved.
//

import UIKit

class NewsHeaderTableViewCell: UITableViewCell {

    @IBOutlet weak var pointsButton: UIButton!
    @IBOutlet weak var oderButton: UIButton!
    @IBOutlet weak var couponButton: UIButton!
    @IBOutlet weak var rewardsButton: UIButton!
    
    static let identifier = "NewsHeaderTableViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = .clear
        Custom()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    static func nib()-> UINib {
        return UINib(nibName: "NewsHeaderTableViewCell", bundle: nil)
        
    }
    
    private func Custom(){
        pointsButton.setImage(UIImage(named: "qr"), for: .normal)
        oderButton.setImage(UIImage(named: "order"), for: .normal)
        couponButton.setImage(UIImage(named: "voucher"), for: .normal)
        rewardsButton.setImage(UIImage(named: "rewards1"), for: .normal)
        
    }
    @IBAction func handelPointsButton(_ sender: Any) {
    }
    
    @IBAction func handelOderButton(_ sender: Any) {
    }
    
    @IBAction func handelCouponButton(_ sender: Any) {
    }
    
    @IBAction func handelrewardsButton(_ sender: Any) {
    }
}

