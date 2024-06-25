//
//  MovieRecommendationCollectionViewCell.swift
//  MediaProject
//
//  Created by 하연주 on 6/25/24.
//

import UIKit
import SnapKit


final class MovieRecommendationCollectionViewCell : UICollectionViewCell {
    // MARK: - UI
    let posterImageView : UIImageView = {
        let iv = UIImageView()
        iv.configureDefaultImageView()
        iv.clipsToBounds = true
        return iv
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
        [posterImageView]
            .forEach{
                contentView.addSubview($0)
            }
    }
    
    func configureLayout() {
        posterImageView.snp.makeConstraints { make in
            make.edges.equalTo(contentView)
        }
    }

}
