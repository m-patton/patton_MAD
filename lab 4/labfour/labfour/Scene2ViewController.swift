//
//  Scene2ViewController.swift
//  labfour
//
//  Created by Mae Patton on 10/1/16.
//  Copyright © 2016 Mae Patton. All rights reserved.
//

import UIKit

class Scene2ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var userUserName: UITextField!
    @IBOutlet weak var userEmail: UITextField!
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "doneinfo"{
            let scene1ViewController = segue.destinationViewController as! ViewController
            if userName.text!.isEmpty == false {
                scene1ViewController.user.name=userName.text
            }
            if userUserName.text!.isEmpty == false{
                scene1ViewController.user.username=userUserName.text
            }
            if userEmail.text!.isEmpty == false{
                scene1ViewController.user.email=userEmail.text
            }
        }
    }


    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func viewDidLoad() {
        
        userName.delegate=self
        userUserName.delegate=self
        userEmail.delegate=self
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
