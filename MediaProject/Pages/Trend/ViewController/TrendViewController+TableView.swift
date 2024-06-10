//
//  TrendViewController+TableView.swift
//  MediaProject
//
//  Created by 하연주 on 6/10/24.
//

import UIKit

extension TrendViewController : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TrendTableViewCell.identifier, for: indexPath) as! TrendTableViewCell
        guard let moviesData else {return  cell}
        
        let rowData = moviesData[indexPath.row]
        cell.configureData(data: rowData)
        
        return cell
    }
    
    
    
    
}
