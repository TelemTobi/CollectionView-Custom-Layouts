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
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
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
        collectionView = prepareCollectionView(layout: layout)
        
        collectionView.register(PhotoCell.self, forCellWithReuseIdentifier: PhotoCell.id)
        collectionView.register(AnnotatedPhotoCell.self, forCellWithReuseIdentifier: AnnotatedPhotoCell.id)
        collectionView.delegate = self
        collectionView.dataSource = self
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
        if indexPath.section % 2 == 1 && (indexPath.item + 1) % 3 == 0 || indexPath.section % 2 == 0 && indexPath.item % 3 == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AnnotatedPhotoCell.id, for: indexPath) as! AnnotatedPhotoCell
            cell.photo = dataSource[indexPath.section][indexPath.item]
            return cell
        }
        else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoCell.id, for: indexPath) as! PhotoCell
            cell.photo = albumCovers.randomElement()
            return cell
        }
    }
}

