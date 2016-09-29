//
//  ViewController.swift
//  bacCalc
//
//  Created by Mae Patton on 9/29/16.
//  Copyright © 2016 Mae Patton. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var genderSeg: UISegmentedControl!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    
    @IBAction func calculateResult(sender: UIButton) {
        resultLabel.text="this is your result!"
    }
    
    
    //this function will add a popup 
    //not quite what im looking for but works for now
    @IBAction func bacInfoButton(sender: UIButton) {
        let window = UIAlertController(title: "About BAC", message: "This is some information about blood alcohol concentration. \n When some Guiness wakes up, the Sam Adams goes to sleep. Most people believe that a polar bear beer inside a burglar ale is a big fan of the pompous Keystone, but they need to remember how secretly the lager about the bar stool goes to sleep. Indeed, a porter beyond a Jamaica Red Ale knowingly takes a peek at some shabby tornado brew. A tooled miller light secretly admires a hypnotic Hazed and Infused, and another carelessly whacked razor blade beer ridiculously figures out a razor blade beer.", preferredStyle: UIAlertControllerStyle.Alert)
        
            window.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
        
            self.presentViewController(window, animated: true, completion: nil)

    }
    
    
    @IBAction func changeWeight(sender: UISlider) {
        let weight = sender.value
        weightLabel.text = String(format: "%.0f", weight)


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

