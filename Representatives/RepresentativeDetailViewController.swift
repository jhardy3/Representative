//
//  RepresentativeDetailViewController.swift
//  Representatives
//
//  Created by Jake Hardy on 2/18/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class RepresentativeDetailViewController: UIViewController {

    // MARK: - Outlets
    
    var representative: Representative?
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var stateLabel: UILabel!
    @IBOutlet weak var districtLabel: UILabel!
    @IBOutlet weak var independentLabel: UILabel!
    @IBOutlet weak var representativeLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var webLabel: UILabel!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let representative = representative {
            updateWith(representative)
        }

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func updateWith(representative: Representative) {
        self.nameLabel.text = representative.name
        self.stateLabel.text = representative.state
        self.districtLabel.text = representative.district
        self.independentLabel.text = representative.party
        self.phoneLabel.text = representative.phone
        self.webLabel.text = representative.link
    }

}
