//
//  ViewController.swift
//  TwitterClone
//
//  Created by Sau Chung Loh on 8/3/15.
//  Copyright (c) 2015 Sau Chung Loh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  @IBOutlet weak var tableView: UITableView!
  @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
  
  let imageQueue = NSOperationQueue() //This is a background Queue for downloading pictures
  var tweets = [Tweet]()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.registerNib(UINib(nibName: "CustomTweetCell", bundle: NSBundle.mainBundle()), forCellReuseIdentifier: "TweetCell")
    
    LoginService.loginForTwitter { (errorDescription, account) -> (Void) in
      if let errorDescription = errorDescription {
        //Warn the user
      }
      if let account = account {
        //Because this closure is on a back end Queue, move the indicator to main queue
        NSOperationQueue.mainQueue().addOperationWithBlock({ () -> Void in
          self.activityIndicator.startAnimating()
        })
        TwitterService.tweetsFromHomeTimeline(account, completionHandler: { (errorDescription, tweets) -> (Void) in
          if let tweets = tweets {
            NSOperationQueue.mainQueue().addOperationWithBlock { () -> Void in
              self.tweets = tweets
              self.activityIndicator.stopAnimating() //once tweets done loading, stop animating
              self.tableView.reloadData()
            }
          }
        })
      }
      NSNotificationCenter.defaultCenter().addObserver(self, selector: "updateLabels", name: UIContentSizeCategoryDidChangeNotification, object: nil)
    }
    tableView.estimatedRowHeight = 70
    tableView.rowHeight = UITableViewAutomaticDimension //Take dimensions from autolayout, adjust size accordingly
    tableView.dataSource = self
    tableView.reloadData()
    tableView.delegate = self
    // Do any additional setup after loading the view, typically from a nib.
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  deinit {
    NSNotificationCenter.defaultCenter().removeObserver(self, name: UIContentSizeCategoryDidChangeNotification, object: nil)
  }
  
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    if segue.identifier == "ShowDetailTweet" {
      if let detailTweetController = segue.destinationViewController as? DetailTweetViewController,
        indexPath = self.tableView.indexPathForSelectedRow() {
          let selectedRow = indexPath.row
          let selectedTweet = self.tweets[selectedRow]
          detailTweetController.selectedTweet = selectedTweet
      }
    }
  }
}

//MARK: UITableViewDataSource
extension ViewController : UITableViewDataSource {
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return tweets.count
  }
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("TweetCell", forIndexPath: indexPath) as! TweetCell
    var tweet = tweets[indexPath.row]
    cell.usernameLabel.text = tweet.username
    cell.usernameLabel.font = UIFont.preferredFontForTextStyle(UIFontTextStyleHeadline)
    cell.tweetLabel.text = tweet.text
    imageQueue.addOperationWithBlock { () -> Void in
      if let image = ImageDownloader.downloadImage(tweet) {
        NSOperationQueue.mainQueue().addOperationWithBlock({ () -> Void in
          tweet.profileImage = image
          self.tweets[indexPath.row] = tweet
          cell.profileImage.image = image
        })
      }
    }
    return cell
  }
}

//MARK: UITableViewDelegate for .NIB File
extension ViewController : UITableViewDelegate {
  func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    performSegueWithIdentifier("ShowDetailTweet", sender: nil)
  }
}