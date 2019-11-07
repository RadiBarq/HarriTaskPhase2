//
//  UserProfileCollectionViewCell.swift
//  HarriTask
//
//  Created by Harri on 10/24/19.
//  Copyright © 2019 Harri. All rights reserved.
//

import UIKit

class UserProfileCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var skillTitle: UILabel!
    
    required init?(coder: NSCoder) {
          super.init(coder: coder)
          initalizeBorder()
    }
    
    func initalizeBorder() {
        self.layer.borderColor = UIColor(red: 74/255, green: 144/255, blue: 226/255, alpha: 1).cgColor
        self.layer.borderWidth = 1.5
        self.layer.cornerRadius = 5
    }
    
    func setup(representable: UserProfileCollectionViewCellRepresentable) {
        self.skillTitle.text = representable.title
    }
    
    static func getReuseIdentifier() -> String {
          return "UserProfileCollectionViewCell"
    }
}

