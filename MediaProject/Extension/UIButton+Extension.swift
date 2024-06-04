//
//  UIButton+Extension.swift
//  MediaProject
//
//  Created by 하연주 on 6/4/24.
//

import UIKit

extension UIButton {
    func makeBorderRadius(radius : CGFloat, width : CGFloat, color : CGColor? = nil){
        self.layer.cornerRadius = radius
        self.layer.borderWidth = width
        self.layer.borderColor = color
    }
}
