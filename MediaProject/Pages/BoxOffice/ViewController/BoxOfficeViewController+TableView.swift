//
//  BoxOfficeViewController+TableView.swift
//  MediaProject
//
//  Created by 하연주 on 6/6/24.
//

import UIKit

extension BoxOfficeViewController : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: BoxOfficeTableViewCell.identifier, for: indexPath) as! BoxOfficeTableViewCell
        cell.numberLabel.text = String(indexPath.row)
        cell.titleLebel.text = "---"
        cell.dateLabel.text = "2024-03-03"
        return cell
    }
}
