//
//  ThirdController.swift
//  CVLayouts
//
//  Created by Telem Tobi on 17/03/2020.
//  Copyright © 2020 Telem Tobi. All rights reserved.
//

import UIKit

class ThirdConreoller: UIViewController {
    
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
        let layout = ThirdLayout()
        layout.delegate = self
        collectionView = prepareCollectionView(layout: layout)
        
        collectionView.register(NumberCell.self, forCellWithReuseIdentifier: NumberCell.id)
        collectionView.delegate = self
        collectionView.dataSource = self
    }
}

extension ThirdConreoller: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NumberCell.id, for: indexPath) as! NumberCell
        cell.numberLabel.text = (indexPath.item + 1).description
        return cell
    }
}

extension ThirdConreoller: CustomLayoutDelegate {
    func collectionView(collectionView: UICollectionView, heightForItemAt indexPath: IndexPath) -> CGFloat {
        0
    }
    
    func theNumberOfItemsInCollectionView() -> Int {
        return collectionView.numberOfItems(inSection: 0)
    }
}
