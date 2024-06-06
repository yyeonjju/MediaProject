//
//  CircleLabel.swift
//  MediaProject
//
//  Created by 하연주 on 6/6/24.
//

import UIKit

class NumberBallLabel : UILabel{
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.layer.cornerRadius = self.frame.width/2
        self.clipsToBounds = true
    }
    
    init(text:String,color:UIColor) {
        super.init(frame: .zero)
        self.text = text
        self.textColor = .white
        self.backgroundColor = color
        self.textAlignment = .center
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
