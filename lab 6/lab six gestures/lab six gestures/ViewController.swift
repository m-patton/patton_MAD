//
//  ViewController.swift
//  lab six gestures
//
//  Created by Mae Patton on 10/17/16.
//  Copyright © 2016 Mae Patton. All rights reserved.
//
//Create an app with an image that responds to the following gestures: pan, pinch, rotate, and long press.

import UIKit
import AVFoundation

class ViewController: UIViewController, UIGestureRecognizerDelegate {
    
    var audioPlayer : AVAudioPlayer?

    
    //function to have multiple gestures
    func gestureRecognizer(gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWithGestureRecognizer otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }

   
    //PAN
    @IBAction func handlePan(sender: UIPanGestureRecognizer) {
        
        //can move image around screen
        let translation = sender.translationInView(view)
        sender.view!.center = CGPoint(x: sender.view!.center.x + translation.x, y: sender.view!.center.y + translation.y)
        sender.setTranslation(CGPointZero, inView: view)
        
        //decelerates as slows down
        if sender.state == UIGestureRecognizerState.Ended {
            let velocity = sender.velocityInView(self.view)
            let magnitude = sqrt((velocity.x * velocity.x) + (velocity.y * velocity.y))
            let slideMultiplier = magnitude / 200
            let slideFactor = 0.1 * slideMultiplier
            var finalPoint = CGPoint(x:sender.view!.center.x + (velocity.x * slideFactor), y:sender.view!.center.y + (velocity.y * slideFactor))
            finalPoint.x = min(max(finalPoint.x, 0), self.view.bounds.size.width)
            finalPoint.y = min(max(finalPoint.y, 0), self.view.bounds.size.height)
            UIView.animateWithDuration(Double(slideFactor * 2), delay: 0, options: UIViewAnimationOptions.CurveEaseOut, animations: {sender.view!.center = finalPoint }, completion: nil)
        }
    }
    ///////
    
    //PINCH
    @IBAction func handlePinch(sender: UIPinchGestureRecognizer) {
        sender.view!.transform = CGAffineTransformScale(sender.view!.transform, sender.scale, sender.scale)
        sender.scale=1
    }
    ///////
    
    //ROTATION
    @IBAction func handleRotation(sender: UIRotationGestureRecognizer) {
        sender.view!.transform = CGAffineTransformRotate(sender.view!.transform, sender.rotation)
        sender.rotation=0
    }
    ///////
    
    //LONG PRESS
    @IBAction func longPress(sender: UILongPressGestureRecognizer) {
        let audioFilePath = NSBundle.mainBundle().pathForResource("sunny", ofType: "mp3")
        let fileURL = NSURL(fileURLWithPath: audioFilePath!)
        audioPlayer = try? AVAudioPlayer(contentsOfURL: fileURL)
        if audioPlayer != nil{
            audioPlayer!.play()
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

