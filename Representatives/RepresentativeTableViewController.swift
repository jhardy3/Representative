//
//  RepresentativeTableViewController.swift
//  Representatives
//
//  Created by Jake Hardy on 2/18/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class RepresentativeTableViewController: UITableViewController {
    
    var representatives = [Representative]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return representatives.count
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("representativeCell", forIndexPath: indexPath)
        let representative = representatives[indexPath.row]
        cell.textLabel?.text = representative.name
        
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "toRepresentative" {
            let repDetailView = segue.destinationViewController as! RepresentativeDetailViewController
            if let index = tableView.indexPathForSelectedRow?.row {
                repDetailView.representative = representatives[index]
            }
        }
    }
    
    
}
