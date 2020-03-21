//
//  SecondLayout.swift
//  CVLayouts
//
//  Created by Telem Tobi on 20/03/2020.
//  Copyright © 2020 Telem Tobi. All rights reserved.
//

import UIKit

class SecondLayout {
    
    static let shared = SecondLayout()
    private init(){}
      
    func create() -> UICollectionViewLayout {
      
      let layout = UICollectionViewCompositionalLayout { (section: Int, environment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in
        var containerGroup: NSCollectionLayoutGroup

        
        if section == 0 {
            let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.2), heightDimension: .fractionalWidth(0.2)))
            item.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 0, trailing: 5)
            let containerGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(0.1))
            containerGroup = NSCollectionLayoutGroup.horizontal(layoutSize: containerGroupSize, subitems: [item])
        } else {
            let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5), heightDimension: .fractionalHeight(1.0)))
            item.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 8, bottom: 5, trailing: 8)
            let rowGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(0.25))
            let rowGroup = NSCollectionLayoutGroup.horizontal(layoutSize: rowGroupSize, subitem: item, count: 2)
            let containerGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(0.9))
            containerGroup = NSCollectionLayoutGroup.vertical(layoutSize: containerGroupSize, subitems: [rowGroup])
        }
        
        let layoutSection = NSCollectionLayoutSection(group: containerGroup)
        layoutSection.orthogonalScrollingBehavior = section == 0 ? .continuous : .none
        layoutSection.contentInsets = NSDirectionalEdgeInsets(top: 20, leading: 0, bottom: 20, trailing: 0)
        
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(48))
        let headerElement = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: "header", alignment: .top)
        headerElement.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 8, bottom: 5, trailing: 8)
        layoutSection.boundarySupplementaryItems = [headerElement]
        
        return layoutSection
      }
      return layout
    }
}
