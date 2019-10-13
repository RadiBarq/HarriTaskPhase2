//
//  HomeTableViewController.swift
//  HarriTask
//
//  Created by Harri on 10/10/19.
//  Copyright © 2019 Harri. All rights reserved.
//

import UIKit

class HomeTableViewController: UITableViewController {
    
    var homeModel = HomeModel()
    
    var customRefreshControl: UIRefreshControl = {
        var refreshControl = UIRefreshControl()
        refreshControl.tintColor = UIColor(red: 74/255 , green: 144/255, blue: 226/255, alpha: 255/255)
        refreshControl.addTarget(self, action: #selector(refreshClicked), for: UIControl.Event.valueChanged)
        return refreshControl
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.refreshControl = customRefreshControl
        self.tableView.tableHeaderView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 0.0, height: Double(Float.leastNormalMagnitude)))
        homeModel.getUserSearch() { result in
            DispatchQueue.main.sync {
                self.tableView.reloadData()
            }
        }
    }
    
    @objc func refreshClicked(sender:AnyObject) {
        homeModel.start = 0
        homeModel.result = []
         self.tableView.reloadData()
        
        homeModel.getUserSearch() { result in
            DispatchQueue.main.sync {
                self.tableView.reloadData()
                self.customRefreshControl.endRefreshing()
            }
        }
    }
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return homeModel.result.count
    }
    
    override func tableView(_ tableView: UITableView, shouldSpringLoadRowAt indexPath: IndexPath, with context: UISpringLoadedInteractionContext) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "normalCell", for: indexPath) as! HomeTableViewCell
        let item = self.homeModel.result[indexPath.row]
        cell.nameLabel.text = item.firstName + " " + item.lastName
        let imageURL = homeModel.getImageURLFor(userId: item.id, imageUDID: item.profileImageUUID)
        cell.profileImage.setup(imageUrl: imageURL, fullName: "Profile Image")
        if item.isFirstJob {
            cell.setFirstJobFont()
        } else {
            if let position = item.position {
                cell.setAttributedJobFont(positionName: position.name, positionBrand: position.brandName)
            }
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        if !customRefreshControl.isRefreshing {
            let footerView = HomeTableFooterView()
            return footerView
        }
        return UIView()
    }
    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 105.5
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == homeModel.result.count - 1 {
            homeModel.getUserSearch() { result in
                DispatchQueue.main.sync {
                    self.tableView.reloadData()
                }
            }
        }
    }
}



