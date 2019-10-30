//
//  UserProfileAboutTableViewCell.swift
//  HarriTask
//
//  Created by Harri on 10/30/19.
//  Copyright © 2019 Harri. All rights reserved.
//

import UIKit

class UserProfileAboutTableViewCell: UITableViewCell, UITextViewDelegate {
    @IBOutlet var textViewHeight: NSLayoutConstraint!
    @IBOutlet var textView: UITextView!
    weak var delegate: UITableViewCellDelegate?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setup()
    }
    
    func setup() {
        self.textView.delegate = self
        let attributedString = NSMutableAttributedString(string: "Hi! My name is Helen. I'm 23 and a NJ native. I graduated from Elon University in North Carolina in 2013 with a BFA in dance performance and choreography and a BA in psychology. I'm so excited to finally live in New York. I'm here because … ")
        attributedString.append(NSAttributedString(string: "Show more", attributes: [NSAttributedString.Key.font: UIFont(name: "OpenSans", size: 14)!, NSAttributedString.Key.foregroundColor: UIColor.blue]))
        attributedString.addAttribute(.link, value: "https://www.hackingwithswift.com", range: NSRange(location: attributedString.length - 9, length: 9))
        textView.attributedText = attributedString
        textView.isSelectable = true
        textView.isEditable = false
        textView.isUserInteractionEnabled = true
    }
    
    func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange, interaction: UITextItemInteraction) -> Bool {
           changeHeight()
           return false
    }
    
    func changeHeight() {
        
        let attributedString = NSMutableAttributedString(string: "Hi! My name is Helen. I'm 23 and a NJ native. I graduated from Elon University in North Carolina in 2013 with a BFA in dance performance and choreography and a BA in psychology. I'm so excited to finally live in New York. I'm here because Hi! My name is Helen. I'm 23 and a NJ native. I graduated from Elon University in North Carolina in 2013 with a BFA in dance performance and choreography and a BA in psychology. I'm so excited to finally live in New York. I'm here because Hi! My name is Helen. I'm 23 and a NJ native. I graduated from Elon University in North Carolina in 2013 with a BFA in dance performance and choreography and a BA in psychology. I'm so excited to finally live in New York. I'm here because Hi! My name is Helen. I'm 23 and a NJ native. I graduated from Elon University in North Carolina in 2013 with a BFA in dance performance and choreography and a BA in psychology. I'm so excited to finally live in New York. I'm here because Hi! My name is Helen. I'm 23 and a NJ native. I graduated from Elon University in North Carolina in 2013 with a BFA in dance performance and choreography and a BA in psychology. I'm so excited to finally live in New York. I'm here because Hi! My name is Helen. I'm 23 and a NJ native. I graduated from Elon University in North Carolina in 2013 with a BFA in dance performance and choreography and a BA in psychology. I'm so excited to finally live in New York. I'm here because")
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
