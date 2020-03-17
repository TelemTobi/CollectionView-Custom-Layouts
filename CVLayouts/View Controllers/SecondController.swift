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
    var dataSource = [shuffledPhotos, shuffledPhotos, shuffledPhotos]
    
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
        let layout = SecondLayout.shared.create()
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(PhotoCell.self, forCellWithReuseIdentifier: PhotoCell.id)
        view.addSubview(collectionView)
        
        collectionView.backgroundColor = .none
        collectionView.isScrollEnabled = true
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
}

extension SecondController: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        dataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        dataSource[section].count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoCell.id, for: indexPath) as! PhotoCell
        cell.photo = dataSource[indexPath.section][indexPath.item].image
        return cell
    }
    
    
}

