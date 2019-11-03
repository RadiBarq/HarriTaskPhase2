//
//  UserProfileWithCollectionViewTableViewCell.swift
//  HarriTask
//
//  Created by Harri on 10/24/19.
//  Copyright © 2019 Harri. All rights reserved.
//

import UIKit

class UserProfileWithCollectionViewTableViewCell: UITableViewCell, BaseCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var collectionViewHieght: NSLayoutConstraint!
    
    var textArray = [UserSkill]()
    
    func setup(representable: UserProfileSkillRepresentable) {
        self.textArray = representable.titleArray
        self.collectionView.reloadData()
        self.calculateHeight()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        textArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "UserProfileCollectionViewCell", for: indexPath) as! UserProfileCollectionViewCell
        cell.skillTitle.text = textArray[indexPath.row].name
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: textArray[indexPath.row].name.size(withAttributes: [
            NSAttributedString.Key.font : UIFont.systemFont(ofSize: 17)]).width + 35, height: 32)
    }
    
    static func getReuseIdentifier() -> String {
        return "UserProfileWithCollectionViewTableViewCell"
    }
    
    //    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    //            let label = UILabel(frame: CGRect.zero)
    //            label.text = textArray[indexPath.item]
    //            label.sizeToFit()
    //            return CGSize(width: label.frame.width, height: 32)
    //    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        calculateHeight()
    }
    
    func calculateHeight() {
        let height = collectionView.collectionViewLayout.collectionViewContentSize.height
        collectionViewHieght.constant = height
        self.layoutIfNeeded()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
}

class UserProfileWithCollectionViewCellFlowLayout: UICollectionViewFlowLayout {
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        let attributesForElements = super.layoutAttributesForElements(in: rect)
        var newAttributesForElements = [AnyObject]()
        var leftMargin: CGFloat = 0
        for attributes in attributesForElements! {
            let currentAttributes = attributes
            if (currentAttributes.frame.origin.x == sectionInset.left) {
                leftMargin = self.sectionInset.left
            } else {
                var newFrame = currentAttributes.frame
                newFrame.origin.x = leftMargin
                currentAttributes.frame = newFrame
            }
            leftMargin += currentAttributes.frame.size.width + 12
            newAttributesForElements.append(currentAttributes)
        }
        return attributesForElements
    }
}

