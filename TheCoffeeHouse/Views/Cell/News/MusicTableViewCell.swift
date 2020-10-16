//
//  MusicTableViewCell.swift
//  TheCoffeeHouse
//
//  Created by namtrinh on 10/7/20.
//  Copyright © 2020 namtrinh. All rights reserved.
//

import UIKit
import SwiftyGif

class MusicTableViewCell: UITableViewCell {
    
    static let identifier = "MusicTableViewCell"
    
    @IBOutlet weak var musicImageView: UIImageView!
    @IBOutlet weak var nameSongLbl: UILabel!
    @IBOutlet weak var singerLbl: UILabel!
    @IBOutlet weak var animationMusicImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        configure()
    }

    static func nib()-> UINib {
        return UINib(nibName: "MusicTableViewCell", bundle: nil)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    private func configure(){
        musicImageView.layer.cornerRadius = musicImageView.frame.height/2
        musicImageView.layer.masksToBounds = true
        musicImageView.layer.borderWidth = 1
        musicImageView.layer.borderColor = UIColor.systemGray5.cgColor
        let imageWaveMusic = try! Data(contentsOf: Bundle.main.url(forResource: "nowplay", withExtension: "gif")!)
        animationMusicImage.image = UIImage.gifImageWithData(imageWaveMusic)
        animationMusicImage.startAnimatingGif()
        musicImageView.image = UIImage(named: "album")
        musicImageView.startRotating()
    }
    
}
