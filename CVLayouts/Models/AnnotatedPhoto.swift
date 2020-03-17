//
//  AnnotatedPhoto.swift
//  CVLayouts
//
//  Created by Telem Tobi on 16/03/2020.
//  Copyright © 2020 Telem Tobi. All rights reserved.
//

import UIKit

let annotatedPhotos = AnnotatedPhoto.allPhotos()
var shuffledPhotos: [AnnotatedPhoto] {
    get {
        return annotatedPhotos.shuffled()
    }
}

class AnnotatedPhoto {
    var caption: String
    var comment: String
    var image: UIImage
    
    init(caption: String, comment: String, image: UIImage) {
      self.caption = caption
      self.comment = comment
      self.image = image
    }
    
    convenience init?(dictionary: [String: String]) {
      guard
        let caption = dictionary["Caption"],
        let comment = dictionary["Comment"],
        let photo = dictionary["Photo"],
        let image = UIImage(named: photo)
        else {
          return nil
      }
      self.init(caption: caption, comment: comment, image: image)
    }

    static func allPhotos() -> [AnnotatedPhoto] {
      var photos: [AnnotatedPhoto] = []
      guard
        let URL = Bundle.main.url(forResource: "AnnotatedPhotos", withExtension: "plist"),
        let photosFromPlist = NSArray(contentsOf: URL) as? [[String: String]]
        else {
          return photos
      }
      for dictionary in photosFromPlist {
        if let photo = AnnotatedPhoto(dictionary: dictionary) {
          photos.append(photo)
        }
      }
      return photos
    }
}
