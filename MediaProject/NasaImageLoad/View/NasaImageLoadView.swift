//
//  NasaImageLoadView.swift
//  MediaProject
//
//  Created by 하연주 on 7/1/24.
//

import UIKit
import SnapKit

final class NasaImageLoadView : UIView {

    
    // MARK: - UI
    let requestButton = {
       let btn = UIButton()
        btn.makeBorderRadius(radius: 20, width: btn.bounds.width)
        btn.setTitle("이미지 요청", for: .normal)
        btn.backgroundColor = .blue
        return btn
    }()
    
    let nasaImageCollectionView = {
        let cv = UICollectionView(frame: .zero, collectionViewLayout: configureCollectionVewLayout(numberofItemInrow: 2, cellIneterSpacing: 5, sectionSpacing: 20, height: 160))
//        cv.backgroundColor = .blue
        return cv
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
    
    private func configureSubView() {
        [requestButton, nasaImageCollectionView]
            .forEach{
                addSubview($0)
            }
    }
    
    private func configureLayout() {
        requestButton.snp.makeConstraints { make in
            make.top.horizontalEdges.equalTo(safeAreaLayoutGuide).inset(10)
            make.height.equalTo(50)
        }
        
        nasaImageCollectionView.snp.makeConstraints { make in
            make.top.equalTo(requestButton.snp.bottom).offset(20)
            make.horizontalEdges.equalTo(safeAreaLayoutGuide)
            make.bottom.equalTo(safeAreaLayoutGuide)
        }
    }

}
