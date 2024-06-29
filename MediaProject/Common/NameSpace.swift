//
//  NameSpace.swift
//  MediaProject
//
//  Created by 하연주 on 6/29/24.
//

import UIKit

enum TabViewType : String, CaseIterable, TabBarProtocol{
    case Home
    case trend
    case search
    
    
    var rootVC : UIViewController.Type {
        switch self {
        case .Home:
            return MovieHomeViewController.self
        case .trend:
            return TrendViewController.self
        case .search:
            return MovieSearchCollectionViewController.self
        }
    }
    
    var iconImage : UIImage? {
        switch self {
        case .Home:
            return UIImage(systemName: "house")
        case .trend:
            return UIImage(systemName: "star.fill")
        case .search:
            return UIImage(systemName: "magnifyingglass")
        }
    }
    
    var title : String {
        switch self {
        case .Home:
            return "Home"
        case .trend:
            return "Trend"
        case .search:
            return "Search"
        }
    }
}
