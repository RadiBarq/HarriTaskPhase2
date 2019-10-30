//
//  UserProfileTableViewHeaderCell.swift
//  HarriTask
//
//  Created by Harri on 10/24/19.
//  Copyright © 2019 Harri. All rights reserved.
//

import UIKit

class UserProfileTableViewHeaderCell: UITableViewHeaderFooterView {
//    @IBOutlet var backgroundImageView: UIImageView!
//    @IBOutlet var profileImageView: UIImageView!
//    @IBOutlet var nameLabel: UILabel!
//    @IBOutlet var jobLabel: UILabel!
//    @IBOutlet var commentButton: UIButton!
//    @IBOutlet var messageButton: UIButton!
    @IBOutlet var profileImageView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var backgroundImageView: UIImageView!
    @IBOutlet var commentButton: UIButton!
    @IBOutlet var sendMessageButton: UIButton!
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder: NSCoder) {
           fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        profileImageView.layer.masksToBounds = true
        profileImageView.layer.cornerRadius = 32
        profileImageView.layer.borderColor = UIColor.white.cgColor
        profileImageView.layer.borderColor = UIColor.white.cgColor
        profileImageView.layer.borderWidth = 2

        commentButton.layer.masksToBounds = true
        commentButton.layer.cornerRadius = 21
        sendMessageButton.layer.masksToBounds = true
        sendMessageButton.layer.cornerRadius = 21
    }
    
    class func getReuseIdentifier() -> String {
        return "UserProfileTableViewHeaderCell"
    }
}
