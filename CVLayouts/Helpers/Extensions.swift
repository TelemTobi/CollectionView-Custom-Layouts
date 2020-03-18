//
//  ViewControllerExt.swift
//  CVLayouts
//
//  Created by Telem Tobi on 16/03/2020.
//  Copyright © 2020 Telem Tobi. All rights reserved.
//

import UIKit

extension UIViewController {
    func setBackgroundImage(_ image: UIImage) {
        let backgroundImage = UIImageView(image: image)
        backgroundImage.alpha = 1
        backgroundImage.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        view.addSubview(backgroundImage)
        view.sendSubviewToBack(backgroundImage)
        
//        view.backgroundColor = .systemBlue
    }
    
    func prepareCollectionView(layout: UICollectionViewLayout) -> UICollectionView {
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.addSubview(collectionView)
        
        collectionView.backgroundColor = .none
        collectionView.isScrollEnabled = true
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        return collectionView
    }
}

extension UIColor {
    
    static func random(red: CGFloat = CGFloat.random(in: 0...1),
                       green: CGFloat = CGFloat.random(in: 0...1), // from 0.5 to 1.0 to stay away from white
                       blue: CGFloat = CGFloat.random(in: 0...1), // from 0.5 to 1.0 to stay away from black
                       alpha: CGFloat = 1) -> UIColor {
        return UIColor(red: red, green: green, blue: blue, alpha: alpha)
    }
}
