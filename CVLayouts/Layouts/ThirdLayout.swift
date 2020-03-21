//
//  SecondLayout.swift
//  CVLayouts
//
//  Created by Telem Tobi on 17/03/2020.
//  Copyright © 2020 Telem Tobi. All rights reserved.
//

import UIKit

class ThirdLayout {
    
    static let shared = ThirdLayout()
    private init(){}
    
    func create() -> UICollectionViewLayout {
        
        let layout = UICollectionViewCompositionalLayout { (section: Int, environment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in

            let leadingItem = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0)))
            leadingItem.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)
            let leadingGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.7), heightDimension: .fractionalHeight(1))
            let leadingGroup = NSCollectionLayoutGroup.vertical(layoutSize: leadingGroupSize, subitem: leadingItem, count: 1)
            
            let trailingItem =  NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0)))
            trailingItem.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)
            let trailingGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.3), heightDimension: .fractionalHeight(1))
            
            let trailingGroup =  NSCollectionLayoutGroup.vertical(layoutSize: trailingGroupSize, subitem: trailingItem, count: 2)
            
            let containerGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),  heightDimension: .absolute(250))
            
            let subitems = (section % 2 > 0) ? [trailingGroup, leadingGroup] : [leadingGroup, trailingGroup]
            let containerGroup = NSCollectionLayoutGroup.horizontal(layoutSize: containerGroupSize, subitems: subitems)
  
            let section = NSCollectionLayoutSection(group: containerGroup)
            section.orthogonalScrollingBehavior = .continuousGroupLeadingBoundary
            section.contentInsets = NSDirectionalEdgeInsets(top: 20, leading: 0, bottom: 20, trailing: 0)
            
            let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(48))
            let headerElement = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: "header", alignment: .top)
            headerElement.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 8, bottom: 5, trailing: 8)
            section.boundarySupplementaryItems = [headerElement]
            
            return section
        }
        return layout
    }
}
