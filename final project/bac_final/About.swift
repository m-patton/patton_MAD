//
//  About.swift
//  bac_final
//
//  Created by Mae Patton on 12/10/16.
//  Copyright © 2016 Mae Patton. All rights reserved.
//

import Foundation
import UIKit

class About : UIViewController {
    
    @IBOutlet weak var Open: UIBarButtonItem!
    
    override func viewDidLoad() {
        Open.target = self.revealViewController()
        Open.action = #selector(SWRevealViewController.revealToggle(_:))
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
    }
}
