//
//  twittterCell.swift
//  Twitchm
//
//  Created by Cole McLemore on 2/20/16.
//  Copyright © 2016 Cole McLemore. All rights reserved.
//

import UIKit

class twittterCell: UITableViewCell {

    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var tweetTextLabel: UILabel!
    @IBOutlet weak var timestampLabel: UILabel!
    @IBOutlet weak var retweetLabel: UILabel!
    @IBOutlet weak var likeLabel: UILabel!
    @IBOutlet weak var retweetImageView: UIImageView!
    @IBOutlet weak var likeImageView: UIImageView!
    
    var tweet: Tweet! {
        didSet {
            tweetTextLabel.text = tweet.text
            tweetTextLabel.sizeToFit()
            usernameLabel.text = tweet.user?.screenname
            nameLabel.text = tweet.user?.name
            timestampLabel.text = String(tweet.createdAt!)
            profileImageView.setImageWithURL((tweet?.user!.profileimageUrl)!)
            retweetLabel.text = ("\(tweet.retweet!)")
            likeLabel.text = ("\(tweet.favorites!)")
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    @IBAction func favoritePress(sender: AnyObject) {
        if likeImageView.image == UIImage(named: "likeOn") {
            self.tweet.favorites! -= 1
            likeImageView.image = UIImage(named: "likeOff")
        } else {
            self.tweet.favorites! += 1
            likeImageView.image = UIImage(named: "likeOn")
        }
        likeLabel.text = ("\(tweet.favorites!)")
        
    }
    @IBAction func retweetPress(sender: AnyObject) {
        if retweetImageView.image == UIImage(named: "retweetOn") {
            self.tweet.retweet! -= 1
            retweetImageView.image = UIImage(named: "retweetOff")
        } else {
            self.tweet.retweet! += 1
            retweetImageView.image = UIImage(named: "retweetOn")
        }
        retweetLabel.text = ("\(tweet.retweet!)")
    }
}
