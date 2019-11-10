//
//  UserProfileTableViewHeaderView.swift
//  HarriTask
//
//  Created by Harri on 10/27/19.
//  Copyright © 2019 Harri. All rights reserved.
//

import UIKit
import JNAvatarWithInitials

class UserProfileTableViewHeaderView: UITableViewHeaderFooterView {
    
    @IBOutlet var profileImageView: JNAvatarWithInitials!
    @IBOutlet var backgroundImageView: JNAvatarWithInitials!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var jobLabel: UILabel!
    @IBOutlet var commentButton: UIButton!
    @IBOutlet var sendMessageButton: UIButton!
    
    public override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        self.initView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initView() {
        Bundle.main.loadNibNamed("UserProfileTableViewHeaderView", owner: self, options: nil)
        addSubview(contentView)
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
        return "UserProfileTableViewHeaderView"
    }
    
    func setup(representable: UserProfileHeaderRepresentable) {
        nameLabel.text = representable.fullName
        jobLabel.text = representable.positionTitle
        self.profileImageView.setup(imageUrl:representable.imageURL, fullName: representable.fullName , showInitails: true)
        self.backgroundImageView.setup(imageUrl: representable.backgroundImageURL, fullName: representable.fullName, showInitails: true)
    }
}
