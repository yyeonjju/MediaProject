//
//  MovieSearchCollectionViewCell.swift
//  MediaProject
//
//  Created by 하연주 on 6/12/24.
//

import UIKit

class MovieSearchCollectionViewCell: UICollectionViewCell {
    // MARK: - UI
    let movieImageView : UIImageView = {
        let iv = UIImageView()
        iv.configureDefaultImageView()
        iv.clipsToBounds = true
        return iv
    }()
    let titleLabel : UILabel = {
        let label = UILabel()
        label.configureTitleLabel()
        label.textColor = .white
        label.textAlignment = .center
        label.text = "타이틀"
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
    
    // MARK: - ConfigureData
    
    func configureData(data : MovieSearchResult){
        let url = URL(string: "\(APIURL.tmdbImagePrefixURL)\(data.posterPath)")
        movieImageView.kf.setImage(with: url)
        titleLabel.text = data.originalTitle
    }

    
    
    // MARK: - ConfigureUI
    
    private func configureSubView() {
        [movieImageView, titleLabel]
            .forEach{
                contentView.addSubview($0)
            }
    }
    
    private func configureLayout() {
        movieImageView.snp.makeConstraints { make in
            make.edges.equalTo(contentView)
        }
        titleLabel.snp.makeConstraints { make in
            make.horizontalEdges.equalTo(contentView)
            make.bottom.equalTo(contentView.snp.bottom).inset(10)
            
        }
    }

}
