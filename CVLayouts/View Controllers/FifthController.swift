//
//  FirstController.swift
//  CVLayouts
//
//  Created by Telem Tobi on 16/03/2020.
//  Copyright © 2020 Telem Tobi. All rights reserved.
//

import UIKit


class FifthController: UIViewController {

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
        let layout = FifthLayout()
        layout.delegate = self
        collectionView = prepareCollectionView(layout: layout)
        
        collectionView.register(NumberCell.self, forCellWithReuseIdentifier: NumberCell.id)
        collectionView.delegate = self
        collectionView.dataSource = self
    }
}

extension FifthController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        40
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NumberCell.id, for: indexPath) as! NumberCell
        cell.numberLabel.text = (indexPath.item + 1).description
        cell.contentView.backgroundColor = indexPath.item % 2 == 0 ? .systemBlue : .systemPink
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
       cell.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
        UIView.animate(withDuration: 0.4, delay: 0.0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.8, options: .curveEaseOut, animations: {
            cell.transform = .identity
        }, completion: nil)
    }
}

extension FifthController: CustomLayoutDelegate {
    func collectionView(collectionView: UICollectionView, heightForItemAt indexPath: IndexPath) -> CGFloat {
        return CGFloat.random(in: 100...250)
    }
}
