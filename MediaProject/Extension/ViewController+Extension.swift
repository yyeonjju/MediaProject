//
//  ViewController+Extension.swift
//  MediaProject
//
//  Created by 하연주 on 6/4/24.
//

import UIKit

extension UIViewController {
    func setupBackgroundColor(){
        view.backgroundColor = .black
    }
    
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
