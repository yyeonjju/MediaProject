//
//  TabBarProtocol.swift
//  MediaProject
//
//  Created by 하연주 on 6/30/24.
//

import UIKit

protocol TabBarProtocol{
    var rootVC : UIViewController.Type {get}
    var iconImage : UIImage? {get}
    var title : String {get}
}
