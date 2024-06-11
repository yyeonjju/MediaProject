//
//  TrendViewController+TableView.swift
//  MediaProject
//
//  Created by 하연주 on 6/10/24.
//

import UIKit

extension TrendViewController : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let moviesData else {return 0}
        
        return moviesData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TrendTableViewCell.identifier, for: indexPath) as! TrendTableViewCell
        guard let moviesData else {return  cell}
        let rowData = moviesData[indexPath.row]
        let genreNameArray = makeGenreNameArray(genreIDS: rowData.genreIDS)
        
        cell.configureData(data: rowData, genreNames: genreNameArray)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let moviesData else {return }
        let rowData = moviesData[indexPath.row]
        
        let vc = TrendDetailViewController()
        vc.movieId = rowData.id
        vc.movieData = rowData
        navigationController?.pushViewController(vc, animated: true)
    }
    
}
