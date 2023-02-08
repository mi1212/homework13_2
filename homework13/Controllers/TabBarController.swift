//
//  TabBarController.swift
//  homework13
//
//  Created by Mikhail Chuparnov on 30.01.2023.
//

import UIKit

final class TabBarController: UITabBarController {

    override func viewDidLoad() {
        setupTabBar()
        setupTabBarAppearence()
        setupNavigationBarAppearance()
        super.viewDidLoad()
        
    }

    
    private func setupTabBar(viewController: UIViewController, image: String) -> UIViewController {
        let vc = UINavigationController(rootViewController: viewController)
        vc.tabBarItem.image = UIImage(systemName: image)
        return vc
        
    }
    
    private func setupTabBar() {
        self.tabBar.unselectedItemTintColor = .lightGray
        self.tabBar.tintColor = .systemTeal
        self.tabBar.backgroundColor = .black
        self.view.backgroundColor = .black
        let vcArray = [
        setupTabBar(viewController: HomeViewController(), image: "house"),
        setupTabBar(viewController: ViewController(), image: "magnifyingglass"),
        setupTabBar(viewController: ViewController(), image: "plus.app"),
        setupTabBar(viewController: ViewController(), image: "suit.heart"),
        setupTabBar(viewController: ViewController(), image: "person.crop.circle"),
        ]
        self.viewControllers = vcArray
    }
    
    private func setupTabBarAppearence() {
        let appearance = UITabBarAppearance()
        appearance.backgroundColor = .black
        tabBar.standardAppearance = appearance
        tabBar.scrollEdgeAppearance = appearance
    }
    
    private func setupNavigationBarAppearance() {
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .black
        navigationController?.navigationBar.compactScrollEdgeAppearance = appearance
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
    }
    
}

