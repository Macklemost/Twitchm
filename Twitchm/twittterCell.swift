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
            usernameLabel.text = tweet.user?.screenname
            nameLabel.text = tweet.user?.name
            timestampLabel.text = tweet.createdAtString
            profileImageView.setImageWithURL(NSURL(string: "https://www2.pictures.zimbio.com/bg/Social+Network+Pictures+N0JKQhViZRGl.jpg")!)
            //profileImageView.setImageWithURL((tweet.user?.profileimageUrl)!)
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
        self.tweet.favorites! += 1
        likeLabel.text = ("\(tweet.favorites!)")
        likeImageView.image = UIImage(named: "likeOn")
        
    }
    @IBAction func retweetPress(sender: AnyObject) {
        self.tweet.retweet! += 1
        retweetLabel.text = ("\(tweet.retweet!)")
        retweetImageView.image = UIImage(named: "retweetOn")
    }
}
