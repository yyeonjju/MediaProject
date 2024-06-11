//
//  TrendDetailViewController+TableView.swift
//  MediaProject
//
//  Created by 하연주 on 6/11/24.
//

import UIKit

extension TrendDetailViewController : UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let movieCreditData else {return 0}
        return movieCreditData.cast.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CastTableViewCell.identifier, for: indexPath) as! CastTableViewCell
        guard let movieCreditData else {return cell}
        let rowData = movieCreditData.cast[indexPath.row]
        cell.configureData(data: rowData)
        return cell
    }
    
    
}


