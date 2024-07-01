//
//  MovieHomeView.swift
//  MediaProject
//
//  Created by 하연주 on 6/29/24.
//

import UIKit

class MovieHomeView : UIView {
    // MARK: - UI
    let mainImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.configureDefaultImageView()
        return imageView
    }()
    
    private let playButton : UIButton = {
        let button = UIButton()
        button.setTitle("재생", for: .normal)
        button.setImage(UIImage(systemName: "play.fill"), for: .normal)
        button.backgroundColor = .white
        button.setTitleColor(.black, for: .normal)
        button.tintColor = .black
        button.makeBorderRadius(radius: 5, width: 0)
        return button
    }()
    
    private let goTolistButton : UIButton = {
        let button = UIButton()
        button.setTitle("내가 찜한 리스트", for: .normal)
        button.setImage(UIImage(systemName: "plus"), for: .normal)
        button.backgroundColor = .black
        button.makeBorderRadius(radius: 5, width: 0)
        button.tintColor = .white
        return button
    }()
    
    lazy private var buttonsStackView : UIStackView = {
       let sv = UIStackView(arrangedSubviews: [playButton, goTolistButton])
        sv.axis = .horizontal
        sv.distribution = .fillEqually
        sv.alignment = .center
        sv.spacing = 10
        return sv
    }()

    let upcomingMovieCollectionView = UICollectionView(frame: .zero, collectionViewLayout: configureCollectionVewLayout(numberofItemInrow : 3, cellIneterSpacing : 10, sectionSpacing: 20, height: 150) )

    
    // MARK: - Initializer
    
    override init(frame : CGRect) {
        super.init(frame: frame)
        
        setupAddSubView()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - ConfigureUI
    private func setupAddSubView() {
        [mainImageView, upcomingMovieCollectionView]
            .forEach{
                addSubview($0)
            }

        
        mainImageView.addSubview(buttonsStackView)
    }
    
    private func setupLayout() {
        mainImageView.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(20)
            make.top.equalTo(safeAreaLayoutGuide).offset(30)
            make.centerX.equalToSuperview()
            make.height.equalTo(450)
        }
        
        
        playButton.snp.makeConstraints { make in
            make.height.equalTo(40)
        }
        
        goTolistButton.snp.makeConstraints { make in
            make.height.equalTo(40)
        }
        
        buttonsStackView.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(20)
            make.bottom.equalToSuperview().inset(20)
        }
        
        
        upcomingMovieCollectionView.snp.makeConstraints { make in
            make.top.equalTo(mainImageView.snp.bottom)
            make.horizontalEdges.equalToSuperview()
            make.bottom.equalTo(safeAreaLayoutGuide)
        }
    
        
    }

}
