//
//  ViewController.swift
//  CVLayouts
//
//  Created by Telem Tobi on 15/03/2020.
//  Copyright © 2020 Telem Tobi. All rights reserved.
//

import UIKit

class SecondController: UIViewController {

    var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpElements()
        setCollectionView()
    }

    func setUpElements() {
        view.backgroundColor = .white
        setBackgroundImage(UIImage(named: "wallpaper")!)
    }

    func setCollectionView() {
        let layout = FirstLayout()
//        layout.delegate = self
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(AnnotatedPhotoCell.self, forCellWithReuseIdentifier: AnnotatedPhotoCell.id)
        view.addSubview(collectionView)
        
        collectionView.backgroundColor = .none
        collectionView.isScrollEnabled = true
        
//        collectionView.delegate = self
//        collectionView.dataSource = self
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
}

