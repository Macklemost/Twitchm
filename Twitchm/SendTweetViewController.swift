//
//  SendTweetViewController.swift
//  Twitchm
//
//  Created by Cole McLemore on 2/28/16.
//  Copyright © 2016 Cole McLemore. All rights reserved.
//

import UIKit

class SendTweetViewController: UIViewController {
    @IBOutlet weak var tweetTextView: UITextView!
    @IBOutlet weak var sentLabel: UILabel!
    @IBOutlet weak var sendTweetButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        [tweetTextView.becomeFirstResponder()]
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func sendTweet(sender: AnyObject) {
        sendTweetButton.alpha = 0.1
        tweetTextView.alpha = 0.0
        sentLabel.alpha = 1
    }

}
