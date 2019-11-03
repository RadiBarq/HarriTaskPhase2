//
//  ExperienceTableViewCell.swift
//  HarriTask
//
//  Created by Harri on 10/24/19.
//  Copyright © 2019 Harri. All rights reserved.
//

import UIKit

class UserExperienceTableViewCell: UITableViewCell, BaseCell {
    @IBOutlet weak var brandName: UILabel!
    @IBOutlet weak var jobTilte: UILabel!
    @IBOutlet weak var jobDescription: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    func setup(representable: UserProfileExperienceRepresentable) {
        jobTilte.text = representable.positionTitle
        brandName.text = representable.brandName
        jobDescription.text = representable.positionDescription
     }
    
    class func getReuseIdentifier() -> String {
          return "UserExperienceTableViewCell"
      }
}
