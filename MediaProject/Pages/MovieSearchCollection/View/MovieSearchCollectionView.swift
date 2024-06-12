//
//  MovieSearchCollectionView.swift
//  MediaProject
//
//  Created by 하연주 on 6/12/24.
//

import UIKit
import SnapKit

class MovieSearchCollectionView: UIView {

    // MARK: - UI
    let movieSearchBar = UISearchBar()
    lazy var movieCollectionView : UICollectionView = {
        let cv = UICollectionView(frame: .zero, collectionViewLayout: configureCollectionVewLayout())
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
    
    private func configureCollectionVewLayout () -> UICollectionViewLayout {
        let layout = UICollectionViewFlowLayout()
        let numberofItemInrow : CGFloat = 3
        let numberofItemIncolumn : CGFloat = 4
        
        let cellIneterSpacing : CGFloat = 4
        let sectionSpacing : CGFloat = 8
        let sectionInset = UIEdgeInsets(top: sectionSpacing, left: sectionSpacing, bottom: sectionSpacing, right: sectionSpacing)
        
        let availableWidth = UIScreen.main.bounds.width - (cellIneterSpacing*numberofItemInrow) - sectionInset.left - sectionInset.right
        let availableHeight = UIScreen.main.bounds.height - (cellIneterSpacing*numberofItemIncolumn) - sectionInset.top - sectionInset.bottom
        
        
        layout.itemSize = CGSize(width: availableWidth/numberofItemInrow, height: availableHeight/numberofItemIncolumn)
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = cellIneterSpacing
        layout.sectionInset = sectionInset
        
        return layout
        
    }
    
    
    
    private func configureSubView() {
        [movieSearchBar, movieCollectionView]
            .forEach{
                addSubview($0)
            }
    }
    
    private func configureLayout() {
        movieSearchBar.snp.makeConstraints { make in
            make.horizontalEdges.top.equalTo(safeAreaLayoutGuide)
            make.height.equalTo(44)
        }
        
        movieCollectionView.snp.makeConstraints { make in
            make.top.equalTo(movieSearchBar.snp.bottom)
            make.horizontalEdges.bottom.equalTo(safeAreaLayoutGuide)
        }
    }


}
