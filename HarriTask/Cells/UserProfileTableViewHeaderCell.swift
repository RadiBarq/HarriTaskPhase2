//
//  UserProfileTableViewHeaderCell.swift
//  HarriTask
//
//  Created by Harri on 10/24/19.
//  Copyright © 2019 Harri. All rights reserved.
//

import UIKit

class UserProfileTableViewHeaderCell: UITableViewCell {
    @IBOutlet var backgroundImageView: UIImageView!
    @IBOutlet var profileImageView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var jobLabel: UILabel!
    @IBOutlet var commentButton: UIButton!
    @IBOutlet var messageButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupCell()
    }

    func setupCell() {
        profileImageView.layer.masksToBounds = true
        profileImageView.layer.cornerRadius = 32
        profileImageView.layer.borderColor = UIColor.white.cgColor
        commentButton.layer.masksToBounds = true
        commentButton.layer.cornerRadius = 21
        messageButton.layer.masksToBounds = true
        messageButton.layer.cornerRadius = 21
    }
    
    class func getReuseIdentifier() -> String {
        return "UserProfileTableViewHeaderCell"
    }
}
