//
//  TrendViewController.swift
//  MediaProject
//
//  Created by 하연주 on 6/10/24.
//

import UIKit
import Alamofire

class TrendViewController: UIViewController {
    
    // MARK: - UI
    let viewManager = TrendView()
    
    // MARK: - Properties
    var moviesData : [MovieTrendResult]? {
        didSet{
            viewManager.trendListTableView.reloadData()
        }
    }
    
    
    // MARK: - Lifecycle
    override func loadView() {
        view = viewManager
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupDelegate()
        getMovieTrendData()
    }
    
    // MARK: - SetupDelegate
    private func setupDelegate() {
        viewManager.trendListTableView.dataSource = self
        viewManager.trendListTableView.delegate = self
        
        viewManager.trendListTableView.register(TrendTableViewCell.self, forCellReuseIdentifier: TrendTableViewCell.identifier)
    }
    
    // MARK: - APIFetch
    private func getMovieTrendData () {
        APIFetcher().getMovieTrendData { [weak self] movieTrend in
            guard let self else{return }
            self.moviesData = movieTrend.results
        }
    }


}
