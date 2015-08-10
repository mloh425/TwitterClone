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
  
  static let sharedService = TwitterService()
  
  var account: ACAccount? //Set an account that is to be stored in singleton
  
  private init() {}
  
  //Makes a request for an array of tweets for the logged in user's home timeline.
  class func tweetsFromHomeTimeline(account: ACAccount, completionHandler: (String?, [Tweet]?) -> (Void)) {
    let request = SLRequest(forServiceType: SLServiceTypeTwitter, requestMethod: SLRequestMethod.GET, URL: NSURL(string: "https://api.twitter.com/1.1/statuses/home_timeline.json")!, parameters: nil) //parameters - extra credit, older/newer tweets
    request.account = account
    //request.account = self.sharedService.account
    
    request.performRequestWithHandler { (data, response, error) -> Void in
      if let error = error {
        completionHandler("Could not connect to the server", nil)
      } else {
        switch response.statusCode {
        case 200:
          let tweets = TweetJSONParser.tweetsFromJSONData(data)
          completionHandler(nil, tweets)
        case 400...499:
          completionHandler("An unexpected error occured in the application", nil)
        case 500...599:
          completionHandler("An unexpected error occured with the servers", nil)
        default:
          completionHandler("Unexpected Error", nil)
        }
      }
    }
  }
  
  //Makes a request for an array of tweets from a selected user using a screen name.
  //(Refactoring should be considered)
  class func tweetsFromUserTimeline(account : ACAccount, screenName : String, completionHandler : (String?, [Tweet]?) -> (Void)) {
    let request = SLRequest(forServiceType: SLServiceTypeTwitter, requestMethod: SLRequestMethod.GET, URL: NSURL(string: "https://api.twitter.com/1.1/statuses/user_timeline.json?screen_name=\(screenName)")!, parameters: nil)
    request.account = account
    request.performRequestWithHandler { (data, response, error) -> Void in
      if let error = error {
        completionHandler("Could not connect to the server", nil)
      } else {
        switch response.statusCode {
        case 200:
          let tweets = TweetJSONParser.tweetsFromJSONData(data)
          completionHandler(nil, tweets)
        case 400...499:
          completionHandler("An unexpected error occured in the application", nil)
        case 500...599:
          completionHandler("An unexpected error occured with the servers", nil)
        default:
          completionHandler("Unexpected Error", nil)
        }
      }
    }
  }
}