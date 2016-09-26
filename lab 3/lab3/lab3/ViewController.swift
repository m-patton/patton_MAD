//
//  ViewController.swift
//  lab3
//
//  Created by Mae Patton on 9/24/16.
//  Copyright © 2016 Mae Patton. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var priceInit: UITextField!
    @IBOutlet weak var percentOff: UITextField!
    @IBOutlet weak var amountOff: UILabel!
    @IBOutlet weak var priceFinal: UILabel!
    @IBOutlet weak var newPrice: UILabel!
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func updatePrice() {
        var amount:Float
        var percent:Float
        
        if priceInit.text!.isEmpty {
            amount = 0.0
        }else{
            amount = Float(priceInit.text!)!
        }
        if percentOff.text!.isEmpty {
            percent = 0.0
        }else{
            percent = Float(percentOff.text!)!/100
        }
        
        let tax: Float = 0.029
        let percentage = Int(percentOff.text!)
        let pOff = amount*percent
        let total = amount-pOff //this is like initial price minus price off
        var taxTotal : Float = 0.0
        if percentage != nil {
            if percentage! < 100 {
                taxTotal = (total * tax) + total
            }else{
                //create a UIAlertController object
                let alert=UIAlertController(title: "Warning", message: "The percentage must be less that 100", preferredStyle: UIAlertControllerStyle.Alert)
                //create a UIAlertAction object for the button
                let cancelAction=UIAlertAction(title: "Cancel", style:UIAlertActionStyle.Cancel, handler: nil)
                alert.addAction(cancelAction) //adds the alert action to the alert object
                let okAction=UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: {action in
                    self.percentOff.text="0"
                    self.updatePrice()
                })
                alert.addAction(okAction)
                presentViewController(alert, animated: true, completion: nil)
            } //end else
        }//end if percentage
        
        let currencyFormatter = NSNumberFormatter()
        currencyFormatter.numberStyle=NSNumberFormatterStyle.CurrencyStyle //set the number style
        amountOff.text=currencyFormatter.stringFromNumber(pOff) //returns a formatted string
        //totalDue.text=currencyFormatter.stringFromNumber(total)
        priceFinal.text=currencyFormatter.stringFromNumber(taxTotal)
        newPrice.text=currencyFormatter.stringFromNumber(total)
        
    }
    
    func textFieldDidEndEditing(textField: UITextField){
        updatePrice()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        priceInit.delegate = self
        percentOff.delegate=self
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func onTapGestureRecognized(sender: AnyObject) {
        priceInit.resignFirstResponder()
        percentOff.resignFirstResponder()
    }
}

