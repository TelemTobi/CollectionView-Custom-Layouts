//
//  FirstController.swift
//  CVLayouts
//
//  Created by Telem Tobi on 18/03/2020.
//  Copyright © 2020 Telem Tobi. All rights reserved.
//

import UIKit

class FirstController: UIViewController {
    
    var collectionView: UICollectionView!
    
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
//        let layout = FirstLayout()
//        collectionView = prepareCollectionView(layout: layout)
        collectionView = prepareCollectionView(layout: nil)
        
        collectionView.register(NumberCell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: NumberCell.id)
        collectionView.register(PhotoCell.self, forCellWithReuseIdentifier: PhotoCell.id)
        collectionView.delegate = self
        collectionView.dataSource = self
        
        if let flowLayout = self.collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.sectionHeadersPinToVisibleBounds = true
        }
    }
}

extension FirstController: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AlbumCell.id, for: indexPath) as! AlbumCell
        cell.photo = shuffledPhotos[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard kind == UICollectionView.elementKindSectionHeader else {
            return UICollectionReusableView()
        }
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NumberCell.id, for: indexPath) as! NumberCell
        cell.numberLabel.text = (indexPath.item + 1).description
        return cell
    }
}

extension FirstController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.bounds.size.width, height: 64)
    }
}
