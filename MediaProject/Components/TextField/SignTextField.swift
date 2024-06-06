//
//  SignTextField.swift
//  MediaProject
//
//  Created by 하연주 on 6/4/24.
//

import UIKit

final class SignupTextField : UITextField {
    
    init(placeholder : String) {
        super.init(frame: .zero)
        setupUI(placeholer : placeholder)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI (placeholer : String) {
        self.backgroundColor = .gray
        self.layer.cornerRadius = 5
        self.configurePlaceholderColor(placeholer, .white)
        
    }
    
}
