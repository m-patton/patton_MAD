//
//  Bcalc.swift
//  bac_final
//
//  Created by Mae Patton on 12/11/16.
//  Copyright © 2016 Mae Patton. All rights reserved.
//

import Foundation
import UIKit

class Bcalc : UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    @IBOutlet weak var Open1: UIBarButtonItem!
    
    @IBOutlet var genderTest: UILabel!
    @IBOutlet var weightTest: UILabel!
    @IBOutlet weak var userNameLabel: UILabel!
    
    //PICKERS FOR DRINKS
    @IBOutlet var winePicker: UIPickerView!
    @IBOutlet var beerPicker: UIPickerView!
    @IBOutlet var liqPicker: UIPickerView!
    
    //STEPPERS FOR HOURS
    @IBOutlet weak var spentStepper: UIStepper!
    @IBOutlet weak var sinceStepper: UIStepper!
    @IBOutlet weak var spentLabel: UILabel!
    @IBOutlet weak var sinceLabel: UILabel!
    
    
    //ARRAYS FOR PICKERS
    let liqArray = Array(0...30)
    let beerArray = Array(0...30)
    let wineArray = Array(0...30)
    
    
    @IBOutlet weak var tempOutputLabel: UILabel!
    
    @IBOutlet weak var Open: UIBarButtonItem!
    
    
    var gender = String()
    var weight = String()
    var name = String()
    
    @IBOutlet weak var myLabel: UILabel!
    
    override func viewDidLoad() {
        
        Open.target = self.revealViewController()
        Open.action = #selector(SWRevealViewController.revealToggle(_:))
        Open1.target = self.revealViewController()
        Open1.action = #selector(SWRevealViewController.revealToggle(_:))

        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        
        winePicker.dataSource = self
        winePicker.delegate = self
        beerPicker.dataSource = self
        beerPicker.delegate = self
        liqPicker.dataSource = self
        liqPicker.delegate = self
        
        
        
        //THIS PASSES THE DATA FROM INFO!
        let nameKey = NSUserDefaults.standardUserDefaults()
        let weightKey = NSUserDefaults.standardUserDefaults()
        let genderKey = NSUserDefaults.standardUserDefaults()
        //MUST CHECK TO MAKE SURE VALUES ARE NOT NULL!
        if (NSUserDefaults.standardUserDefaults().objectForKey("savedName") != nil) {
            name = nameKey.stringForKey("savedName")!
            userNameLabel.text = nameKey.stringForKey("savedName")!
        }
        else{
            name = "Name"
        }
        if (NSUserDefaults.standardUserDefaults().objectForKey("savedWeight") != nil) {
            weight = weightKey.stringForKey("savedWeight")!
            weightTest.text = weightKey.stringForKey("savedWeight")!
        }
        else{
            weight = "50"
        }
        if (NSUserDefaults.standardUserDefaults().objectForKey("savedGender") != nil) {
            gender = genderKey.stringForKey("savedGender")!
            genderTest.text = genderKey.stringForKey("savedGender")! + ", "
                + weightKey.stringForKey("savedWeight")! + "lbs"
        
        }else{
            gender = "Female"
        }
    
        calcBAC()
        
        
    }
    
    //winePicker.addTarget(self, action: #selector(Bcalc.calcBAC), forControlEvents: UIControlEvents.ValueChanged)
    
    //[winePicker.addTarget:self action:@selector(calcBAC) forControlEvents:UIControlEventValueChanged];
    
    @IBAction func spentValueChange(sender: UIStepper) {
        spentLabel.text = Int(sender.value).description
        calcBAC()
    }
    @IBAction func sinceLabelChange(sender: UIStepper) {
        sinceLabel.text = Int(sender.value).description
        calcBAC()
    }
    
    //function to get hours
    /*@IBAction func sinceValueChange(sender: UIStepper) {
        since.text = Int(sender.value).description
        calcBAC()
     }
     @IBAction func spentValueChange(sender: UIStepper) {
        spentLabel.text = Int(sender.value).description
        calcBAC()
     }*/
    
    func calcBAC(){
        //get weight in grams
        //let weight = Float(weightTest.text!)
        let nweight = Float(weight)
        let gweight = 453.592 * nweight!
        //get gender r value
        var rVal:Float = 0.0
        if gender == "Female" {
            rVal = 0.55 * gweight
        }
        else if gender == "Male" {
            rVal = 0.68 * gweight
        }
        //genderTest.text = String(rVal)
        
        let wineDrinks = winePicker.selectedRowInComponent(0)
        
        let beerDrinks = beerPicker.selectedRowInComponent(0)
        
        let liqDrinks = liqPicker.selectedRowInComponent(0)
        
        let amntAlc:Int = (wineDrinks + beerDrinks + liqDrinks) * 14 //this will give you amount of alcohol in grams counting number of standard size drinks

        let spent = Float(spentLabel.text!)
        let since = Float(sinceLabel.text!)
        
        //BAC CALCULATIONS
        let initBAC:Float = (Float(amntAlc) / rVal) * 100 //BAC without taking time into account
        let spentBAC: Float = initBAC - (spent! * 0.015) //BAC with hours spent drinking
        var finalBAC: Float = spentBAC - (since! * 0.015) //BAC with hourse spent and since drinking
        
        if finalBAC < 0 {
            finalBAC = 0.0
        }
        
        
        
        tempOutputLabel.text = String(finalBAC)

        
        //Alcohol in grams / rVal * 100
        
        // (Volume of drinks) x (AC of drinks) x 0.789 = grams of alcohol consumed
        
        //The standard drink size of an 80-proof version of a liqueur such as gin or whiskey is approximately 1.5 ounces.[2] This is about forty percent alcohol.
        //The standard drink size of a beer with a five percent volume of alcohol is twelve ounces.
        //The standard drink size of a wine with a twelve percent volume of alcohol is five ounces.
        //wine
        //5 x 29.5735 x 0.12 x .789 ≈ 14 grams of alcohol
        //Beer:
        //12 x 29.5735 x 0.05 x .789 ≈ 14 grams of alcohol
        //Liquor:
        //If 80 proof is defined as 40% alcohol by volume:
        //1.5 x 29.5735 x 0.40 x .789 ≈ 14 grams of alcohol
        
        
    }
    
    
    /*
     @IBAction func scanButton (sender: UIButton!) {
     
     performSegueWithIdentifier("nextView", sender: self)
     
     }
     
     */
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int{
        //return drinkArray.count
        return 1
        
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
        if pickerView == winePicker {
            return wineArray.count
        } else if pickerView == beerPicker {
            return beerArray.count
        }else if pickerView == liqPicker {
            return liqArray.count
        }
        return 1
        
    }
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        calcBAC() //THIS WILL UPDATE BAC WHEN PICKER VALUES CHANGE YAY
    }
    
    func pickerView(pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        var attributedString: NSAttributedString!
        
        switch component {
        case 0:
            attributedString = NSAttributedString(string: "\(wineArray[row])", attributes: [NSForegroundColorAttributeName : UIColor.whiteColor(), NSFontAttributeName:UIFont(name: "Avenir", size: 14.0)!])
        case 1:
            attributedString = NSAttributedString(string: "\(beerArray[row])", attributes: [NSForegroundColorAttributeName : UIColor.whiteColor(), NSFontAttributeName:UIFont(name: "Avenir", size: 14.0)!])
        case 2:
            attributedString = NSAttributedString(string: "\(liqArray[row])", attributes: [NSForegroundColorAttributeName : UIColor.whiteColor(), NSFontAttributeName:UIFont(name: "Avenir", size: 14.0)!])
        default:
            attributedString = nil
        }
        
        return attributedString
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == winePicker {
            return "\(wineArray[row])"
        } else if pickerView == beerPicker {
            return "\(beerArray[row])"
        }else if pickerView == liqPicker {
            return "\(liqArray[row])"
        }
        return ""
    }
    
    @IBAction func unwindSegue(segue:UIStoryboardSegue){
        
    }
   
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        //destViewController.LabelText = baclabel.text
        
        if (segue.identifier == "updatebac") {
            var dvc : BacView = segue.destinationViewController as! BacView
            //var svc = segue!.destinationViewController as! BACView
            
            dvc.bacText = tempOutputLabel.text
            
        }
    }
    
    


    
    
  
}

//var user = Info(name: "Name", gender: "Female", weight: 150, state: "Colorado" )