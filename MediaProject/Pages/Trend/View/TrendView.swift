//
//  TrendView.swift
//  MediaProject
//
//  Created by 하연주 on 6/10/24.
//

import UIKit
import SnapKit

class TrendView: UIView {
    // MARK: - UI
    let trendListTableView : UITableView = {
        let tv = UITableView()
        tv.rowHeight = UITableView.automaticDimension
        tv.separatorColor = .clear
        return tv
    }()
    
    // MARK: - Initializer
    
    override init(frame : CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        configureSubView()
        configureLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - ConfigureUI
    
    func configureSubView() {
        [trendListTableView]
            .forEach{
                addSubview($0)
            }
    }
    
    func configureLayout() {
        trendListTableView.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(10)
            make.verticalEdges.equalTo(safeAreaLayoutGuide)

        }
    }


}
