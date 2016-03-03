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
    
    var tweetID: Int = 0

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
            tweetID = (tweet.tweetID! as? Int)!
            
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    @IBAction func favoritePress(sender: AnyObject) {
        if self.likeImageView.image == UIImage(named: "likeOn") {
            TwitterClient.sharedInstance.unfavorite(Int(tweetID), params: nil, completion: { (error) -> () in
            self.tweet.favorites! += 1
                self.likeImageView.image = UIImage(named: "likeOff")
            })
        } else {
            TwitterClient.sharedInstance.favorite(Int(tweetID), params: nil, completion: { (error) -> () in
            self.tweet.favorites! -= 1
            self.likeImageView.image = UIImage(named: "likeOn")
            })
        }
        self.likeLabel.text = ("\(self.tweet.favorites!)")
        
        
        
    }
    @IBAction func retweetPress(sender: AnyObject) {
        if retweetImageView.image == UIImage(named: "retweetOn") {
            TwitterClient.sharedInstance.unretweet(Int(tweetID), params: nil, completion: { (error) -> () in
            self.tweet.retweet! += 1
            self.retweetImageView.image = UIImage(named: "retweetOff")
            })
        } else {
            TwitterClient.sharedInstance.retweet(Int(tweetID), params: nil, completion: { (error) -> () in
            self.tweet.retweet! -= 1
            self.retweetImageView.image = UIImage(named: "retweetOn")
            })
            
        }
        retweetLabel.text = ("\(tweet.retweet!)")
    }
}
