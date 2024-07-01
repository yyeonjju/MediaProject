//
//  UpcomingMovieCollectionViewCell.swift
//  MediaProject
//
//  Created by 하연주 on 6/29/24.
//

import UIKit
import SnapKit
import Kingfisher

final class UpcomingMovieCollectionViewCell : UICollectionViewCell {
    // MARK: - UI
    private let imageView : UIImageView = {
        let iv = UIImageView()
        iv.configureDefaultImageView()
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
    
    func configureData(data : UpcomingMovieResult) {
        let url = URL(string: "\(APIURL.tmdbImagePrefixURL)\(data.poster_path)")
        imageView.kf.setImage(with: url)
    }
    
    
    // MARK: - ConfigureUI
    
    private func configureSubView() {
        [imageView]
            .forEach{
                contentView.addSubview($0)
            }
    }
    
    private func configureLayout() {
        imageView.snp.makeConstraints { make in
            make.edges.equalTo(contentView)
        }
    }

}
