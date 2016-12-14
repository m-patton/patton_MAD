//
//  Information.swift
//  bac_final
//
//  Created by Mae Patton on 12/10/16.
//  Copyright © 2016 Mae Patton. All rights reserved.
//

import Foundation
import UIKit

class Information : UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {
    
    @IBOutlet var WeightPicker: UIPickerView!
    @IBOutlet var nameField: UITextField!
    @IBOutlet var selectGender: UISegmentedControl!
    
    @IBOutlet weak var Open: UIBarButtonItem!
    
    //LABELS THAT WILL DISPLAY THE USER'S SAVED INFORMATION
    @IBOutlet var userWeight: UILabel!
    @IBOutlet var userGender: UILabel!
    @IBOutlet var userName: UILabel!
    
    let usersSegGender = "userGender"
    
    func getSavedGender(){ //THIS FUNCTION WILL SAVE SEGMENTED CONTROL POSITION
        switch (NSUserDefaults.standardUserDefaults().integerForKey(usersSegGender))
        {
        case 0:
            selectGender.selectedSegmentIndex = 0
        case 1:
            selectGender.selectedSegmentIndex = 1
        default:
            break
        }
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    func textFieldDidEndEditing(textField: UITextField){
        if nameField.text!.isEmpty {
            userName.text = "Name"
        }else{
            userName.text = nameField.text
        }
    }
    
    
    
    var tempArray = ["1","2","3","4","5"]
    
    let weights = 50...500
    let wArray = Array(50...500)
    
    //this will help save the picker position
    var saveWeight: Int {
        return NSUserDefaults.standardUserDefaults().integerForKey("number")
    }
    
    override func viewDidLoad() {
        Open.target = self.revealViewController()
        Open.action = #selector(SWRevealViewController.revealToggle(_:))
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        
        WeightPicker.delegate = self
        WeightPicker.dataSource = self
        
        nameField.delegate = self
        
        let nameKey = NSUserDefaults.standardUserDefaults()
        userName.text = nameKey.stringForKey("savedName")
        nameField.text = nameKey.stringForKey("savedName")
        let weightKey = NSUserDefaults.standardUserDefaults()
        userWeight.text = weightKey.stringForKey("savedWeight")
        let genderKey = NSUserDefaults.standardUserDefaults()
        userGender.text = genderKey.stringForKey("savedGender")
        
        getSavedGender()
        
        if let row = wArray.indexOf(saveWeight) {
            WeightPicker.selectRow(row, inComponent: 0, animated: false)
        }
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {

        return "\(wArray[row])"
    }
    func pickerView(pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        let attributedString = NSAttributedString(string: "\(wArray[row])", attributes: [NSForegroundColorAttributeName : UIColor.whiteColor(), NSFontAttributeName: UIFont.init(name: "Avenir", size: 1.0)!])
            return attributedString
    }
    
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return wArray.count
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int{
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        NSUserDefaults.standardUserDefaults().setObject(wArray[row], forKey: "number")
    }
    
    
    @IBAction func saveInfo(sender: UIButton) {
        
        if selectGender.selectedSegmentIndex == 0 {
            userGender.text = "Female"
        }
        else if selectGender.selectedSegmentIndex == 1 {
            userGender.text = "Male"
        }

        let selectedRow = WeightPicker.selectedRowInComponent(0)
        userWeight.text = "\(wArray[selectedRow])"
        
        
        //CODE TO SAVE STUFF
        
        let myName = userName.text
        NSUserDefaults.standardUserDefaults().setObject(myName, forKey: "savedName")
        let myWeight = userWeight.text
        NSUserDefaults.standardUserDefaults().setInteger(wArray[selectedRow], forKey: "savedWeight")
        let myGender = userGender.text
        NSUserDefaults.standardUserDefaults().setObject(myGender, forKey: "savedGender")
         //NSUserDefaults.standardUserDefaults().setObject(myWeight, forKey: "savedWeight")
        
        NSUserDefaults.standardUserDefaults().setInteger(selectGender.selectedSegmentIndex, forKey: "userGender")
        
        //ALERT TO SAY SAVED
        var alert = UIAlertController(title:"Saved", message: "Information saved", preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "OK",style: .Cancel, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
      
    }
    
    
    
}
