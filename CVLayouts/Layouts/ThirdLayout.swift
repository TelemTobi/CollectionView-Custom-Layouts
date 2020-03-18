//
//  ThirdLayout.swift
//  CVLayouts
//
//  Created by Telem Tobi on 17/03/2020.
//  Copyright © 2020 Telem Tobi. All rights reserved.
//

import UIKit

class ThirdLayout: UICollectionViewLayout {
    
    var delegate: CustomLayoutDelegate?
    
    private let numberOfColumns = 3
    private let cellPadding: CGFloat = 6
    private let cellHeight: CGFloat = 150
    
    private var cache = [UICollectionViewLayoutAttributes]()
    
    private var contentHeight: CGFloat = 0
    private var contentWidth: CGFloat {
      guard let collectionView = collectionView else {
        return 0
      }
      let insets = collectionView.contentInset
      return collectionView.bounds.width - (insets.left + insets.right)
    }
    
    override var collectionViewContentSize: CGSize {
        return CGSize(width: contentWidth, height: contentHeight)
    }
    
    override func prepare() {
        guard cache.isEmpty == true, let collectionView = collectionView else { return }
        
        let columnWidth = contentWidth / CGFloat(numberOfColumns)
        let xOffset: [CGFloat] = [0, columnWidth * 2, columnWidth]
        var yOffset: [CGFloat] = [2 * cellPadding, 2 * cellPadding, cellPadding + cellHeight]
        
        var column = 0
        
        for item in 0..<collectionView.numberOfItems(inSection: 0) {
            let indexPath = IndexPath(item: item, section: 0)
            
            let frame = CGRect(x: xOffset[column], y: yOffset[column], width: columnWidth, height: columnWidth)
            let insetFrame = frame.insetBy(dx: cellPadding, dy: cellPadding)
                
            let attributes = UICollectionViewLayoutAttributes(forCellWith: indexPath)
            attributes.frame = insetFrame
            cache.append(attributes)
                
            contentHeight = max(contentHeight, frame.maxY)
            
            let height = cellPadding * 2 + cellHeight
            yOffset[column] = yOffset[column] + 2 * (height - cellPadding)
                
            let numberOfItems = delegate?.theNumberOfItemsInCollectionView()
            if let numberOfItems = numberOfItems, indexPath.item == numberOfItems - 1 {
                switch column {
                     case 0:
                       column = 2
                     case 2:
                       column = 0
                     case 1:
                       column = 2
                     default:
                       return
                }
            } else {
                column = column < (numberOfColumns - 1) ? (column + 1) : 0
            }
        }
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        var visibleLayoutAttributes: [UICollectionViewLayoutAttributes] = []
        
        for attributes in cache {
          if attributes.frame.intersects(rect) {
            visibleLayoutAttributes.append(attributes)
          }
        }
        return visibleLayoutAttributes
    }
    
    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        return cache[indexPath.item]
    }
}
