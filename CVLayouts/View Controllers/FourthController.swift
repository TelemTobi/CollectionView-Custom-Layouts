//
//  ThirdController.swift
//  CVLayouts
//
//  Created by Telem Tobi on 17/03/2020.
//  Copyright © 2020 Telem Tobi. All rights reserved.
//

import UIKit

class FourthController: UIViewController {
    
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
        let layout = FourthLayout()
        collectionView = prepareCollectionView(layout: layout)
        
        collectionView.register(NumberCell.self, forCellWithReuseIdentifier: NumberCell.id)
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    func themeColor(_ number: Int) -> UIColor {
        if number == 1 {
            return .systemPink
        } else if number == 2  || number == 3 {
            return .systemBlue
        }
        for i in 2...number / 2 {
            if number % i == 0 {
                return .systemBlue
            }
        }
        return .systemPink
    }
}

extension FourthController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NumberCell.id, for: indexPath) as! NumberCell
        cell.numberLabel.text = (indexPath.item + 1).description
        cell.contentView.backgroundColor = themeColor(indexPath.item + 1)
        cell.contentView.round()
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
       cell.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
        UIView.animate(withDuration: 0.4, delay: 0.0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.8, options: .curveEaseOut, animations: {
            cell.transform = .identity
        }, completion: nil)
    }
}
