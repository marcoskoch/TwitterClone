//
//  MainTabController.swift
//  TwitterClone
//
//  Created by Marcos Michel on 10/04/23.
//

import UIKit
import Firebase

class MainTabController: UITabBarController {
    
    // MARK: - Properties
    
    lazy var actionButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = .white
        button.backgroundColor = .twitterBlue
        button.setImage(UIImage(named: "new_tweet"), for: .normal)
        button.addTarget(self, action: #selector(actionButtonTapped), for: .touchUpInside)
        
        return button
    }()
    
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .twitterBlue
        
        let appearance = UITabBarAppearance()
        tabBar.standardAppearance = appearance
        tabBar.scrollEdgeAppearance = tabBar.standardAppearance
        
        authenticateUserAndConfigureUI()
        
    }
    
    // MARK: - API
    
    func authenticateUserAndConfigureUI() {
        if Auth.auth().currentUser == nil {
            DispatchQueue.main.async {
                let nav = UINavigationController(rootViewController: LoginController())
                nav.modalPresentationStyle = .fullScreen
                self.present(nav, animated: true)
            }
        } else {
            configureViewControllers()
            configureUI()
        }
    }
    
    func logUserOut() {
        do {
            try Auth.auth().signOut()
        } catch let error {
            print("DEBUG: Failed to sign out with error \(error.localizedDescription)")
        }
    }
    
    // MARK: - Selectors
    
    @objc func actionButtonTapped() {
        print(123)
    }
    
    // MARK: - Helpers
    
    func configureUI() {
        view.addSubview(actionButton)
        actionButton.anchor(bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.rightAnchor, paddingBottom: 64, paddingRight: 16, width: 56, height: 56)
        actionButton.layer.cornerRadius = 56 / 2
    }
    
    func configureViewControllers() {
        
        let nav1 = templateNavigationController(image: UIImage(named: "home_unselected"), rootViewController: FeedController())
        let nav2 = templateNavigationController(image: UIImage(named: "search_unselected"), rootViewController: ExploreController())
        let nav3 = templateNavigationController(image: UIImage(named: "like_unselected"), rootViewController: NotificationsController())
        let nav4 = templateNavigationController(image: UIImage(named: "ic_mail_outline_white_2x-1"), rootViewController: ConversationsController())
        
        
        viewControllers = [nav1, nav2, nav3, nav4]
    }
    
    func templateNavigationController(image: UIImage?, rootViewController: UIViewController) -> UINavigationController {
        let nav = UINavigationController(rootViewController: rootViewController)
        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .white
        nav.navigationBar.standardAppearance = appearance;
        nav.navigationBar.scrollEdgeAppearance = nav.navigationBar.standardAppearance
        
        nav.tabBarItem.image = image
        
        return nav
    }
    
}
