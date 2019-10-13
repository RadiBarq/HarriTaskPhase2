//
//  HomeTableViewCell.swift
//  HarriTask
//
//  Created by Harri on 10/13/19.
//  Copyright © 2019 Harri. All rights reserved.
//

import UIKit
import JNAvatarWithInitials

class HomeTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var jobLabel: UILabel!
    @IBOutlet weak var profileImage: JNAvatarWithInitials!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupImage()
    }
    
    func setupImage() {
        profileImage.layer.masksToBounds = true
        profileImage.layer.cornerRadius = 25
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    func setFirstJobFont() {
        jobLabel.font = UIFont(name: "OpenSans-Italic", size: 12)
        jobLabel.text = "Is looking for their first job"
        jobLabel.textColor = UIColor(red: 74/255, green: 74/255, blue: 74/255, alpha: 1)
    }
    
    func setAttributedJobFont(positionName: String, positionBrand: String) {
        let attributedText = NSMutableAttributedString(string: positionName, attributes: [NSAttributedString.Key.font: UIFont(name: "OpenSans-Semibold", size: 14)!])
        attributedText.append(NSMutableAttributedString(string: ", ", attributes: [NSAttributedString.Key.font: UIFont(name: "OpenSans-Semibold", size: 14)!]))
        attributedText.append(NSAttributedString(string: positionName, attributes: [NSAttributedString.Key.font: UIFont(name: "OpenSans", size: 14)!, NSAttributedString.Key.foregroundColor: UIColor.black]))
        jobLabel.attributedText = attributedText
    }
}
