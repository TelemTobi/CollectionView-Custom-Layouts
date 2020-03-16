//
//  FirstCell.swift
//  CVLayouts
//
//  Created by Telem Tobi on 16/03/2020.
//  Copyright © 2020 Telem Tobi. All rights reserved.
//

import UIKit

class AnnotatedPhotoCell: UICollectionViewCell {
    
    static let id = "FirstCell"
    private var imageView: UIImageView!
    private var captionLabel: UILabel!
    private var commentLabel: UILabel!
    
    var photo: AnnotatedPhoto? {
      didSet {
        if let photo = photo {
            imageView.image = photo.image
            captionLabel.text = photo.caption
            commentLabel.text = photo.comment
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
    
    func setUpElements() {
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 6
        contentView.layer.masksToBounds = true
        contentView.layer.borderWidth = 2
        contentView.layer.borderColor = UIColor.white.cgColor
        
        setImageView()
        setCaptionLabel()
        setCommentLabel()
    }
    
    func setImageView() {
        imageView = UIImageView()
        contentView.addSubview(imageView)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true    }
    
    func setCaptionLabel() {
        captionLabel = UILabel()
        captionLabel.font = .systemFont(ofSize: 10, weight: .light)
        captionLabel.numberOfLines = 0
        contentView.addSubview(captionLabel)
        
        captionLabel.translatesAutoresizingMaskIntoConstraints = false
        captionLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 4).isActive = true
        captionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 4).isActive = true
        captionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -4).isActive = true
        
    }
    
    func setCommentLabel() {
        commentLabel = UILabel()
        commentLabel.font = .systemFont(ofSize: 10, weight: .bold)
        contentView.addSubview(commentLabel)
        
        commentLabel.translatesAutoresizingMaskIntoConstraints = false
        commentLabel.topAnchor.constraint(equalTo: captionLabel.bottomAnchor, constant: 4).isActive = true
        commentLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 4).isActive = true
        commentLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -4).isActive = true
        commentLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8).isActive = true
    }
}
