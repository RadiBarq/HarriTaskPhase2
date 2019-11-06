//
//  UserProfileAboutTableViewCell.swift
//  HarriTask
//
//  Created by Harri on 10/30/19.
//  Copyright © 2019 Harri. All rights reserved.
//

import UIKit

class UserProfileAboutTableViewCell: BaseTableViewCell, UITextViewDelegate {
    @IBOutlet var textViewHeight: NSLayoutConstraint!
    @IBOutlet var textView: UITextView!
    weak var delegate: UITableViewCellDelegate?
    var fullBioString = String()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupTextView()
    }
    
    func setupTextView(){
        textView.delegate = self
        textView.isSelectable = true
        textView.isEditable = false
        textView.isUserInteractionEnabled = true
    }
    
    func setup(representable: UserProfileAboutRepresentable) {
        self.fullBioString = representable.bioString
        let truncatedString = String(representable.bioString.prefix(200))
        let attributedString = NSMutableAttributedString()
        attributedString.append(NSAttributedString(string: truncatedString, attributes: [NSAttributedString.Key.font: UIFont(name: "OpenSans", size: 14)!, NSAttributedString.Key.foregroundColor: UIColor.black]))
        
        attributedString.append(NSAttributedString(string: "Show more", attributes: [NSAttributedString.Key.font: UIFont(name: "OpenSans", size: 14)!, NSAttributedString.Key.foregroundColor: UIColor.blue]))
        attributedString.addAttribute(.link, value: "https://www.hackingwithswift.com", range: NSRange(location: attributedString.length - 9, length: 9))
        textView.attributedText = attributedString
    }
    
    func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange, interaction: UITextItemInteraction) -> Bool {
           changeHeight()
           return false
    }
    
    func changeHeight() {
         let attributedString = NSMutableAttributedString()
        attributedString.append(NSAttributedString(string: self.fullBioString, attributes: [NSAttributedString.Key.font: UIFont(name: "OpenSans", size: 14)!, NSAttributedString.Key.foregroundColor: UIColor.black]))
        textView.attributedText = attributedString
        let sizeThatShouldFitTheContent = textView.sizeThatFits(textView.frame.size)
        let height = sizeThatShouldFitTheContent.height
        textViewHeight.constant = height
        delegate?.didChangeHeight()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    class func getReuseIdentifier() -> String {
        return "UserProfileAboutTableViewCell"
    }
}
