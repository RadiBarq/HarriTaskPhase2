//
//  HomeTableViewRepresentable.swift
//  HarriTask
//
//  Created by Harri on 10/16/19.
//  Copyright © 2019 Harri. All rights reserved.
//

import Foundation
import UIKit

class HomeTableViewRepresentable: BaseCellRepresentable {
    var fullName = String()
    var position = NSMutableAttributedString()
    var cellReuseIdentifier = HomeTableViewCell.getReuseIdentifier()
    var imageURL = String()
    
    required init(item: UserSearchResult) {
        setFullName(firstName: item.firstName, lastName: item.lastName)
        setImageURLFor(userId: item.id, imageUUID: item.profileImageUUID)
        if let position = item.position {
            setJobPosition(isFirstJob: item.isFirstJob, positionName: position.name, positionBrand: position.brandName)
        } else {
            setFirstJobPosition()
        }
    }
    
    //    init(firstName: String, lastName: String, position: Position?, isFirstJob: Bool, userId: Int, imageUUID: String?) {
    //
    //
    //        guard let searchResult =
    //
    //        setFullName(firstName: firstName, lastName: lastName)
    //        setImageURLFor(userId: userId, imageUUID: imageUUID)
    //
    //        if let position = position {
    //            setJobPosition(isFirstJob: isFirstJob, positionName: position.name, positionBrand: position.brandName)
    //        } else {
    //            setFirstJobPosition()
    //        }
    //    }
    //
    private func setFullName(firstName: String, lastName: String) {
        fullName = firstName + " " + lastName
    }
    
    private func setJobPosition(isFirstJob: Bool, positionName: String, positionBrand: String) {
        if isFirstJob {
            setFirstJobPosition()
        } else {
            let attributedText = NSMutableAttributedString(string: positionName + ", ", attributes: [NSAttributedString.Key.font: UIFont(name: "OpenSans-Semibold", size: 14)!, NSAttributedString.Key.foregroundColor: UIColor.black])
            attributedText.append(NSAttributedString(string: positionBrand, attributes: [NSAttributedString.Key.font: UIFont(name: "OpenSans", size: 14)!, NSAttributedString.Key.foregroundColor: UIColor.black]))
            self.position = attributedText
        }
    }
    
    private func setFirstJobPosition() {
        var attributedText = NSMutableAttributedString()
        attributedText = NSMutableAttributedString(string: "Is looking for their first job", attributes: [NSAttributedString.Key.font: UIFont(name: "OpenSans-Italic", size: 12)!, NSAttributedString.Key.foregroundColor: UIColor.black])
        self.position = attributedText
    }
    
    private func setImageURLFor(userId: Int, imageUUID: String?) {
        if let imageUUID = imageUUID {
            let imageURL = NetworkManager.imageURLString + String(userId) + "/user_profile/" + imageUUID + "/240_240.jpeg"
            self.imageURL = imageURL
        }
    }
}
