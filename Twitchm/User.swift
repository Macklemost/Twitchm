//
//  User.swift
//  Twitchm
//
//  Created by Cole McLemore on 2/17/16.
//  Copyright © 2016 Cole McLemore. All rights reserved.
//

import UIKit

var _currentUser: User?
let currentUserKey = "kCurrentUserKey"
let userDidLoginNotification = "userDidLoginNotification"
let userDidLogoutNotification = "userDidLogoutNotification"
class User: NSObject {
    
    var name: String?
    var screenname: String?
    var profileimageUrl: NSURL?
    var tagline: String?
    var dictionary: NSDictionary
    var followers: Int?
    var numTweets: Int?
    var following: Int?
    var bannerImageUrl: NSURL?
    
    init(dictionary: NSDictionary) {
        self.dictionary = dictionary
        name = dictionary["name"] as? String
        screenname = dictionary["screen_name"] as? String
        var profileimageUrlString = dictionary["profile_image_url_https"] as? String
        var bannerImageUrlString = dictionary["profile_banner_url"]
        tagline = dictionary["description"] as? String
        if let profileimageUrlString = profileimageUrlString {
        profileimageUrl = NSURL(string: profileimageUrlString)
        }
        numTweets = dictionary["statuses_count"] as? Int
        followers = dictionary["followers_count"] as? Int
        following = dictionary["friends_count"] as? Int
        if let bannerImageUrlString = bannerImageUrlString {
            bannerImageUrl = NSURL(string: bannerImageUrlString as! String)
        }
    }
    
    func logout() {
        User.currentUser = nil
        TwitterClient.sharedInstance.requestSerializer.removeAccessToken()
        
        NSNotificationCenter.defaultCenter().postNotificationName(userDidLogoutNotification, object: nil)
        
    }
    
    class var currentUser: User? {
        get {
            if _currentUser == nil {
            // logged out or just booted up
            let data = NSUserDefaults.standardUserDefaults().objectForKey(currentUserKey) as? NSData
                if data != nil {
                    let dictionary: NSDictionary?
                    do {
                        try dictionary = NSJSONSerialization.JSONObjectWithData(data!, options: .MutableContainers) as? NSDictionary
                            _currentUser = User(dictionary: dictionary!)
                        } catch {
                            print(error)
                        }
                }
            }
            return _currentUser
        }
        set(user) {
            _currentUser = user
            
            if let _ = _currentUser {
                var data: NSData?
                do {
                    try data = NSJSONSerialization.dataWithJSONObject(user!.dictionary, options: .PrettyPrinted)
                    
                    NSUserDefaults.standardUserDefaults().setObject(data, forKey: currentUserKey)
                } catch {
                    print(error)
                }
            }
        }
    }
}
