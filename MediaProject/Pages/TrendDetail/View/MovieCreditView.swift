//
//  MovieCreditView.swift
//  MediaProject
//
//  Created by 하연주 on 6/10/24.
//

import UIKit
import SnapKit

class MovieCreditView: UIView {
    // MARK: - UI
    let titleLabel : UILabel = {
        let label = UILabel()
        label.configureMainBigLabel()
        label.text = "ksdjflkd"
        return label
    }()
    
    let overviewLabel : UILabel = {
        let label = UILabel()
        label.text = "-----"
        label.numberOfLines = 0
        return label
    }()
    
    // MARK: - Initializer
    
    override init(frame : CGRect) {
        super.init(frame: frame)
        
        configureSubView()
        configureLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - ConfigureUI
    
    func configureSubView() {
        [titleLabel, overviewLabel]
            .forEach{
                addSubview($0)
            }
    }
    
    func configureLayout() {
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide).offset(20)
        }
        
        overviewLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(20)
            make.horizontalEdges.equalToSuperview()
        }
    }


}
