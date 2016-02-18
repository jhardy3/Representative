//
//  SearchViewController.swift
//  Representatives
//
//  Created by Taylor Mott on 10/28/15.
//  Copyright © 2015 DevMountain. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
    
    // MARK: - Outlet Properties
    
    @IBOutlet weak var statePickerView: UIPickerView!
    
    
    //MARK: - Properties
    let states = ["AK", "AL", "AZ", "AR", "CA", "CO", "CT", "DE", "FL", "GA", "HI", "ID", "IL", "IN", "IA", "KS", "KY", "LA", "ME", "MD", "MA", "MI", "MN", "MS", "MO", "MT", "NE", "NV", "NH", "NJ", "NM", "NY", "NC", "ND", "OH", "OK", "OR", "PA", "RI", "SC", "SD", "TN", "TX", "UT", "VT", "VA", "WA", "WV", "WI", "WY"]
    
    var representatives = [Representative]()
    
    // MARK: - Button Actions
    
    @IBAction func FindButtonTapped(sender: UIButton) {
        let index = statePickerView.selectedRowInComponent(0)
        RepresentativeController.getRepresentativesFor(state: states[index]) { (representativeArray) -> Void in
            self.representatives = representativeArray
        }
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let index = statePickerView.selectedRowInComponent(0)
        RepresentativeController.getRepresentativesFor(state: states[index]) { (representativeArray) -> Void in
            self.representatives = representativeArray
            if segue.identifier == "toRepresentatives" {
                let repView = segue.destinationViewController as! RepresentativeTableViewController
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    repView.tableView.reloadData()
                })
                repView.representatives = self.representatives
            }
        }
        
    }
    
}



// PICKER VIEW EXTENTION { METHODS }
extension SearchViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return states[row]
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return states.count
    }
    
    
    
}