//
//  MovieHomeViewController.swift
//  MediaProject
//
//  Created by 하연주 on 6/4/24.
//

import UIKit
import SnapKit



class MovieHomeViewController: UIViewController {

    let mainImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.configureDefaultImageView()
        return imageView
    }()
    
    let playButton : UIButton = {
        let button = UIButton()
        button.setTitle("재생", for: .normal)
        button.setImage(UIImage(systemName: "play.fill"), for: .normal)
        button.backgroundColor = .white
        button.setTitleColor(.black, for: .normal)
        button.tintColor = .black
        button.makeBorderRadius(radius: 5, width: 0)
        return button
    }()
    
    let goTolistButton : UIButton = {
        let button = UIButton()
        button.setTitle("내가 찜한 리스트", for: .normal)
        button.setImage(UIImage(systemName: "plus"), for: .normal)
        button.backgroundColor = .black
        button.makeBorderRadius(radius: 5, width: 0)
        button.tintColor = .white
        return button
    }()
    
    lazy var buttonsStackView : UIStackView = {
       let sv = UIStackView(arrangedSubviews: [playButton, goTolistButton])
        sv.axis = .horizontal
        sv.distribution = .fillEqually
        sv.alignment = .center
        sv.spacing = 10
        return sv
    }()

    
    let firstContentImage : UIImageView = {
        let imageView = UIImageView()
        imageView.configureDefaultImageView()
        return imageView
    }()
    
    let secondContentImage : UIImageView = {
        let imageView = UIImageView()
        imageView.configureDefaultImageView()
        return imageView
    }()
    
    let thirdContentImage : UIImageView = {
        let imageView = UIImageView()
        imageView.configureDefaultImageView()
        return imageView
    }()
    
    private lazy var imageStackView : UIStackView = {
        let sv = UIStackView(arrangedSubviews: [firstContentImage, secondContentImage, thirdContentImage])
        sv.axis = .horizontal
        sv.distribution = .fillEqually
        sv.spacing = 5
        sv.alignment = .leading
        return sv
    }()
    
    let smallImageHeight = 150
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        setupBackgroundColor()
        
        setupAddSubView()
        setupLayout()
    }
    
    // MARK: - Layout
    private func setupAddSubView() {
        view.addSubview(mainImageView)
        view.addSubview(imageStackView)
        view.addSubview(buttonsStackView)
        
        mainImageView.addSubview(buttonsStackView)

    }
    
    private func setupLayout() {
        mainImageView.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(20)
            make.top.equalTo(view.safeAreaLayoutGuide).offset(30)
            make.centerX.equalTo(view)
            make.height.equalTo(500)
        }
        
        firstContentImage.snp.makeConstraints { make in
            make.height.equalTo(smallImageHeight)
        }
        
        secondContentImage.snp.makeConstraints { make in
            make.height.equalTo(smallImageHeight)
        }
        
        thirdContentImage.snp.makeConstraints { make in
            make.height.equalTo(smallImageHeight)
        }
        
        imageStackView.snp.makeConstraints { make in
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.top.equalTo(mainImageView.snp.bottom).offset(10)
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(10)
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
    
        
    }
    
    
    

}
