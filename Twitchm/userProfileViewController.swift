//
//  userProfileViewController.swift
//  Twitchm
//
//  Created by Cole McLemore on 2/28/16.
//  Copyright © 2016 Cole McLemore. All rights reserved.
//

import UIKit

class userProfileViewController: UIViewController{

    @IBOutlet weak var bannerImageView: UIImageView!
    @IBOutlet weak var followersLabel: UILabel!
    @IBOutlet weak var numTweetsLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var followingLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var profileImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        profileImageView.setImageWithURL((User.currentUser?.profileimageUrl)!)
        followersLabel.text = "Followers: \(String((User.currentUser?.followers)!))"
        numTweetsLabel.text = "Tweets: \(String((User.currentUser?.numTweets)!))"
        usernameLabel.text = "@\((User.currentUser?.screenname)!)"
        followingLabel.text = "Following: \(String((User.currentUser?.following)!))"
        nameLabel.text = User.currentUser?.name!
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.

    }
}
