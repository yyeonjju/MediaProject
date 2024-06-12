//
//  SceneDelegate.swift
//  MediaProject
//
//  Created by 하연주 on 6/4/24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let window = self.window else { return }
        
        //⭐️ 네비게이션 컨트롤러 생성
        let movieHomeView = UINavigationController(rootViewController: MovieHomeViewController())
        let signupView = UINavigationController(rootViewController: SignupViewController())
//        let lotteryView = UINavigationController(rootViewController: LotteryViewController())
//        let boxOffice = UINavigationController(rootViewController: BoxOfficeViewController())
//        let trendView = UINavigationController(rootViewController: TrendViewController())
        let movieSearchView = UINavigationController(rootViewController: MovieSearchViewController())
        
        let movieSearchCollectionView = UINavigationController(rootViewController: MovieSearchCollectionViewController())
        
        
//        homeView.navigationBar.backgroundColor = .yellow
        
        
        //⭐️ 탭바 컨트롤러 생성
        let tabBarVC = UITabBarController()
        
        // 탭바로 사용하기 위한 뷰 컨트롤러들 설정
        tabBarVC.setViewControllers([movieHomeView,signupView, movieSearchView, movieSearchCollectionView], animated: true)
        tabBarVC.modalPresentationStyle = .fullScreen
        tabBarVC.tabBar.backgroundColor = .white
        
        // 탭바 이름/이미지 설정 (이미지는 애플이 제공하는 것으로 사용)
        guard let items = tabBarVC.tabBar.items else { return }
        
        items[0].title = "Home"
        items[0].image = UIImage(systemName: "house")
        
        items[1].title = "signup"
        items[1].image = UIImage(systemName: "person.fill")

//        items[2].title = "lottery"
//        items[2].image = UIImage(systemName: "book.fill")
//        
//        items[3].title = "boxOffice"
//        items[3].image = UIImage(systemName: "popcorn.fill")
        
//        items[2].title = "trend"
//        items[2].image = UIImage(systemName: "star.fill")
//        
        items[2].title = "search"
        items[2].image = UIImage(systemName: "magnifyingglass")
        
        items[3].title = "search"
        items[3].image = UIImage(systemName: "heart")
        
        window.rootViewController = tabBarVC
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

