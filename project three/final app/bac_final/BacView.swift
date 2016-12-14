//
//  BacView.swift
//  bac_final
//
//  Created by Mae Patton on 12/11/16.
//  Copyright © 2016 Mae Patton. All rights reserved.
//

import Foundation
import UIKit

class BacView: UIViewController {
    
    @IBOutlet weak var bacLabel: UILabel!
    @IBOutlet weak var soberLabel: UILabel!
    @IBOutlet weak var limitLabel: UILabel!
    
    var bacText:String! //gets bac information from bCalc
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bacLabel.text = bacText
        updateInfo() //run this function upon loading the view
        // Do any additional setup after loading the view.
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    }
    
    func updateInfo() {
     
        var baccount = Float(bacText)
        bacLabel.text = String(format:"%.3f", baccount!)
        
        //CALCULATE HOURS UNTIL BAC = 0
        var min:Float = 0.0
        var minutes: Int = 0
        var hourCount = 0
        while baccount > 0 { //if the person has a bac over 0
            baccount = baccount! - 0.015
            hourCount += 1
        }
        if baccount < 0 { //calculate minutes
            hourCount -= 1
            baccount = baccount!/0.015
            min = baccount!*60.0*(-1.0)
            minutes = Int(min)
        }
        soberLabel.text = "\(hourCount) hrs and \(minutes) min"
        
        //CALCULATE HOURS UNTIL BELOW 0.08
        min = 0.0
        minutes = 0
        hourCount = 0
        baccount = Float(bacText)
        var newHour = 0
        var seccount:Float = 0.0
        while baccount > 0.08 { //if the person has a bac over 0.08
            baccount = baccount! - 0.015
            hourCount += 1
            if baccount < 0.08 { //calculate minutes
                newHour = hourCount - 1
                seccount = 0.08 - baccount!
                seccount = seccount / 0.015
                min = seccount*60.0
                minutes = Int(min)
            }else{
                minutes = 0
            }
        }//end while
        limitLabel.text = "\(newHour) hrs and \(minutes) min"
     
     }//end updateInfo
    
     
     override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
     }
    
}
