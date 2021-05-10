//
//  ViewController.swift
//  myProject


import UIKit

class MainController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let homeController = HomeViewController()
        homeController.tabBarItem = UITabBarItem(tabBarSystemItem: .contacts, tag: 1)
        let nav1 = UINavigationController(rootViewController: homeController)
        
        let exploreController = ExploreViewController()
        exploreController.tabBarItem = UITabBarItem(tabBarSystemItem: .contacts, tag: 2)
        let nav2 = UINavigationController(rootViewController: exploreController)

        let createController = CreateViewController()
        let nav3 = UINavigationController(rootViewController: createController)
        nav3.title = ""
        nav3.tabBarItem.isEnabled = false
        
        let alertController = AlertViewController()
        alertController.tabBarItem = UITabBarItem(tabBarSystemItem: .contacts, tag: 4)
        let nav4 = UINavigationController(rootViewController: alertController)

        let profileController = ProfileViewController()
        profileController.tabBarItem = UITabBarItem(tabBarSystemItem: .contacts, tag: 5)
        let nav5 = UINavigationController(rootViewController: profileController)
        
        
        viewControllers = [nav1, nav2, nav3, nav4, nav5]
        
        //disable third tab
        self.tabBarController?.tabBar.items?[3].isEnabled = false
        
        setupMiddleButton()
        }
        
    func setupMiddleButton() {
        let menuButton = UIButton(frame: CGRect(x: 0, y: 0, width: 38, height: 38))
        var menuButtonFrame = menuButton.frame
        menuButtonFrame.origin.y = view.bounds.height - menuButtonFrame.height - 42
        menuButtonFrame.origin.x = view.bounds.width/2 - menuButtonFrame.size.width/2
        menuButton.frame = menuButtonFrame

        
        //style button
        menuButton.backgroundColor = UIColor.green
        menuButton.layer.cornerRadius = menuButtonFrame.height/2
        view.addSubview(menuButton)
        
        menuButton.addTarget(self, action: #selector(menuButtonAction(sender:)), for: .touchUpInside)

        view.layoutIfNeeded()
        
        }
    
   
        @objc private func menuButtonAction(sender: UIButton) {
                
            
            let createController = CreateViewController()
            
            let createNav = UINavigationController(rootViewController: createController)
            createNav.modalPresentationStyle = .fullScreen
            
            self.present(createNav, animated: true, completion: nil)
        }
}


