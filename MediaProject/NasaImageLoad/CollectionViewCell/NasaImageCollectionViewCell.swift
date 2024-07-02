//
//  NasaImageCollectionView.swift
//  MediaProject
//
//  Created by 하연주 on 7/1/24.
//

import UIKit
import SnapKit


final class NasaImageCollectionViewCell : UICollectionViewCell {
    
    // MARK: - UI
    let imageView : UIImageView = {
        let iv = UIImageView()
        iv.configureDefaultImageView()
        return iv
    }()
    
    let progressLabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 15)
        label.text = "0 \n /100"
        label.textAlignment = .center
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
    
    // MARK: - ConfigureData()
    func configureData(data : NasaData){
        let progressLabelText = Double(data.loadingBuffer.count) / data.total
        progressLabel.text = "\(progressLabelText * 100) \n / 100 "
        imageView.image = data.image
    }
    
    // MARK: - ConfigureUI
    
    private func configureSubView() {
        [imageView, progressLabel]
            .forEach{
                contentView.addSubview($0)
            }
    }
    
    private func configureLayout() {
        imageView.snp.makeConstraints { make in
            make.edges.equalTo(contentView)
        }
        
        progressLabel.snp.makeConstraints { make in
            make.centerY.horizontalEdges.equalTo(contentView)
        }
    }

}
