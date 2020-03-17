//
//  FirstController.swift
//  CVLayouts
//
//  Created by Telem Tobi on 16/03/2020.
//  Copyright © 2020 Telem Tobi. All rights reserved.
//

import UIKit


class FirstController: UIViewController {

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
        layout.delegate = self
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(AnnotatedPhotoCell.self, forCellWithReuseIdentifier: AnnotatedPhotoCell.id)
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

extension FirstController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        annotatedPhotos.count * 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AnnotatedPhotoCell.id, for: indexPath) as! AnnotatedPhotoCell
        cell.photo = annotatedPhotos[indexPath.item % annotatedPhotos.count]
        return cell
    }
}

extension FirstController: CustomLayoutDelegate {
    func collectionView(collectionView: UICollectionView, heightForItemAt indexPath: IndexPath) -> CGFloat {
        return annotatedPhotos[indexPath.item % annotatedPhotos.count].image.size.height / 1.5
    }
}
