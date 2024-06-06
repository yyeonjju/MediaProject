//
//  UITextField+Extension.swift
//  MediaProject
//
//  Created by 하연주 on 6/6/24.
//

import UIKit


extension UITextField {
    func setLeftIcon(_ image: UIImage? = UIImage(systemName: "magnifyingglass")){
        let iconView = UIImageView(frame:CGRect(x: 10, y: 5, width: 20, height: 20))
        iconView.tintColor = .gray
        iconView.image = image
        
        let iconContainerView: UIView = UIView(frame:CGRect(x: 20, y: 0, width: 30, height: 30))
        iconContainerView.addSubview(iconView)
        leftView = iconContainerView
        leftViewMode = .always
    }
    
    func configureDefaultTextField(placeholder : String) {
        self.tintColor = .black
        self.backgroundColor = .systemGray5
        self.layer.cornerRadius = 20
        self.placeholder = placeholder
    }
    
    func configureBorderLineTextField(placeholder : String) {
        self.tintColor = .black
        self.backgroundColor = .clear
        self.layer.cornerRadius = 10
        self.layer.borderWidth = 2
        self.layer.borderColor = UIColor.lightGray.cgColor
        self.configurePlaceholderColor(placeholder)
    }
    
    func configurePlaceholderColor(_ placeholder: String, _ color : UIColor = .gray) {
        let centeredParagraphStyle = NSMutableParagraphStyle()
        centeredParagraphStyle.alignment = .center
        self.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [.foregroundColor : color, .paragraphStyle: centeredParagraphStyle])
    }
}
