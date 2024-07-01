//
//  TrendDetailViewController.swift
//  MediaProject
//
//  Created by 하연주 on 6/10/24.
//

import UIKit

final class TrendDetailViewController: UIViewController {
    // MARK: - UI
    let viewManager = MovieCreditView()

    
    // MARK: - Properties
    var movieId : Int?
    var movieData : MovieTrendResult?
    var movieCreditData : MovieCredit? {
        didSet{
            viewManager.castTableView.reloadData()
        }
    }
    
    
    // MARK: - Lifecycle
    override func loadView() {
        view = viewManager
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        getMovieTrendData()
        configureData()
        setupDelegate()
    }
    
    // MARK: - SetupDelegate
    private func setupDelegate() {
        viewManager.castTableView.dataSource = self
        viewManager.castTableView.delegate = self
        
        viewManager.castTableView.register(CastTableViewCell.self, forCellReuseIdentifier: CastTableViewCell.identifier)
    }

    
    
    // MARK: - APIFetch
    private func getMovieTrendData () {
        guard let movieId else {return }
        APIFetcher.shared.getMovieCreditData(movieID: movieId) { [weak self] movieCredit in
            guard let self else{return }
            self.movieCreditData = movieCredit
            
        }
    }
    
    // MARK: - ConfigureData
    private func configureData() {
        guard let movieData else {return }
        viewManager.titleLabel.text = movieData.originalTitle
        viewManager.overviewLabel.text = movieData.overview
    }
    


}
