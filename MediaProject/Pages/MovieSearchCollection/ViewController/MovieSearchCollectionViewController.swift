//
//  MovieSearchCollectionViewController.swift
//  MediaProject
//
//  Created by 하연주 on 6/12/24.
//

import UIKit

class MovieSearchCollectionViewController: UIViewController {
    // MARK: - UI
    let viewManager = MovieSearchCollectionView()
    
    // MARK: - Properties
    var searchedMovieData : MovieSearch? {
        didSet{
            viewManager.movieCollectionView.reloadData()
        }
    }
    
    
    // MARK: - Lifecycle
    override func loadView() {
        view = viewManager
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        configureDelegate()
    }
    
    // MARK: - SetupDelegate
    
    private func configureDelegate() {
        viewManager.movieSearchBar.delegate = self
        
        viewManager.movieCollectionView.delegate = self
        viewManager.movieCollectionView.dataSource = self
        viewManager.movieCollectionView.register(MovieSearchCollectionViewCell.self, forCellWithReuseIdentifier: MovieSearchCollectionViewCell.identifier)
        
        
    }
    
    // MARK: - APIFetch
    func getMovieSearchData() {
        APIFetcher().getMovieSearchData(text: viewManager.movieSearchBar.text ?? "", page: 1){ [weak self] movieData in
            guard let self else{return }
//            if page == 1 {
                self.searchedMovieData = movieData
                
//                if !self.searchedMovieData!.results.isEmpty {
//                    self.viewManager.movieTableView.scrollToRow(at: IndexPath(row: 0, section: 0), at: .top, animated: false)
//                }
//            }else {
//                self.searchedMovieData?.results.append(contentsOf: movieData.results)
//            }

            
        }
    }

}

extension MovieSearchCollectionViewController : UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let searchedMovieData else {return 0}
        return searchedMovieData.results.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieSearchCollectionViewCell.identifier, for: indexPath) as! MovieSearchCollectionViewCell
        guard let searchedMovieData else {return cell}
        let rowData = searchedMovieData.results[indexPath.row]
        cell.configureData(data: rowData)
        return cell
    }
}

extension MovieSearchCollectionViewController : UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
//        page = 1
        getMovieSearchData()
    }
}
