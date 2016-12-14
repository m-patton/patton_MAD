//
//  BackTableVC.swift
//  bac_final
//
//  Created by Mae Patton on 12/10/16.
//  Copyright © 2016 Mae Patton. All rights reserved.
//

import Foundation
import UIKit

class BackTableVC: UITableViewController{
    
    var TableArray = [String]()
    
    
    
    override func viewDidLoad() {
        TableArray = ["User Info","BAC","History","About"]
        
    }
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TableArray.count
    }
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier(TableArray[indexPath.row], forIndexPath: indexPath) as UITableViewCell
        
        
        cell.textLabel?.text = TableArray[indexPath.row] //this will make it so the cells in the table view take the titles from my array
        cell.textLabel?.textColor = UIColor.whiteColor()
        
        let fontSize = cell.textLabel?.font.pointSize
        cell.textLabel?.font = UIFont(name: "Avenir", size: fontSize!)
        
        return cell
    }
    
}