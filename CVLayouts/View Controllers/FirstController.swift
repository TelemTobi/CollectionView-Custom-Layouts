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
        let layout = FirstLayout.shared.create()
        collectionView = prepareCollectionView(layout: layout)
        
        collectionView.register(NumberCell.self, forCellWithReuseIdentifier: NumberCell.id)
        collectionView.delegate = self
        collectionView.dataSource = self
    }
}

extension FirstController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        53
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NumberCell.id, for: indexPath) as! NumberCell
        cell.numberLabel.text = (indexPath.item + 1).description
        cell.contentView.backgroundColor = (indexPath.item + 1) == 9 || (indexPath.item + 1) % 12 == 9 ? .systemBlue : .systemPink
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
       cell.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
        UIView.animate(withDuration: 0.4, delay: 0.0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.8, options: .curveEaseOut, animations: {
            cell.transform = .identity
        }, completion: nil)
    }
}
