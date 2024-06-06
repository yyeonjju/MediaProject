//
//  UILabel+Extension.swift
//  MediaProject
//
//  Created by 하연주 on 6/6/24.
//

import UIKit

extension UILabel {
    func configureMainBigLabel () {
        self.font = .boldSystemFont(ofSize: 23)
        self.textAlignment = .center
    }
    
    func configureTitleLabel () {
        self.font = .boldSystemFont(ofSize: 17)
        self.textAlignment = .left
    }
    
    func configureSubLabel () {
        self.font = .boldSystemFont(ofSize: 13)
        self.textAlignment = .left
        self.textColor = .lightGray
    }
    

}

extension UILabel {
    func changeSpecificTextColor (searchText : String?, color:UIColor) {
        guard let searchText else {return }
        
        if let labelText = self.text {
            //변경이 가능한 문자열로 바꿈
            let mutableText = NSMutableAttributedString(string: labelText)
            
            var searchRange = labelText.startIndex..<labelText.endIndex
            
            //searchRange 안에서 색깔 바꿔주고 싶은 문자열(searchText)에 대한 range를 찾는다.
            while let range = labelText.range(of: searchText, options: NSString.CompareOptions.caseInsensitive, range: searchRange) {
                
                //변경이 가능한 문자열인 mutableText에다가 range만큼에 대한 문자 색을 바꿀 수 있는 attribute를 add
                mutableText.addAttribute(NSAttributedString.Key.foregroundColor, value: color, range: NSRange(range, in: labelText))
                
                searchRange = range.upperBound..<searchRange.upperBound
            }
            
            self.attributedText = mutableText
        }
        
    }
}
