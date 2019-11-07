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
        viewModel = UserProfileTableViewModel(items: [])
        tableView.register(UserProfileTableViewSectionHeader.self ,forHeaderFooterViewReuseIdentifier: UserProfileTableViewSectionHeader.getReuseIdentifier())
        tableView.register(UserProfileTableViewHeaderView.self, forHeaderFooterViewReuseIdentifier:  UserProfileTableViewHeaderView.getReuseIdentifier())
        navigationController?.navigationBar.barTintColor = UIColor.white
        self.tableView.contentInset = UIEdgeInsets(top: -44 - self.navigationController!.view.safeAreaInsets.top ,left: 0,bottom: 0,right: 0)
    }
    
    func getUserProfileWith(userid: String) {
        model = UserProfileModel(userId: userid)
        model.getUserProfile() { result in
            switch result {
            case .success(let response):
                self.viewModel.add(items: [response])
                self.tableView.reloadData()
            case .failure(let error):
                print(error)
            }
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        viewModel.numberOfSections()
    }
    
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        viewModel.heightForHeaderInSection(in: section)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        self.viewModel.numberOfRows(inSection: section)
    }
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let y = scrollView.contentOffset.y
        print(y)
        if y <= 0 {
            hideNavigationBar()
        } else if y > 0 && y <= 232 - self.navigationController!.view.safeAreaInsets.top {
            showNavigationBar()
            self.navigationController?.navigationBar.alpha = y/(232 - self.navigationController!.view.safeAreaInsets.top)
        } else {
            self.navigationController?.navigationBar.alpha = 1
        }
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerRepresentable = viewModel.representableHeaderForRow(at: section)
        switch section {
        case 0:
            let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: UserProfileTableViewHeaderView.getReuseIdentifier()) as? UserProfileTableViewHeaderView
            headerView?.setup(representable: headerRepresentable as! UserProfileHeaderRepresentable)
            return headerView
        default:
            let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: UserProfileTableViewSectionHeader.getReuseIdentifier()) as? UserProfileTableViewSectionHeader
            headerView?.setup(representable: headerRepresentable as! UserProfileSectionHeaderRepresentable)
            return headerView
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        showNavigationBar()
        navigationController?.navigationBar.barTintColor = UIColor(red: 74/255, green: 144/255, blue: 226/255, alpha: 1)
        self.navigationController?.navigationBar.alpha = 1
    }
    
//    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
//        if section == 0 {
//            self.navigationController?.navigationBar.barTintColor.alpha = 0.5
//        }
//    }
//
//    override func tableView(_ tableView: UITableView, didEndDisplayingHeaderView view: UIView, forSection section: Int) {
//        if section == 0 {
//            self.navigationController?.navigationBar.alpha = 1.0
//        }
//    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print(indexPath.section)
        if let cellRepresentable = self.viewModel.representableForRow(at: indexPath) {
            let cell = tableView.dequeueReusableCell(withIdentifier: cellRepresentable.cellReuseIdentifier, for: indexPath)
            if let currentCell = cell as? UserProfileAboutTableViewCell {
                currentCell.setup(representable: cellRepresentable as! UserProfileAboutRepresentable)
                currentCell.delegate = self
                return currentCell
            } else if let currentCell = cell as? UserProfileWithCollectionViewTableViewCell {
                currentCell.setup(representable: cellRepresentable as! UserProfileCollectionViewRepresentable)
                return currentCell
            } else if let currentCell = cell as? UserExperienceTableViewCell {
                currentCell.setup(representable: cellRepresentable as! UserProfileExperienceRepresentable)
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
    
    func hideNavigationBar() {
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.view.backgroundColor = .clear
    }
    
    func showNavigationBar() {
        self.navigationController?.navigationBar.setBackgroundImage(nil, for: .default)
        self.navigationController?.navigationBar.shadowImage = nil
    }
    
    func didChangeHeight() {
        self.tableView.beginUpdates()
        self.tableView.endUpdates()
    }
}
