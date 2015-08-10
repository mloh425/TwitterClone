//
//  ImageDownloader.swift
//  TwitterClone
//
//  Created by Sau Chung Loh on 8/7/15.
//  Copyright (c) 2015 Sau Chung Loh. All rights reserved.
//

import UIKit

class ImageDownloader {
  //Image downloader using a tweet object, as used in VC
  class func downloadImage(tweet : Tweet) -> UIImage? {
    if let imageURL = NSURL(string: tweet.profileImageURL.stringByReplacingOccurrencesOfString("_normal", withString: "", options: NSStringCompareOptions.LiteralSearch, range: nil)),
      let imageData = NSData(contentsOfURL: imageURL),
      let image = UIImage(data: imageData)  {
        var size = determineProfileImageSize()
        let resizedImage = ImageResizer.resizeImage(image, size: size)
        return resizedImage
    } else {
      return nil
    }
  }
  
  //Image downloader that uses a URL directly, used in Tweet JSON Parsing
  class func downloadImage(profileImageURL : String) -> UIImage? {
    if let imageURL = NSURL(string: profileImageURL.stringByReplacingOccurrencesOfString("_normal", withString: "", options: NSStringCompareOptions.LiteralSearch, range: nil)),
      let imageData = NSData(contentsOfURL: imageURL),
      let image = UIImage(data: imageData)  {
        var size = determineProfileImageSize()
        let resizedImage = ImageResizer.resizeImage(image, size: size)
        return resizedImage
    } else {
      return nil
    }
  }
  
  //Returns the proper dimensions for the profile picture based on the device's screen size
  class func determineProfileImageSize() -> CGSize {
    var size : CGSize
    switch UIScreen.mainScreen().scale {
      case 2:
      size = CGSize(width: 160, height: 160)
    case 3:
      size = CGSize(width: 240, height: 240)
    default:
      size = CGSize(width: 80, height: 80)
    }
    return size
  }
}

