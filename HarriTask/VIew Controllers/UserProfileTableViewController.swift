//
//  UserProfileTableViewController.swift
//  HarriTask
//
//  Created by Harri on 10/24/19.
//  Copyright © 2019 Harri. All rights reserved.
//

import UIKit

class UserProfileTableViewController: UITableViewController, UITableViewCellDelegate {
    let model = UserProfileModel(userId: "66811")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        model.getUserProfile() { result in
            switch result {
            case .success(let response): print(response)
            case .failure(let error): print(error)
            }
        }
        tableView.register(UserProfileTableViewControllerHeader.self ,forHeaderFooterViewReuseIdentifier: UserProfileTableViewControllerHeader.getReuseIdentifier())
        tableView.register(UserProfileTableViewHeaderView.self, forHeaderFooterViewReuseIdentifier: UserProfileTableViewHeaderView.getReuseIdentifier())
    }
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 271
        } else {
            return 66.0
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if section == 0 {
            return 0
        } else {
            return 10
        }
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            return tableView.dequeueReusableHeaderFooterView(withIdentifier: UserProfileTableViewHeaderView.getReuseIdentifier())
        }
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: UserProfileAboutTableViewCell.getReuseIdentifier())
        return headerView
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //let cell = tableView.dequeueReusableCell(withIdentifier: "UserExperienceCell", for: indexPath)
        let cell: UITableViewCell
        
//        switch indexPath.section {
//        case 1:
//            cell = tableView.dequeueReusableCell(withIdentifier: UserProfileAboutTableViewCell.getReuseIdentifier(), for: indexPath) as! UserProfileAboutTableViewCell
//        case 2:
//        case 3:
//        case 4:
//        default:
//            return
        
        cell = UITableViewCell()
        return cell
//        let cell = tableView.dequeueReusableCell(withIdentifier: UserProfileAboutTableViewCell.getReuseIdentifier(), for: indexPath) as! UserProfileAboutTableViewCell
//        cell.delegate = self
//        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
    
    
    func didChangeHeight() {
        self.tableView.beginUpdates()
        self.tableView.endUpdates()
    }
}
