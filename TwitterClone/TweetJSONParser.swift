//
//  TweetJSONParser.swift
//  TwitterClone
//
//  Created by Sau Chung Loh on 8/4/15.
//  Copyright (c) 2015 Sau Chung Loh. All rights reserved.
//

import Foundation

class TweetJSONParser {
  class func tweetsFromJSONData(jsonData : NSData) -> [Tweet]? {
    
    var error : NSError?
    
    if let rootObject = NSJSONSerialization.JSONObjectWithData(jsonData, options: nil, error: &error) as? [[String : AnyObject]] {
      var tweets = [Tweet]()
      for tweetObject in rootObject {
        if let text = tweetObject["text"] as? String,
          id = tweetObject["id_str"] as? String,
          userInfo = tweetObject["user"] as? [String : AnyObject],
          username = userInfo["name"] as? String,
          profileImageURL = userInfo["profile_image_url_https"] as? String {
            let tweet = Tweet(text: text, username: username, id: id, profileImageURL: profileImageURL)
            tweets.append(tweet)
        }
      }
      return tweets
    }
    if let error = error {
      //Check the error here.
    }
    return nil
  }
}