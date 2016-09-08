//
//  ViewController.swift
//  lab1_books
//
//  Created by Mae Patton on 9/5/16.
//  Copyright © 2016 Mae Patton. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var booksLabel: UILabel!
    
    @IBAction func choseComic(sender: UIButton) {
        if sender.currentTitle=="comic"{
            bookImage.image=UIImage(named: "comic.png")
            booksLabel.text="comic book"
        }
        else if sender.currentTitle=="poetry"{
            bookImage.image=UIImage(named: "poem.png")
            booksLabel.text="poetry book"
        }
    }
    
    @IBOutlet weak var bookImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

