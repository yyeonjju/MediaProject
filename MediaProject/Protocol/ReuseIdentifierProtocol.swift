//
//  ReuseIdentifierProtocol.swift
//  MediaProject
//
//  Created by 하연주 on 6/6/24.
//

import UIKit



protocol ReuseIdentifierProtocol {
    static var identifier : String {get}
}

extension UITableViewCell : ReuseIdentifierProtocol {
    static var identifier: String {
        return String(describing: self)
    }
}

extension UIViewController : ReuseIdentifierProtocol {
    static var identifier: String {
        return String(describing: self)
    }
}

extension UICollectionViewCell : ReuseIdentifierProtocol {
    static var identifier: String {
        return String(describing: self)
    }
}


