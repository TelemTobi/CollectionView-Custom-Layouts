//
//  AlbumCell.swift
//  CVLayouts
//
//  Created by Telem Tobi on 18/03/2020.
//  Copyright © 2020 Telem Tobi. All rights reserved.
//

import UIKit

class AlbumCell: UICollectionViewCell {
    
    static let id = "AnnotatedPhotoCell"
    
    private var imageView: UIImageView!
    private var albumLabel: UILabel!
    private var artistLabel: UILabel!
    
    var photo: AnnotatedPhoto? {
      didSet {
        if let photo = photo {
            imageView.image = photo.image
            albumLabel.text = photo.caption
            artistLabel.text = photo.comment
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
        contentView.backgroundColor = .none
        
        setImageView()
        setAlbumLabel()
        setNameLabel()
    }
    
    private func setImageView() {
        imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.round(radius: 5)
        contentView.addSubview(imageView)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        imageView.heightAnchor.constraint(lessThanOrEqualToConstant: contentView.frame.width).isActive = true
    }
    
    private func setAlbumLabel() {
        albumLabel = UILabel()
        albumLabel.font = .systemFont(ofSize: 14, weight: .light)
        albumLabel.textColor = .white
        albumLabel.addSubview(albumLabel)
        
        albumLabel.translatesAutoresizingMaskIntoConstraints = false
        albumLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 4).isActive = true
        albumLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 4).isActive = true
        albumLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -4).isActive = true
//        quoteLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 15).isActive = true
        
    }
    
    private func setNameLabel() {
        artistLabel = UILabel()
        artistLabel.font = .systemFont(ofSize: 14, weight: .bold)
        artistLabel.textColor = .white
        contentView.addSubview(artistLabel)
        
        artistLabel.translatesAutoresizingMaskIntoConstraints = false
        artistLabel.topAnchor.constraint(equalTo: albumLabel.bottomAnchor, constant: 4).isActive = true
        artistLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 4).isActive = true
        artistLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -4).isActive = true
        artistLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
//        nameLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 10).isActive = true
    }
}
