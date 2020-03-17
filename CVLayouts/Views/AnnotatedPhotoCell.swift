//
//  FirstCell.swift
//  CVLayouts
//
//  Created by Telem Tobi on 16/03/2020.
//  Copyright © 2020 Telem Tobi. All rights reserved.
//

import UIKit

class AnnotatedPhotoCell: UICollectionViewCell {
    
    static let id = "AnnotatedPhotoCell"
    private var imageView: UIImageView!
    private var quoteLabel: UILabel!
    private var nameLabel: UILabel!
    
    var photo: AnnotatedPhoto? {
      didSet {
        if let photo = photo {
            imageView.image = photo.image
            quoteLabel.text = photo.caption
            nameLabel.text = photo.comment
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
        contentView.layer.borderWidth = 2
        contentView.layer.borderColor = UIColor.white.cgColor
        
        setImageView()
        setQuoteLabel()
        setNameLabel()
    }
    
    private func setImageView() {
        imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        contentView.addSubview(imageView)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
    }
    
    private func setQuoteLabel() {
        quoteLabel = UILabel()
        quoteLabel.font = .systemFont(ofSize: 10, weight: .light)
        quoteLabel.numberOfLines = 0
        contentView.addSubview(quoteLabel)
        
        quoteLabel.translatesAutoresizingMaskIntoConstraints = false
        quoteLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 4).isActive = true
        quoteLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 4).isActive = true
        quoteLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -4).isActive = true
        
    }
    
    private func setNameLabel() {
        nameLabel = UILabel()
        nameLabel.font = .systemFont(ofSize: 10, weight: .bold)
        contentView.addSubview(nameLabel)
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.topAnchor.constraint(equalTo: quoteLabel.bottomAnchor, constant: 4).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 4).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -4).isActive = true
        nameLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8).isActive = true
    }
}
