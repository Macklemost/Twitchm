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
    
    init(dictionary: NSDictionary) {
        var user = User(dictionary: dictionary["user"] as! NSDictionary)
        var text = dictionary["text"] as? String
        createdAtString = dictionary["created_at"] as? String
        var formatter = NSDateFormatter()
        formatter.dateFormat = "EEE MMM d HH:mm:ss Z y"
        createdAt = formatter.dateFromString(createdAtString!)
    }
    
    class func tweetsWithArray(array: [NSDictionary]) -> [Tweet] {
            var tweets = [Tweet]()
            
            for dictionary in array{
                tweets.append(Tweet(dictionary: dictionary))
                print("Test please \(dictionary)")
        }
            return tweets
        }
        
    }
    