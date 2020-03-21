//
//  PhotoCell.swift
//  CVLayouts
//
//  Created by Telem Tobi on 17/03/2020.
//  Copyright © 2020 Telem Tobi. All rights reserved.
//

import UIKit

class SectionHeader: UICollectionReusableView {
    
    static let id = "SectionHeader"
    var titleLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUp()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUp() {
        
        setUpTitleLabel()
    }
    
    func setUpTitleLabel() {
        titleLabel = UILabel()
        titleLabel.font = .systemFont(ofSize: 30, weight: .light)
        titleLabel.text = "Section Header"
        titleLabel.contentMode = .bottomLeft
        titleLabel.textColor = .white
        addSubview(titleLabel)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
}
