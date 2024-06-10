//
//  TrendDetailViewController.swift
//  MediaProject
//
//  Created by 하연주 on 6/10/24.
//

import UIKit

class TrendDetailViewController: UIViewController {
    // MARK: - UI
    let viewManager = MovieCreditView()

    
    // MARK: - Properties
    var movieId : Int?
    var movieData : MovieTrendResult?
    var movieCreditData : MovieCredit?
    
    
    // MARK: - Lifecycle
    override func loadView() {
        view = viewManager
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        getMovieTrendData()
        configureData()
    }
    
    
    // MARK: - APIFetch
    private func getMovieTrendData () {
        guard let movieId else {return }
        APIFetcher().getMovieCreditData(movieID: movieId) { [weak self] movieCredit in
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
