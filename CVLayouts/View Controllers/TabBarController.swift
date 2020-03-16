//
//  TabBarController.swift
//  CVLayouts
//
//  Created by Telem Tobi on 16/03/2020.
//  Copyright © 2020 Telem Tobi. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setUpElements()
        setChildVCs()
    }
    
    func setUpElements() {
        view.tintColor = .systemPink
        tabBar.backgroundColor = .white
    }
    
    func setChildVCs() {
        let firstVC = FirstController()
        firstVC.tabBarItem = UITabBarItem(title: "", image: UIImage(systemName: "1.square"), selectedImage: UIImage(systemName: "1.square.fill"))
        
        let secondVC = SecondController()
        secondVC.tabBarItem = UITabBarItem(title: "", image: UIImage(systemName: "2.square"), selectedImage: UIImage(systemName: "2.square.fill"))
        
        self.viewControllers = [firstVC, secondVC]
    }
}
