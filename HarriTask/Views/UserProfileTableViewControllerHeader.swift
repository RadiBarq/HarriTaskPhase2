//
//  UserProfileTableViewControllerHeader.swift
//  HarriTask
//
//  Created by Harri on 10/24/19.
//  Copyright © 2019 Harri. All rights reserved.
//

import UIKit

class UserProfileTableViewSectionHeader: UITableViewHeaderFooterView {
    let customLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.black
        label.textAlignment = .left
        label.font = UIFont(name: "OpenSans", size: 16)
        return label
    }()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setupLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(representable: UserProfileSectionHeaderRepresentable) {
        customLabel.text = representable.title
    }
    
    func setupLabel() {
        addSubview(customLabel)
        customLabel.translatesAutoresizingMaskIntoConstraints = false
        customLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        customLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
    }
    
    static func getReuseIdentifier() -> String {
        return "UserProfileTableViewControllerHeader"
    }
}
