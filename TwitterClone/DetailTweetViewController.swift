//
//  DetailTweetViewController.swift
//  TwitterClone
//
//  Created by Sau Chung Loh on 8/5/15.
//  Copyright (c) 2015 Sau Chung Loh. All rights reserved.
//

import UIKit

class DetailTweetViewController: UIViewController, UINavigationControllerDelegate {
  
  @IBOutlet weak var usernameLabel: UILabel!
  @IBOutlet weak var tweetLabel: UILabel!
  @IBOutlet weak var profilePictureButton: UIButton!
  
  var selectedTweet: Tweet!

  override func viewDidLoad() {
    super.viewDidLoad()
    self.usernameLabel.font = UIFont.preferredFontForTextStyle(UIFontTextStyleHeadline)
    
    //If the tweet selected was a quote or retweet, its original author's information will be displayed.
    //Otherwise it will just display the current author's information.
    if selectedTweet.isARetweet {
      self.usernameLabel.text = selectedTweet.rtUsername
      self.tweetLabel.text = selectedTweet.rtText
      self.profilePictureButton.setImage(selectedTweet.rtProfileImage, forState: .Normal)
    } else if selectedTweet.isAQuote {
      self.usernameLabel.text = selectedTweet.qtUsername
      self.tweetLabel.text = selectedTweet.qtText
      self.profilePictureButton.setImage(selectedTweet.qtProfileImage, forState: .Normal)
    } else {
      self.usernameLabel.text = selectedTweet.username
      self.tweetLabel.text = selectedTweet.text
      self.profilePictureButton.setImage(selectedTweet.profileImage, forState: .Normal)
    }
    // Do any additional setup after loading the view, typically from a nib.
  }
  
  //This segue passes a reference of the selected tweet object to the ProfileTimeLineVC
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    if segue.identifier == "ShowProfileTimeLine" {
      if let profileTimeLineController = segue.destinationViewController as? ProfileTimeLineViewController  {
        profileTimeLineController.selectedTweet = selectedTweet
      }
    }
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
}