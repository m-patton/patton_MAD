//
//  ViewController.swift
//  midterm
//
//  Created by Mae Patton on 10/13/16.
//  Copyright © 2016 Mae Patton. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var workoutTime: UITextField!
    @IBOutlet weak var calcButton: UIButton!
    @IBOutlet weak var milesLabel: UILabel!
    @IBOutlet weak var caloriesLabel: UILabel!
    @IBOutlet weak var weeklySwitch: UISwitch!
    @IBOutlet weak var sliderLabel: UILabel!
    @IBOutlet weak var workoutControl: UISegmentedControl!
    
    @IBOutlet weak var workoutPic: UIImageView!
    
    @IBAction func unwindSegue(segue:UIStoryboardSegue){
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func calcWorkout() {
        var minutes:Float
        if workoutTime.text!.isEmpty{
            minutes = 0.0
        }else{
            minutes = Float(workoutTime.text!)!
            if minutes < 30 {
                let alert=UIAlertController(title: "Warning", message: "You must workout for longer than 30 minutes", preferredStyle: UIAlertControllerStyle.Alert)
                let cancelAction=UIAlertAction(title: "Cancel", style:UIAlertActionStyle.Cancel, handler: nil)
                alert.addAction(cancelAction) //adds the alert action to the alert object
                let okAction=UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: {action in
                    self.workoutTime.text=""
                    self.calcWorkout()
                })
                alert.addAction(okAction)
                presentViewController(alert, animated: true, completion: nil)
            }
        }
        let hours:Float = minutes / 60
        var miles:Float = 0.0
        var calories:Float = 0.0
        if workoutControl.selectedSegmentIndex == 0 { //RUNNING
            miles = minutes / 10
            calories = hours * 600
        }
        else if workoutControl.selectedSegmentIndex == 1 {
            miles = minutes / 30
            calories = hours * 420

        }
        else if workoutControl.selectedSegmentIndex == 2 {
            miles = minutes / 4
            calories = hours * 510
            
        }
        if weeklySwitch.on{
            if sliderLabel.text != "num" {
                milesLabel.text = String(miles * Float(sliderLabel.text!)!)
                caloriesLabel.text = String(calories * Float(sliderLabel.text!)!)
            }
            else{
            milesLabel.text = String(miles * 5)
            caloriesLabel.text = String(calories * 5)
            }
        }
        else{
            milesLabel.text = String(miles)
            caloriesLabel.text = String(calories)
            
        }
        
        
    }
    
    
    @IBAction func updateSlider(sender: UISlider) {
        let weekNum = Int(sender.value) //float
        sliderLabel.text = String(weekNum)
        
    }
    
    
    @IBAction func changeWorkout(sender: UISegmentedControl) {
        if workoutControl.selectedSegmentIndex == 0 {
            //run
            workoutPic.image=UIImage(named: "run")
        }
        else if workoutControl.selectedSegmentIndex == 1{
            //bike
            workoutPic.image=UIImage(named: "swim")
        }
        else if workoutControl.selectedSegmentIndex == 2 {
            //swim
            workoutPic.image=UIImage(named: "bike")
            
        }
    }

 
    @IBAction func calcWorkoutBut(sender: UIButton) {
        calcWorkout()
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        workoutTime.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

//Segmented control to chose workout – run, bike, swim. Based on this control the
//total miles and calories burned should change.
//1. bike average speed is 4 mins/mi (15 mi/hr), calories burned 510/hr
//2. swim average speed is 30 mins/mi (2 mi/hr), calories burned 420/hr



