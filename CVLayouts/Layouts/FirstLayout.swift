//
//  FirstLayout.swift
//  CVLayouts
//
//  Created by Telem Tobi on 18/03/2020.
//  Copyright © 2020 Telem Tobi. All rights reserved.
//

import UIKit

class FirstLayout {
    
    static let shared = FirstLayout()
    private init(){}
      
    func create() -> UICollectionViewLayout {
      
      let layout = UICollectionViewCompositionalLayout { (section: Int, environment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in

        let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: NSCollectionLayoutDimension.fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0)))
        item.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)
        
        let leadingGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(0.25))
        let leadingGroup = NSCollectionLayoutGroup.horizontal(layoutSize: leadingGroupSize, subitem: item, count: 5)
        
        let sideGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.2), heightDimension: .fractionalHeight(1))
        let sideGroup = NSCollectionLayoutGroup.vertical(layoutSize: sideGroupSize, subitem: item, count: 3)
        
        let bigGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.6), heightDimension: .fractionalHeight(1))
        let bigGroup = NSCollectionLayoutGroup.vertical(layoutSize: bigGroupSize, subitem: item, count: 1)
        
        let middleGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(0.75))
        let middleGroup = NSCollectionLayoutGroup.horizontal(layoutSize: middleGroupSize, subitems: [sideGroup, bigGroup, sideGroup])
        
        let containerGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),  heightDimension: .fractionalWidth(0.8))
        let subitems = [leadingGroup, middleGroup]
        let containerGroup = NSCollectionLayoutGroup.vertical(layoutSize: containerGroupSize, subitems: subitems)
        
        let section = NSCollectionLayoutSection(group: containerGroup)
//        section.orthogonalScrollingBehavior = .continuousGroupLeadingBoundary
        section.contentInsets = NSDirectionalEdgeInsets(top: 20, leading: 0, bottom: 20, trailing: 0)
        
        return section
      }
      return layout
    }
}
