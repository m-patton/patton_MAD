//
//  ViewController.swift
//  labfour
//
//  Created by Mae Patton on 10/1/16.
//  Copyright © 2016 Mae Patton. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    var user = information()

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    
    
    @IBAction func unwindSegue(segue:UIStoryboardSegue){
        //nameLabel.text=user.name
        if user.name != nil {
            nameLabel.text="Welcome, \(user.name!)"
        }
        if user.username != nil {
            usernameLabel.text="Your username: \(user.username!)"
        }
        if user.email != nil {
            emailLabel.text="Your email: \(user.email!)"
        }
        
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

