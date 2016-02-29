//
//  TweetsViewController.swift
//  Twitchm
//
//  Created by Cole McLemore on 2/20/16.
//  Copyright © 2016 Cole McLemore. All rights reserved.
//

import UIKit

class TweetsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    var tweets: [Tweet]?
    var tweet: Tweet!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 340
        
        self.tableView.reloadData()
        
        TwitterClient.sharedInstance.homeTimeline(nil) { (tweets, error) -> () in
            self.tweets = tweets
            self.tableView.reloadData()
        }
                print("TimeLine error in TVC")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.

    }
    @IBAction func onLogout(sender: AnyObject) {
        User.currentUser?.logout()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("twitterCell", forIndexPath: indexPath) as! twittterCell
        if tweets != nil{
        cell.tweet = tweets![indexPath.row]
        }
        return cell
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "TwitterDetailView" {
            let cell = sender as! twittterCell
            let detailedTweet = cell.tweet
            let destinationViewController = segue.destinationViewController as! TweetDetailViewController
            destinationViewController.tweet = detailedTweet
        }
        if segue.identifier == "tweetProfileView" {
            let cell = sender as! twittterCell
            let detailedTweet = cell.tweet
            let destinationViewController = segue.destinationViewController as! tweetProfileViewController
            destinationViewController.tweet = detailedTweet
    }
}
}