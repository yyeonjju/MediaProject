//
//  MovieRecommendationViewController.swift
//  MediaProject
//
//  Created by 하연주 on 6/25/24.
//

import UIKit

enum MovieRecommendationType : String {
    case similar
    case recommendations
    
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
    
    // MARK: - Properties
    var movieId : Int?
    var movieTitle : String?
    var recommendationList : [MovieRecommendationType : MovieRecommendaion] = [:]
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupBackgroundColor()
        getData()
    
    }
    
    // MARK: - SetupDelegate
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
                self.recommendationList[.similar] = value

                dispatchGroup.leave()
            }
        }
        
        dispatchGroup.enter()
        DispatchQueue.global().async(group:dispatchGroup){
            APIFetcher.shared.getRecommendationMovieData(type: .recommendations, movieId: movieId){ [weak self] value in
                guard let self else {return }
                self.recommendationList[.recommendations] = value

                dispatchGroup.leave()
            }
        }
        
        dispatchGroup.notify(queue: .main){[weak self] in
            guard let self else {return }
            print("⭐️⭐️⭐️⭐️", self.recommendationList)
        }
    }
    // MARK: - PageTransition
}
