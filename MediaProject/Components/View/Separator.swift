//
//  Separator.swift
//  MediaProject
//
//  Created by 하연주 on 6/6/24.
//

import UIKit

final class Separator: UIView {
    
    init(color : UIColor) {
        super.init(frame: .zero)
        
        self.backgroundColor = color
        self.heightAnchor.constraint(equalToConstant: 2).isActive = true
        self.clipsToBounds = true
        self.layer.cornerRadius = 1
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
