//
//  Tweet.swift
//  Twitchm
//
//  Created by Cole McLemore on 2/17/16.
//  Copyright © 2016 Cole McLemore. All rights reserved.
//

import UIKit

class Tweet: NSObject {

    var user: User?
    var text: String?
    var createdAtString: String?
    var createdAt: NSDate?
    var favorites: Int?
    var retweet: Int?
    var tweetID: Int?
    
    init(dictionary: NSDictionary) {
        user = User(dictionary: dictionary["user"] as! NSDictionary)
        text = dictionary["text"] as? String
        createdAtString = dictionary["created_at"] as? String
        let formatter = NSDateFormatter()
        formatter.dateFormat = "EEE MMM d HH:mm:ss Z y"
        createdAt = formatter.dateFromString(createdAtString!)
        favorites = dictionary["favorite_count"] as? Int
        retweet = dictionary["retweet_count"] as? Int
        tweetID = dictionary["id"] as? Int
    }
    
    class func tweetsWithArray(array: [NSDictionary]) -> [Tweet] {
            var tweets = [Tweet]()
            
            for dictionary in array{
                tweets.append(Tweet(dictionary: dictionary))
        }
            return tweets
        }
    
    }
    