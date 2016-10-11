//
//  ViewController.swift
//  buzzed — bac calculator
//
//  Created by Mae Patton on 10/8/16.
//  Copyright © 2016 Mae Patton. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    //alcohol labels and steppers
    @IBOutlet weak var wineLabel: UILabel!
    @IBOutlet weak var wineStepper: UIStepper!
    @IBOutlet weak var beerLabel: UILabel!
    @IBOutlet weak var beerStepper: UIStepper!
    @IBOutlet weak var liqLabel: UILabel!
    @IBOutlet weak var liqStepper: UIStepper!
    
    //gender control
    @IBOutlet weak var genderControl: UISegmentedControl!
    
    //weight slider and label
    @IBOutlet weak var weightSlider: UISlider!
    @IBOutlet weak var weightLabel: UILabel!
    
    //hour text fields
    @IBOutlet weak var spentLabel: UITextField!
    @IBOutlet weak var sinceLabel: UITextField!
    
    //label that gets final bac
    @IBOutlet weak var tempOutputLabel: UILabel!
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    /* ***** SLIDER FUNCTION TO GET USER WEIGHT ***** */
    @IBAction func changeWeightSlider(sender: UISlider) {
        let weightNum = Int(sender.value) //float
        weightLabel.text = String(weightNum)
        updateBAC()
    }
    /* ********************************************* */
    
    /* * STEPPER FUNCTIONS TO GET AMOUNT OF DRINKS * */
    @IBAction func wineValueChange(sender: UIStepper) {
        wineLabel.text = Int(sender.value).description
        updateBAC()
    }
    @IBAction func beerValueChange(sender: UIStepper) {
        beerLabel.text = Int(sender.value).description
        updateBAC()
    }
    @IBAction func liqValueChange(sender: UIStepper) {
        liqLabel.text = Int(sender.value).description
        updateBAC()
    }
    /* ********************************************* */
    
    /* *** FUNCTION TO GET HOURS SPENT DRINKING *** */
    func textFieldDidEndEditing(textField: UITextField){
        updateBAC()
    }
    /* ******************************************** */
    
    /* BUTTON TO GIVE USER STANDARD DRINK INFORMATION */
    //http://stackoverflow.com/questions/24022479/how-would-i-create-a-uialertview-in-swift
    @IBAction func drinkInfoButton(sender: UIButton) {
        let window = UIAlertController(title: "What Is One Drink?", message: "Based off of standard drink sizes: \n\nOne glass of wine is 5 fluid ounces at around 12% alcohol. \n\nOne beer is 12 fluid ounces at around 5% alcohol. \n\nOne shot of hard liquor (gin, rum, tequila, vodka, whiskey, etc.) is 1.5 fluid ounces at around 40% alcohol.", preferredStyle: UIAlertControllerStyle.Alert)
        
        window.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
        
        self.presentViewController(window, animated: true, completion: nil)
    }
    /* ********************************************* */
    
    /* ****** BAC CALCULATION USING USER INFO ****** */
    func updateBAC(){
        //GET USER R-VALUE BASED OFF WEIGHT AND GENDER
        var rVal:Float = 0.0
        let weight = Float(weightLabel.text!)
        let gweight = 453.592 * weight!
        if genderControl.selectedSegmentIndex == 0 {
            rVal = 0.55 * gweight
        }
        else if genderControl.selectedSegmentIndex == 1 {
            rVal = 0.68 * gweight
        }
        
        //GET AMOUNT OF ALCOHOL IN GRAMS
        let wineAmt = Int(wineLabel.text!)
        let beerAmt = Int(beerLabel.text!)
        let liqAmt = Int(liqLabel.text!)
        let amntAlc:Int = (wineAmt! + beerAmt! + liqAmt!) * 14 //this will give you amount of alcohol in grams counting number of standard size drinks
        
        //GET HOURS SPENT DRINKING AND HOURS SINCE DRINKING
        var spent:Float
        var since:Float
        if spentLabel.text!.isEmpty {
            spent = 0.0
        }else{
            spent = Float(spentLabel.text!)!
        }
        if sinceLabel.text!.isEmpty {
            since = 0.0
        }else{
            since = Float(sinceLabel.text!)!
        }
        
        //BAC CALCULATIONS
        let initBAC:Float = (Float(amntAlc) / rVal) * 100 //BAC without taking time into account
        let spentBAC: Float = initBAC - (spent * 0.015) //BAC with hours spent drinking
        var finalBAC: Float = spentBAC - (since * 0.015) //BAC with hourse spent and since drinking
        
        if finalBAC < 0 {
            finalBAC = 0.0
        }

        tempOutputLabel.text = String(finalBAC)
    }
    /* ******************************************** */
    
    @IBAction func unwindSegue(segue:UIStoryboardSegue){
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        spentLabel.delegate = self
        sinceLabel.delegate=self
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /* * FUNCTION TO TRANSFER FINAL BAC TO NEXT VIEW * */
    //http://stackoverflow.com/questions/29734954/how-do-you-share-data-between-view-controllers-and-other-objects-in-swift
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        if (segue.identifier == "updatebac") {
            var svc = segue!.destinationViewController as! SecondViewController
            
            svc.bacText = tempOutputLabel.text
            
        }
    }
    /* ******************************************** */
}

