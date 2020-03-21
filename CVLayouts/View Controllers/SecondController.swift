//
//  SecondController.swift
//  CVLayouts
//
//  Created by Telem Tobi on 20/03/2020.
//  Copyright © 2020 Telem Tobi. All rights reserved.
//

import UIKit

class SecondController: UIViewController {
    
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
        let layout = SecondLayout.shared.create()
        collectionView = prepareCollectionView(layout: layout)
        
        collectionView.register(NumberCell.self, forCellWithReuseIdentifier: NumberCell.id)
        collectionView.register(SectionHeader.self, forSupplementaryViewOfKind: "header", withReuseIdentifier: SectionHeader.id)
        collectionView.delegate = self
        collectionView.dataSource = self
    }
}

extension SecondController: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NumberCell.id, for: indexPath) as! NumberCell
        cell.numberLabel.text = (indexPath.item + 1).description
        if indexPath.section == 0 {
            cell.contentView.layer.cornerRadius = (collectionView.frame.width - 50) * 0.1
            cell.contentView.backgroundColor = .systemPink
        } else {
            cell.contentView.layer.cornerRadius = 5
            cell.contentView.backgroundColor = .systemBlue
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
       cell.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
        UIView.animate(withDuration: 0.4, delay: 0.0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.8, options: .curveEaseOut, animations: {
            cell.transform = .identity
        }, completion: nil)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: "header", withReuseIdentifier: SectionHeader.id, for: indexPath) as! SectionHeader
        header.titleLabel.text = "Section Header # \(indexPath.section + 1)"
        return header
    }
}
