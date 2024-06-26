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
//            viewManager.movieTableView.reloadData()
        }
    }
    
    var page = 1

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
        
        
        viewManager.movieTableView.prefetchDataSource = self
    }
    
    // MARK: - APIFetch
    func getMovieSearchData() {
        APIFetcher.shared.getMovieSearchData(text: viewManager.movieSearchBar.text ?? "", page: page){ [weak self] movieData in
            guard let self else{return }

            if page == 1 {
                self.searchedMovieData = movieData
                self.viewManager.movieTableView.reloadData()
                
                guard let searchedMovieData = self.searchedMovieData else {return }
                if !searchedMovieData.results.isEmpty {
                    self.viewManager.movieTableView.scrollToRow(at: IndexPath(row: 0, section: 0), at: .top, animated: false)
                }
                
            }else {
                self.searchedMovieData?.results.append(contentsOf: movieData.results)
                self.viewManager.movieTableView.reloadData()
            }
            
        }
    }
}



extension MovieSearchViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let searchedMovieData else {return 0}
        return searchedMovieData.results.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SearchedMovieTableViewCell.identifier, for: indexPath) as! SearchedMovieTableViewCell
        guard let searchedMovieData else {return cell}
        let rowData = searchedMovieData.results[indexPath.row]
        cell.configureData(data: rowData)
        return cell
    }
}

extension MovieSearchViewController : UITableViewDataSourcePrefetching {
    func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
        print(#function, indexPaths)
        guard let searchedMovieData else {return}
        
        for item in indexPaths {
            if searchedMovieData.results.count - 2 == item.row && page < searchedMovieData.totalPages{
                page += 1
                getMovieSearchData()
            }
        }
    }
}

extension MovieSearchViewController : UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        page = 1
        getMovieSearchData()
    }
}
