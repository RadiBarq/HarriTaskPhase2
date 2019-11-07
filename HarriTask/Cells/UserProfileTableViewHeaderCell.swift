//
//  UserProfileTableViewHeaderCell.swift
//  HarriTask
//
//  Created by Harri on 10/24/19.
//  Copyright © 2019 Harri. All rights reserved.
//

import UIKit
import JNAvatarWithInitials

class UserProfileTableViewHeaderCell: UITableViewHeaderFooterView {
    @IBOutlet var backgroundImageView: JNAvatarWithInitials!
    @IBOutlet var commentButton: UIButton!
    @IBOutlet var sendMessageButton: UIButton!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var jobLabel: UILabel!
    @IBOutlet var profileImageView: JNAvatarWithInitials!
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setupImages()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setup(representable: UserProfileHeaderRepresentable) {
        nameLabel.text = representable.fullName
        jobLabel.text = representable.positionTitle
        self.profileImageView.setup(imageUrl: representable.imageURL, fullName: representable.fullName , showInitails: true)
        self.backgroundImageView.setup(imageUrl: representable.backgroundImageURL, fullName: representable.fullName, showInitails: true)
    }
    
    func setupImages() {
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
    
    static func getReuseIdentifier() -> String {
        return "UserProfileTableViewHeaderCell"
    }
}
