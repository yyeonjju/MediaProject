//
//  MovieRecommendationViewController.swift
//  MediaProject
//
//  Created by 하연주 on 6/25/24.
//

import UIKit
import Kingfisher

enum MovieRecommendationType : Int {
    case similar
    case recommendations
    
    var typeString : String {
        get{
            switch self {
            case .similar:
                return "similar"
            case .recommendations:
                return "recommendations"
            }
        }
    }
    
    var sectionTitle : String {
        get{
            switch self {
            case .similar:
                return "비슷한 영화"
            case .recommendations:
                return "추천 영화"
            }
        }

    }
}


final class MovieRecommendationViewController : UIViewController {
    // MARK: - UI
    let viewManager = MovieRecommendationView()
    
    // MARK: - Properties
    var movieId : Int?
    var movieTitle : String?
    var recommendationList : [[MovieRecommendaionResult]] = [[MovieRecommendaionResult(posterPath: "")], [MovieRecommendaionResult(posterPath: "")]]
    
    // MARK: - Lifecycle
    
    override func loadView() {
        view = viewManager
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = movieTitle ?? "-"
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        setupBackgroundColor()

        getData()
        setupDelegate()
    
    }
    
    // MARK: - SetupDelegate
    private func setupDelegate() {
        viewManager.tableView.dataSource = self
        viewManager.tableView.delegate = self
        viewManager.tableView.register(MovieRecommendationTableViewCell.self, forCellReuseIdentifier: MovieRecommendationTableViewCell.identifier)
    }
    
    // MARK: - AddTarget
    private func setupAddTarget() {
    }
    // MARK: - EventSelector
    // MARK: - SetupUI
    // MARK: - APIFetch
    
    private func getData(){
        
        guard let movieId else {return }
        
        let dispatchGroup = DispatchGroup()
        
        dispatchGroup.enter()
        DispatchQueue.global().async(group:dispatchGroup) {
            APIFetcher.shared.getRecommendationMovieData(type: .similar, movieId: movieId){ [weak self] value in
                guard let self else {return }
                self.recommendationList[MovieRecommendationType.similar.rawValue] = value.results

                dispatchGroup.leave()
            }
        }
        
        dispatchGroup.enter()
        DispatchQueue.global().async(group:dispatchGroup){
            APIFetcher.shared.getRecommendationMovieData(type: .recommendations, movieId: movieId){ [weak self] value in
                guard let self else {return }
                self.recommendationList[MovieRecommendationType.recommendations.rawValue] = value.results

                dispatchGroup.leave()
            }
        }
        
        dispatchGroup.notify(queue: .main){[weak self] in
            guard let self else {return }
            self.viewManager.tableView.reloadData()
        }
    }
    // MARK: - PageTransition
}


extension MovieRecommendationViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recommendationList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MovieRecommendationTableViewCell.identifier, for: indexPath) as! MovieRecommendationTableViewCell
        cell.collectionView.dataSource = self
        cell.collectionView.delegate = self
        cell.collectionView.register(MovieRecommendationCollectionViewCell.self, forCellWithReuseIdentifier: MovieRecommendationCollectionViewCell.identifier)
        cell.sectionTitleLabel.text = MovieRecommendationType(rawValue: indexPath.row)?.sectionTitle
        
        cell.collectionView.tag = indexPath.row
        cell.collectionView.reloadData()
        return cell
    }
}

extension MovieRecommendationViewController : UICollectionViewDelegate, UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return recommendationList[collectionView.tag].count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieRecommendationCollectionViewCell.identifier, for: indexPath) as! MovieRecommendationCollectionViewCell
        let data = recommendationList[collectionView.tag][indexPath.row]
        
        let url = URL(string: "\(APIURL.tmdbImagePrefixURL)\(data.posterPath ?? "")")
        cell.posterImageView.kf.setImage(with: url)
        return cell
    }
}
