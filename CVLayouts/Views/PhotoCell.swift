//
//  PhotoCell.swift
//  CVLayouts
//
//  Created by Telem Tobi on 17/03/2020.
//  Copyright © 2020 Telem Tobi. All rights reserved.
//

import UIKit

class PhotoCell: UICollectionViewCell {
    
    static let id = "PhotoCell"
    private var imageView: UIImageView!
    
    var photo: UIImage? {
        didSet {
            if let photo = photo {
                imageView.image = photo
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpElements()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpElements() {
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 6
        contentView.layer.masksToBounds = true
        contentView.layer.borderWidth = 1
        contentView.layer.borderColor = UIColor.white.cgColor
        
        setImageView()
    }
    
    private func setImageView() {
        imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        contentView.addSubview(imageView)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    }
}
