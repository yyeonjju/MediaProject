//
//  SearchedMovieTableViewCell.swift
//  MediaProject
//
//  Created by 하연주 on 6/11/24.
//

import UIKit
import SnapKit
import Kingfisher

class SearchedMovieTableViewCell: UITableViewCell {
    // MARK: - UI
    let movieImageView : UIImageView = {
        let iv = UIImageView()
        iv.configureDefaultImageView()
        iv.clipsToBounds = true
        return iv
    }()
    let titleLabel : UILabel = {
        let label = UILabel()
        label.text = "타이틀"
        return label
    }()
    
    // MARK: - Initializer
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configureSubView()
        configureLayout()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - ConfigureData
    func configureData(data: MovieSearchResult){
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
            make.verticalEdges.leading.equalTo(contentView).inset(5)
            make.width.equalTo(70)
        }
        titleLabel.snp.makeConstraints { make in
            make.leading.equalTo(movieImageView.snp.trailing).offset(4)
            make.centerY.equalTo(contentView.snp.centerY)
        }
    }


}
