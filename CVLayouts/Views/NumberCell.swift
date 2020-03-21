//
//  NumberCell.swift
//  CVLayouts
//
//  Created by Telem Tobi on 17/03/2020.
//  Copyright © 2020 Telem Tobi. All rights reserved.
//

import UIKit

class NumberCell: UICollectionViewCell {
    
    static let id = "NumberCell"
    var numberLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpElements()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpElements() {
        contentView.layer.borderWidth = 2
        contentView.layer.borderColor = UIColor.white.cgColor
        
        setNumberLabel()
    }
    
    private func setNumberLabel() {
        numberLabel = UILabel()
        numberLabel.textColor = .white
        numberLabel.font = .systemFont(ofSize: 26, weight: .light)
        contentView.addSubview(numberLabel)
        
        numberLabel.translatesAutoresizingMaskIntoConstraints = false
        numberLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        numberLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
    }
}
