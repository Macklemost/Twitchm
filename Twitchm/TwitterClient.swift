//
//  TwitterClient.swift
//  Twitchm
//
//  Created by Cole McLemore on 2/14/16.
//  Copyright © 2016 Cole McLemore. All rights reserved.
//

import BDBOAuth1Manager

let twitterConsumerKey = "RHH3t2OAcRqOgREVk3Gs4p0ge"
let twitterConsumerSecret = "KXeCarYm7pDuBpeuRtTPyEP0DNGOf57I9JNu1QmOpIKUeH06BV"
let twitterBaseURL = NSURL(string: "https://api.twitter.com")


class TwitterClient: BDBOAuth1SessionManager {

    var loginCompletion: ((user: User?, error: NSError?) -> ())?
    
    class var sharedInstance: TwitterClient {
        
        struct Static {
            static let instance = TwitterClient(baseURL: twitterBaseURL, consumerKey: twitterConsumerKey, consumerSecret: twitterConsumerSecret)
        }
        
        return Static.instance
    }
    
    func homeTimeline(success: ([Tweet]) -> (), failure: (NSError) -> ()) {
        GET("1.1/statuses/home_timeline.json", parameters: nil, progress: nil, success: { (task: NSURLSessionDataTask, response: AnyObject?) -> Void in
            let dictionaries = response as! [NSDictionary]
            let tweets = Tweet.tweetsWithArray(dictionaries)
            
            
            for tweet in tweets {
                print("\(tweet.text!)")
            }
            success(tweets)
            print("Home Timeline:\(response)")
            }, failure: { (task: NSURLSessionDataTask?, error: NSError) -> Void in
                print("Error getting home timeline")
                failure(error)
                
        })
    }
    
    func loginWithCompletion(completion: (user: User?, error: NSError?) -> ()) {
        loginCompletion = completion
        
        // Fetch request token and redirect to authorization page
        TwitterClient.sharedInstance.requestSerializer.removeAccessToken()
        TwitterClient.sharedInstance.fetchRequestTokenWithPath("oauth/request_token", method: "GET", callbackURL: NSURL(string: "cptwitterdemochm://oauth"), scope: nil, success: {(requestToken: BDBOAuth1Credential!) -> Void in
            print("Got the Request Token")
            var authURL = NSURL(string: "https://api.twitter.com/oauth/authorize?oauth_token=\(requestToken.token)")
            UIApplication.sharedApplication().openURL(authURL!)
            }) {(error: NSError!) -> Void in
                print("Failed to get request token")
                self.loginCompletion?(user: nil, error: error)
            }
        }
    
    func openURL(url: NSURL) {
        fetchAccessTokenWithPath("oauth/access_token", method: "POST", requestToken: BDBOAuth1Credential (queryString: url.query), success: {(accessToken: BDBOAuth1Credential!) -> Void in
            print("Got the access token!")
            TwitterClient.sharedInstance.requestSerializer.saveAccessToken(accessToken)
            
            
            TwitterClient.sharedInstance.GET("1.1/account/verify_credentials.json", parameters: nil, progress: nil, success: { (task: NSURLSessionDataTask, response: AnyObject?) -> Void in
                print("user:\(response)")
                let user = User(dictionary: response as! NSDictionary)
                User.currentUser = user
                print("user: \(user.name)")
                print("screenname: \(user.screenname)")
                print("profile url: \(user.profileimageUrl)")
                print("tagline :\(user.tagline)")
                self.loginCompletion?(user: user, error: nil)
                
                }, failure: { (operation: NSURLSessionDataTask?, error: NSError!) -> Void in
                    print("Error getting current user")
                    self.loginCompletion?(user: nil, error: error)
            })
        
        }) { (error: NSError!) -> Void in
            print("Failed to reveive access token")
            self.loginCompletion?(user: nil, error: error)
        }
        

    }
    
}
