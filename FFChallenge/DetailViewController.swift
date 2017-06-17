//
//  DetailViewController.swift
//  FFChallenge
//
//  Created by Matthew Howes Singleton on 6/16/17.
//  Copyright © 2017 Matthew Howes Singleton. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var tempImgVw: UIImageView!
    @IBOutlet weak var tempPop: UILabel!
    @IBOutlet weak var tempNew: UILabel!
    @IBOutlet weak var tempRat: UILabel!
    @IBOutlet weak var tempRev: UILabel!
    @IBOutlet weak var tempPr: UILabel!
    @IBOutlet weak var tempDes: UILabel!
    
    var venue: Venue?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        tempDes.text = venue?.venueDescription
        
    }



}
