//
//  TrendViewController.swift
//  MediaProject
//
//  Created by 하연주 on 6/10/24.
//

import UIKit

class TrendViewController: UIViewController {
    
    // MARK: - UI
    let viewManager = TrendView()
    
    // MARK: - Properties
    
    
    // MARK: - Lifecycle
    override func loadView() {
        view = viewManager
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupDelegate()
    }
    
    // MARK: - SetupDelegate
    private func setupDelegate() {
        viewManager.trendListTableView.dataSource = self
        viewManager.trendListTableView.delegate = self
        
        viewManager.trendListTableView.register(TrendTableViewCell.self, forCellReuseIdentifier: TrendTableViewCell.identifier)
    }
    
    // MARK: - APIFetch
    


}
