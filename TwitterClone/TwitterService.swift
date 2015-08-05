//
//  TwitterService.swift
//  TwitterClone
//
//  Created by Sau Chung Loh on 8/4/15.
//  Copyright (c) 2015 Sau Chung Loh. All rights reserved.
//

import Foundation
import Accounts
import Social

class TwitterService {
  class func tweetsFromHomeTimeline(account: ACAccount, completionHandler : (String?, [Tweet]?) -> (Void)) {
    let request = SLRequest(forServiceType: SLServiceTypeTwitter, requestMethod: SLRequestMethod.GET, URL: NSURL(string: "https://api.twitter.com/1.1/statuses/home_timeline.json")!, parameters: nil) //parameters - extra credit, older/newer tweets
    request.account = account
    request.performRequestWithHandler { (data, response, error) -> Void in
      if let error = error {
        completionHandler("Could not connect to the server", nil)
      } else {
        let tweets = TweetJSONParser.tweetsFromJSONData(data)
        completionHandler(nil, tweets)
      }
    }
    
  }
}