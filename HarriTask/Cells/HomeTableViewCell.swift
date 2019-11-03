//
//  HomeTableViewCell.swift
//  HarriTask
//
//  Created by Harri on 10/13/19.
//  Copyright © 2019 Harri. All rights reserved.
//

import UIKit
import JNAvatarWithInitials

class HomeTableViewCell: UITableViewCell, BaseCell{
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
        profileImage.layer.backgroundColor = UIColor.red.cgColor
        profileImage.layer.cornerRadius = 25
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    func setup(representable: HomeTableViewRepresentable) {
        self.nameLabel.text = representable.fullName
        self.jobLabel.attributedText = representable.position
        self.profileImage.setup(imageUrl: representable.imageURL, placeHolderImage: UIImage(systemName: "arkit"), fullName: "Profile Image", showInitails: true)
    }
    
    static func getReuseIdentifier() -> String {
        return "HomeTableViewCell"
    }
}
