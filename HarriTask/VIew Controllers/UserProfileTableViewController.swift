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
    var topView : UIView = UIView.init(frame: .zero)
    let rect: CGRect = CGRect()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UserProfileTableViewSectionHeader.self ,forHeaderFooterViewReuseIdentifier: UserProfileTableViewSectionHeader.getReuseIdentifier())
        tableView.register(UserProfileTableViewHeaderView.self, forHeaderFooterViewReuseIdentifier:  UserProfileTableViewHeaderView.getReuseIdentifier())
        initNavigationBar()
        addStatusBarBackgroundView(viewController: self)
        self.navigationController?.navigationBar.topItem?.title = ""
        self.tableView.contentInset = UIEdgeInsets(top: -self.navigationController!.navigationBar.frame.height - self.navigationController!.view.safeAreaInsets.top ,left: 0,bottom: 0,right: 0)
    }
    
    func getUserProfileWith(userid: String, userName: String) {
        model = UserProfileModel(userId: userid)
        viewModel = UserProfileTableViewModel(items: [])
        self.viewModel.userName = userName
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
        self.viewModel.numberOfRows(inSection: section)
    }
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let y = scrollView.contentOffset.y
        if y <= 0 {
            setNavigationBar(alpha: 0.0)
            self.navigationItem.title = ""
            self.navigationController?.navigationBar.tintColor = UIColor.white
            self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white]
        } else if y > 0 && y <= 232 - (self.navigationController?.view.safeAreaInsets.top ?? 44) {
            setNavigationBar(alpha: y/(232 - (self.navigationController?.view.safeAreaInsets.top ?? 44)))
            self.navigationController?.navigationBar.tintColor = UIColor.white
            self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
            self.navigationItem.title = viewModel.userName
        } else {
             setNavigationBar(alpha: 1)
              self.navigationController?.navigationBar.tintColor = UIColor(red: 74/255, green: 144/255, blue: 226/255, alpha: 1)
             self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor:  UIColor(red: 74/255, green: 144/255, blue: 226/255, alpha: 1)]
             self.navigationItem.title = viewModel.userName
        }
        topView.frame = CGRect.init(x: topView.frame.origin.x, y: scrollView.contentOffset.y, width: topView.frame.width, height: topView.frame.height)
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
        initNavigationBarToDefault()
    }
    
    func initNavigationBarToDefault() {
        setNavigationBar(alpha: 1.0)
        self.navigationController?.navigationBar.setBackgroundImage(nil, for: UIBarMetrics.default);
        self.navigationController?.navigationBar.shadowImage = nil
        self.navigationController?.view.backgroundColor = UIColor.clear
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 74/255, green: 144/255, blue: 226/255, alpha: 1)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
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
    
    func setNavigationBar(alpha: CGFloat) {
        self.navigationController?.navigationBar.backgroundColor = UIColor.white.withAlphaComponent(alpha)
        topView.backgroundColor = UIColor.white.withAlphaComponent(alpha)
    }
    
    func initNavigationBar() {
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default);
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.view.backgroundColor = UIColor.clear
        self.navigationController?.navigationBar.barTintColor = UIColor.white
        self.navigationController?.navigationBar.tintColor = UIColor.white
    }
    
    func addStatusBarBackgroundView(viewController: UIViewController) -> Void {
        let rect = CGRect(origin: CGPoint(x: 0, y: 0), size:CGSize(width: UIScreen.main.bounds.size.width, height: self.navigationController!.view.safeAreaInsets.top))
        topView = UIView.init(frame: rect)
        topView.layer.zPosition = 1
        viewController.view?.addSubview(topView)
    }
    
    func didChangeHeight() {
        self.tableView.beginUpdates()
        self.tableView.endUpdates()
    }
}
