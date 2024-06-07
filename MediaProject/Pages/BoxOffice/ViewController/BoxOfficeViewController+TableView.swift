//
//  BoxOfficeViewController+TableView.swift
//  MediaProject
//
//  Created by 하연주 on 6/6/24.
//

import UIKit

extension BoxOfficeViewController : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let boxOfficeData else {return 0}
        return boxOfficeData.boxOfficeResult.dailyBoxOfficeList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: BoxOfficeTableViewCell.identifier, for: indexPath) as! BoxOfficeTableViewCell
        guard let boxOfficeData else {return cell}
        let rowData = boxOfficeData.boxOfficeResult.dailyBoxOfficeList[indexPath.row]
        cell.numberLabel.text = String(indexPath.row)
        cell.titleLebel.text = rowData.movieNm
        cell.dateLabel.text = rowData.openDt
        return cell
    }
}
