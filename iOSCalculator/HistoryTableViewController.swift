//
//  HistoryTableViewController.swift
//  iOSCalculator
//
//  Created by Trevor Allen on 4/29/16.
//  Copyright © 2016 Trevor Allen. All rights reserved.
//

import UIKit

class HistoryTableViewController: UITableViewController {

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Calculator.Instance.history.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCellWithIdentifier("histCell", forIndexPath: indexPath)
        cell.textLabel?.text = Calculator.Instance.history[indexPath.row]
        return cell
    }
    
    
}
