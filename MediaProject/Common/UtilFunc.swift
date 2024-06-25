//
//  UtilFunc.swift
//  MediaProject
//
//  Created by 하연주 on 6/6/24.
//

import UIKit

internal func configureCollectionVewLayout (numberofItemInrow : Int, cellIneterSpacing : CGFloat = 10, sectionSpacing :  CGFloat = 30, height: CGFloat? = nil) -> UICollectionViewLayout{
    let layout = UICollectionViewFlowLayout()
    let numberofItemInrow : CGFloat = CGFloat(numberofItemInrow)
    
    let cellIneterSpacing : CGFloat = cellIneterSpacing
    let sectionSpacing : CGFloat = sectionSpacing
    let inset = UIEdgeInsets(top: sectionSpacing, left: sectionSpacing, bottom: sectionSpacing, right: sectionSpacing)
    let availableWidth = UIScreen.main.bounds.width - (cellIneterSpacing*numberofItemInrow) - inset.left - inset.right
    
    
    layout.itemSize = CGSize(width: availableWidth/numberofItemInrow, height: height ?? availableWidth/numberofItemInrow)
    layout.scrollDirection = .vertical
    layout.minimumLineSpacing = 10
    layout.minimumInteritemSpacing = cellIneterSpacing
    layout.sectionInset = inset
    
    return layout
}


func horizontalCollectionViewLayout () -> UICollectionViewLayout{
    let layout = UICollectionViewFlowLayout()
    let inset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0)
    
    layout.scrollDirection = .horizontal
    layout.itemSize = CGSize(width: 120, height: 150)
    layout.minimumLineSpacing = 10
    layout.minimumInteritemSpacing = 0
    layout.sectionInset = inset    
    return layout
}
