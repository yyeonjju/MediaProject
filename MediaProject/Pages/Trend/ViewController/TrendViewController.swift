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
    
    var movieGenre : [Genre]? {
        didSet{
            getMovieTrendData()
        }
    }
    
    
    // MARK: - Lifecycle
    override func loadView() {
        view = viewManager
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "지금 핫한 영화"
        setupDelegate()
        getMovieGenreData()
    }
    
    // MARK: - SetupDelegate
    private func setupDelegate() {
        viewManager.trendListTableView.dataSource = self
        viewManager.trendListTableView.delegate = self
        
        viewManager.trendListTableView.register(TrendTableViewCell.self, forCellReuseIdentifier: TrendTableViewCell.identifier)
    }
    
    // MARK: - APIFetch
    private func getMovieTrendData () {
        APIFetcher.shared.getMovieTrendData { [weak self] movieTrend in
            guard let self else{return }
            self.moviesData = movieTrend.results
        }
    }
    
    private func getMovieGenreData() {
        APIFetcher.shared.getMovieGenreData { [weak self] genreData in
            guard let self else{return }
            self.movieGenre = genreData.genres
        }
    }
    
    // MARK: - Method
    func makeGenreNameArray (genreIDS : [Int]) -> [String] {
        guard let movieGenre else {return []}
        let result : [String] = genreIDS.map{ id in
            let indexInGenresData = movieGenre.firstIndex{item in item.id == id}
            return movieGenre[indexInGenresData!].name
        }
        return result
    }



}
