//
//  MovieSearchViewController.swift
//  MediaProject
//
//  Created by 하연주 on 6/11/24.
//

import UIKit

class MovieSearchViewController: UIViewController {
    // MARK: - UI
    let viewManager = MovieSearchView()
    
    // MARK: - Properties
    var searchedMovieData : MovieSearch? {
        didSet{
            viewManager.movieTableView.reloadData()
        }
    }

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
        viewManager.movieSearchBar.delegate = self
        
        viewManager.movieTableView.dataSource = self
        viewManager.movieTableView.delegate = self
        viewManager.movieTableView.register(SearchedMovieTableViewCell.self, forCellReuseIdentifier: SearchedMovieTableViewCell.identifier)
        
    }
    
    // MARK: - APIFetch
    func getMovieSearchData() {
        APIFetcher().getMovieSearchData(text: viewManager.movieSearchBar.text ?? ""){ [weak self] movieData in
            guard let self else{return }
            self.searchedMovieData = movieData
            
        }
    }
}



extension MovieSearchViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchedMovieData?.results.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SearchedMovieTableViewCell.identifier, for: indexPath) as! SearchedMovieTableViewCell
        let rowData = searchedMovieData?.results[indexPath.row]
        guard let rowData else {return cell}
        cell.configureData(data: rowData)
        return cell
    }
}

extension MovieSearchViewController : UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        getMovieSearchData()
    }
}
