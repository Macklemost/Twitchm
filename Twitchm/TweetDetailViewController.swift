//
//  TweetDetailViewController.swift
//  Twitchm
//
//  Created by Cole McLemore on 2/22/16.
//  Copyright © 2016 Cole McLemore. All rights reserved.
//

import UIKit

class TweetDetailViewController: UIViewController {
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var likeCountLabel: UILabel!
    @IBOutlet weak var retweetCountLabel: UILabel!
    @IBOutlet weak var timestampLabel: UILabel!
    @IBOutlet weak var tweetLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var retweetImageView: UIImageView!
    @IBOutlet weak var likeImageView: UIImageView!
    
    var tweet: Tweet!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tweetLabel.text = tweet.text!
        usernameLabel.text = tweet.user?.screenname
        nameLabel.text = tweet.user?.name
        timestampLabel.text = String(tweet.createdAt!)
        likeCountLabel.text = String(tweet.favorites!)
        retweetCountLabel.text = String(tweet.retweet!)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func retweetDetail(sender: AnyObject) {
        if retweetImageView.image == UIImage(named: "retweetOn") {
            self.tweet.retweet! -= 1
            retweetImageView.image = UIImage(named: "retweetOff")
        } else {
            self.tweet.retweet! += 1
            retweetImageView.image = UIImage(named: "retweetOn")
        }
        retweetCountLabel.text = ("\(tweet.retweet!)")
    }
    @IBAction func likeDetail(sender: AnyObject) {
        if likeImageView.image == UIImage(named: "likeOn") {
            self.tweet.favorites! -= 1
            likeImageView.image = UIImage(named: "likeOff")
        } else {
            self.tweet.favorites! += 1
            likeImageView.image = UIImage(named: "likeOn")
        }
        likeCountLabel.text = ("\(tweet.favorites!)")
    }
}
