//
//  MovieSearchView.swift
//  MediaProject
//
//  Created by 하연주 on 6/11/24.
//

import UIKit
import SnapKit

class MovieSearchView: UIView {

    // MARK: - UI
    let movieSearchBar = UISearchBar()
    let movieTableView : UITableView = {
        let tv = UITableView()
        tv.rowHeight = 150
        tv.backgroundColor = .lightGray
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
    
    private func configureSubView() {
        [movieSearchBar, movieTableView]
            .forEach{
                addSubview($0)
            }
    }
    
    private func configureLayout() {
        movieSearchBar.snp.makeConstraints { make in
            make.horizontalEdges.top.equalTo(safeAreaLayoutGuide)
            make.height.equalTo(44)
        }
        
        movieTableView.snp.makeConstraints { make in
            make.top.equalTo(movieSearchBar.snp.bottom)
            make.horizontalEdges.bottom.equalTo(safeAreaLayoutGuide)
        }
    }


}
