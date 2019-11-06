//
//  UserProfileTableViewController.swift
//  HarriTask
//
//  Created by Harri on 10/24/19.
//  Copyright © 2019 Harri. All rights reserved.
//

import UIKit

class UserProfileTableViewController: UITableViewController, UITableViewCellDelegate {
    var model: UserProfileModel!
    var viewModel: UserProfileTableViewModel! = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        model = UserProfileModel(userId: "66811")
        viewModel = UserProfileTableViewModel(items: [])
        model.getUserProfile() { result in
            switch result {
            case .success(let response):
                self.viewModel.add(items: [response])
                self.tableView.reloadData()
            case .failure(let error):
                print(error)
            }
        }
        tableView.register(UserProfileTableViewControllerHeader.self ,forHeaderFooterViewReuseIdentifier: UserProfileTableViewControllerHeader.getReuseIdentifier())
        tableView.register(UserProfileTableViewHeaderView.self, forHeaderFooterViewReuseIdentifier: UserProfileTableViewHeaderView.getReuseIdentifier())
    }
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        viewModel.numberOfSections()
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        viewModel.heightForRow(in: section)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        self.viewModel.numberOfRows(inSection: section)
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            return tableView.dequeueReusableHeaderFooterView(withIdentifier: UserProfileTableViewHeaderView.getReuseIdentifier())
        }
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: UserProfileAboutTableViewCell.getReuseIdentifier())
        return headerView
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print(indexPath.section)
        if let cellRepresentable = self.viewModel.representableForRow(at: indexPath) {
            var cell = tableView.dequeueReusableCell(withIdentifier: cellRepresentable.cellReuseIdentifier, for: indexPath)
            if let currentCell = cell as? UserProfileAboutTableViewCell {
                currentCell.setup(representable: cellRepresentable)
                return currentCell
            } else if let currentCell = cell as? UserProfileWithCollectionViewTableViewCell {
                currentCell.setup(representable: cellRepresentable)
                return currentCell
            } else if let currentCell = cell as? UserExperienceTableViewCell {
                currentCell.setup(representable: cellRepresentable)
                return currentCell
            } else {
                return UITableViewCell()
            }
        }
        return UITableViewCell()
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
    
    func didChangeHeight() {
        self.tableView.beginUpdates()
        self.tableView.endUpdates()
    }
}
