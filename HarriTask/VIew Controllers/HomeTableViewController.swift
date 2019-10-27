//
//  HomeTableViewController.swift
//  HarriTask
//
//  Created by Harri on 10/10/19.
//  Copyright © 2019 Harri. All rights reserved.
//

import UIKit

class HomeTableViewController: UITableViewController {
    // Home model
    var homeModel = HomeModel()
    
    // Home view model
    var viewModel = HomeTableViewModel(items: [])
    
    var customRefreshControl: UIRefreshControl = {
        var refreshControl = UIRefreshControl()
        refreshControl.tintColor = UIColor(red: 74/255 , green: 144/255, blue: 226/255, alpha: 255/255)
        return refreshControl
    }()
    
    var tableHeaderView: UIView? = {
        UIView(frame: CGRect(x: 0.0, y: 0.0, width: 0.0, height: Double(Float.leastNormalMagnitude)))
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        self.getInitialData()
    }
    
    //Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        viewModel.numberOfSections()
    }
    
    // Number of rows in section
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        viewModel.representables.count
    }
    
    // Shoud spring load at row
    override func tableView(_ tableView: UITableView, shouldSpringLoadRowAt indexPath: IndexPath, with context: UISpringLoadedInteractionContext) -> Bool {
        viewModel.shouldSpringLoadRowAt(at: indexPath)
    }
    
    // Cell for row
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cellRepresentable = self.viewModel.representableForRow(at: indexPath), let cell = tableView.dequeueReusableCell(withIdentifier: cellRepresentable.cellReuseIdentifier, for: indexPath) as? HomeTableViewCell {
            cell.setup(representable: cellRepresentable)
            return cell
        }
        return UITableViewCell()
    }
    
    // View foor footer
    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        viewModel.viewForFooterInSection(inSection: section)
    }
    
    // Height for footer in section
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        viewModel.heightForFooterInSection(inSection: section)
    }
    
    // Will display cell for row
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        // Detect when user scroll to the bottom of the tableview
        if indexPath.row == viewModel.representables.count - 1{
            homeModel.getUserSearch(start: indexPath.row) { result in
                DispatchQueue.main.sync {
                    self.viewModel.add(items: result)
                    self.viewModel.buildRepresentables(from: indexPath.row)
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    // Get inital data
    @objc func getInitialData() {
        homeModel.getUserSearch(start: 0) { result in
            DispatchQueue.main.sync {
                self.viewModel = HomeTableViewModel(items: result)
                self.viewModel.buildRepresentables(from: 0)
                self.tableView.reloadData()
                self.refreshControl?.endRefreshing()
            }
        }
    }
    // Setup table view
    func setupTableView() {
        self.refreshControl = customRefreshControl
        refreshControl?.addTarget(self, action: #selector(getInitialData), for: UIControl.Event.valueChanged)
        self.tableView.tableHeaderView = tableHeaderView
    }
}
