//
//  BoxOfficeTableViewCell.swift
//  MediaProject
//
//  Created by 하연주 on 6/6/24.
//

import UIKit
import SnapKit

class BoxOfficeTableViewCell: UITableViewCell {
    var numberLabel : UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.backgroundColor = .white
        label.textAlignment = .center
        return label
    }()
    
    var titleLebel : UILabel = {
        let label = UILabel()
        label.textColor = .white
        return label
    }()
    
    var dateLabel : UILabel = {
        let label = UILabel()
        label.textColor = .systemGray5
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.backgroundColor = .black
        
        configureSubView()
        configureLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func configureSubView() {
        [numberLabel, titleLebel, dateLabel]
            .forEach {
                contentView.addSubview($0)
            }
    }
    
    func configureLayout() {
        numberLabel.snp.makeConstraints { make in
            make.verticalEdges.leading.equalTo(contentView).inset(8)
            make.width.equalTo(50)
        }
        titleLebel.snp.makeConstraints { make in
            make.leading.equalTo(numberLabel.snp.trailing).offset(10)
            make.centerY.equalTo(numberLabel.snp.centerY)
            make.trailing.equalTo(dateLabel.snp.leading)
        }
        
        dateLabel.snp.makeConstraints { make in
            make.trailing.equalTo(contentView.snp.trailing).inset(4)
            make.centerY.equalTo(numberLabel.snp.centerY)
            make.width.equalTo(100)
        }
    }
    
}
