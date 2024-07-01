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
    case nasa
    
    
    var rootVC : UIViewController.Type {
        switch self {
        case .Home:
            return MovieHomeViewController.self
        case .trend:
            return TrendViewController.self
        case .search:
            return MovieSearchCollectionViewController.self
        case .nasa :
            return NasaImageLoadViewController.self
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
        case .nasa :
            return UIImage(systemName: "moon.stars.fill")
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
        case .nasa :
            return "Nasa"
        }
    }
}


enum Nasa: String, CaseIterable {
    
    static let baseURL = "https://apod.nasa.gov/apod/image/"
    
    case one = "2308/sombrero_spitzer_3000.jpg"
    case two = "2212/NGC1365-CDK24-CDK17.jpg"
    case three = "2307/M64Hubble.jpg"
    case four = "2306/BeyondEarth_Unknown_3000.jpg"
    case five = "2307/NGC6559_Block_1311.jpg"
    case six = "2304/OlympusMons_MarsExpress_6000.jpg"
    case seven = "2305/pia23122c-16.jpg"
    case eight = "2308/SunMonster_Wenz_960.jpg"
    case nine = "2307/AldrinVisor_Apollo11_4096.jpg"
     
    static var photo: URL {
        return URL(string: Nasa.baseURL + Nasa.allCases.randomElement()!.rawValue)!
    }
}
