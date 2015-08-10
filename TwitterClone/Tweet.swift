//
//  Tweet.swift
//  TwitterClone
//
//  Created by Sau Chung Loh on 8/4/15.
//  Copyright (c) 2015 Sau Chung Loh. All rights reserved.
//

import UIKit

struct Tweet {
  //Tweet Properties
  let text : String
  let username : String
  let id : String
  let location : String
  let profileImageURL : String
  var profileImage : UIImage?
  let screenName : String
  
  //Retweet Properties
  let isARetweet: Bool
  let rtText : String?
  let rtUsername : String?
  let rtId : String?
  let rtLocation : String?
  let rtProfileImageURL : String?
  var rtProfileImage : UIImage?
  let rtScreenName : String?
  
  //Quote Properties
  let isAQuote : Bool
  let qtText : String?
  let qtUsername : String?
  let qtId : String?
  let qtLocation : String? 
  let qtProfileImageURL : String?
  var qtProfileImage : UIImage?
  let qtScreenName : String?
}

