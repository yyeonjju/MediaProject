//
//  UIImageView+Extension.swift
//  MediaProject
//
//  Created by 하연주 on 6/4/24.
//

import UIKit

extension UIImageView {
    
    func configureDefaultImageView() {
        self.backgroundColor = .gray
        self.layer.cornerRadius = 10
        self.contentMode = .scaleAspectFill
        self.clipsToBounds = true
    }
    
    func configureCircleImageView() {
        self.backgroundColor = .gray
        self.layer.cornerRadius = self.frame.width/2
        self.contentMode = .scaleAspectFill
    }
    
}
