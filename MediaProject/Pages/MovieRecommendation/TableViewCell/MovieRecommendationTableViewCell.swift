//
//  MovieRecommendationTableViewCell.swift
//  MediaProject
//
//  Created by 하연주 on 6/25/24.
//

import UIKit
import SnapKit


final class MovieRecommendationTableViewCell : UITableViewCell {
    
    // MARK: - UI
    
    let sectionTitleLabel = {
       let label = UILabel()
        label.text = "gkgkgkgk"
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 17)
        return label
    }()
    let collectionView = {
        let cv = UICollectionView(frame: .zero, collectionViewLayout: horizontalCollectionViewLayout())
        cv.backgroundColor = .black
        return cv
    }()
    

    
    // MARK: - Initializer
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configureSubView()
        configureLayout()
        contentView.backgroundColor = .black
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - ConfigureUI
    
    func configureSubView() {
        [sectionTitleLabel, collectionView]
            .forEach{
                contentView.addSubview($0)
            }
    }
    
    func configureLayout() {
        sectionTitleLabel.snp.makeConstraints { make in
            make.top.leading.equalTo(contentView).offset(4)
            make.height.equalTo(22)
            
        }
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(sectionTitleLabel.snp.bottom)
            make.horizontalEdges.equalTo(contentView.snp.horizontalEdges)
            make.bottom.equalTo(contentView.snp.bottom)
        }
    }

    
    
    
}
