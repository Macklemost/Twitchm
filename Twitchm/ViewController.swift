//
//  ViewController.swift
//  Twitchm
//
//  Created by Cole McLemore on 2/14/16.
//  Copyright © 2016 Cole McLemore. All rights reserved.
//

import UIKit
import BDBOAuth1Manager

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onLogin(sender: AnyObject) {
        TwitterClient.sharedInstance.loginWithCompletion() {
            (user: User?, errir: NSError?) in
            if user != nil {
                // perform seque
                self.performSegueWithIdentifier("loginSegue", sender: self)
            } else {
                // handle login error
            }
}
    }}
