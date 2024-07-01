//
//  MovieHomeViewController.swift
//  MediaProject
//
//  Created by 하연주 on 6/4/24.
//

import UIKit
import SnapKit
import Kingfisher

final class MovieHomeViewController: UIViewController {
    // MARK: - UI
    let viewManager = MovieHomeView()
    
    // MARK: - Properties
    var upcomingMovieData : UpcomingMovie? {
        didSet {
            guard let upcomingMovieData, !upcomingMovieData.results.isEmpty else {return }
            let firstMovie = upcomingMovieData.results[0]
            let url = URL(string: "\(APIURL.tmdbImagePrefixURL)\(firstMovie.poster_path)")
            viewManager.mainImageView.kf.setImage(with: url)
            
            viewManager.upcomingMovieCollectionView.reloadData()
        }
    }

    
    // MARK: - Lifecycle
    override func loadView() {
        view = viewManager
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "곧 개봉될 영화"
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        setupBackgroundColor()
        viewManager.upcomingMovieCollectionView.backgroundColor = .black
        getUpcomingMovie()
        setupDelegate()
    }
    
    // MARK: - SetupDelegate
    private func setupDelegate() {
        viewManager.upcomingMovieCollectionView.dataSource = self
        viewManager.upcomingMovieCollectionView.delegate = self
        viewManager.upcomingMovieCollectionView.register(UpcomingMovieCollectionViewCell.self, forCellWithReuseIdentifier: UpcomingMovieCollectionViewCell.identifier)
    }
    
    
    // MARK: - APIFetch
    private func getUpcomingMovie() {
        APIFetcher.shared.getUpcomingMovieData() { [weak self] value in
            guard let self else {return }
            
            self.upcomingMovieData = value
        }
    }
}


extension MovieHomeViewController : UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: UpcomingMovieCollectionViewCell.identifier, for: indexPath) as! UpcomingMovieCollectionViewCell
        guard var upcomingMovieData else {return cell}
        upcomingMovieData.results.removeFirst()
        let data = upcomingMovieData.results[indexPath.row]
        cell.configureData(data: data)
        return cell
    }
}
