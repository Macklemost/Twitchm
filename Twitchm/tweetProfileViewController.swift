//
//  tweetProfileViewController.swift
//  Twitchm
//
//  Created by Cole McLemore on 2/27/16.
//  Copyright © 2016 Cole McLemore. All rights reserved.
//

import UIKit

class tweetProfileViewController: UIViewController {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var followersLabel: UILabel!
    @IBOutlet weak var followingLabel: UILabel!
    @IBOutlet weak var numTweetsLabel: UILabel!
    
    var tweet: Tweet!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        nameLabel.text = tweet.user!.name
        profileImageView.setImageWithURL(tweet.user!.profileimageUrl!)
        usernameLabel.text = "@\((tweet.user!.screenname)!)"
        followersLabel.text = "Followers: \(String((tweet.user!.followers)!))"
        followingLabel.text = "Following: \(String((tweet.user!.following)!))"
        numTweetsLabel.text = "Tweets: \(String((tweet.user!.numTweets)!))"
        nameLabel.sizeToFit()
        usernameLabel.sizeToFit()
        followersLabel.sizeToFit()
        followingLabel.sizeToFit()
        numTweetsLabel.sizeToFit()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}