//
//  ViewController.swift
//  lotuslab
//
//  Created by Mae Patton on 9/19/16.
//  Copyright © 2016 Mae Patton. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var lotusLabel: UILabel!
    @IBOutlet weak var lotusImage: UIImageView!
    @IBOutlet weak var ImageControl: UISegmentedControl!
    @IBOutlet weak var capitalSwitch: UISwitch!
    @IBOutlet weak var fontSizeLabel: UILabel!

    func updateImage(){
        //want to change image and label based on which segment is currently tapped
        if ImageControl.selectedSegmentIndex == 0 {
            lotusLabel.text="lotus picture"
            lotusImage.image=UIImage(named: "pink")
            lotusLabel.textColor = UIColor.greenColor()
        }
        else if ImageControl.selectedSegmentIndex == 1 {
            lotusLabel.text="lotus painting"
            lotusImage.image=UIImage(named: "painting")
            lotusLabel.textColor = UIColor.yellowColor()
        }
        
    }
    
    
    func updateCaps(){
        if capitalSwitch.on{
            lotusLabel.text=lotusLabel.text?.uppercaseString
        }
        else{
            lotusLabel.text=lotusLabel.text?.lowercaseString
        }
    }

    
    @IBAction func changeStuff(sender: UISegmentedControl) {
        updateImage()
        updateCaps()
    }
    
    @IBAction func updateFont(sender: UISwitch) {
        updateCaps()
    }
    
    @IBAction func changeFontSize(sender: UISlider) {
        let fontSize = sender.value //float
        fontSizeLabel.text = String(format: "%.0f", fontSize) //convert float to string
        let fontSizeCGFloat=CGFloat(fontSize) //convert float to CGFloat
        lotusLabel.font=UIFont.systemFontOfSize(fontSizeCGFloat) //create a UIFont object and assign to the font property
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

