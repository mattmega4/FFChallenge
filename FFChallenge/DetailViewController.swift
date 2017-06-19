//
//  DetailViewController.swift
//  FFChallenge
//
//  Created by Matthew Howes Singleton on 6/16/17.
//  Copyright © 2017 Matthew Howes Singleton. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var leftNavButton: UIBarButtonItem!
    
    @IBOutlet weak var venueImageView: UIImageView!
    
    @IBOutlet weak var venueDescriptionLabel: UILabel!
    
    @IBOutlet weak var venuePopularityLabel: UILabel!     // ?
    @IBOutlet weak var venueNewLabel: UILabel!            // ?
    
    @IBOutlet weak var ratingStack: UIStackView!
    @IBOutlet weak var r1ImgVw: UIImageView!
    @IBOutlet weak var r2ImgVw: UIImageView!
    @IBOutlet weak var r3ImgVw: UIImageView!
    @IBOutlet weak var r4ImgVw: UIImageView!
    @IBOutlet weak var r5ImgVw: UIImageView!
    
    @IBOutlet weak var priceStack: UIStackView!
    @IBOutlet weak var p1ImgVw: UIImageView!
    @IBOutlet weak var p2ImgVw: UIImageView!
    @IBOutlet weak var p3ImgVw: UIImageView!
    @IBOutlet weak var p4ImgVw: UIImageView!
    @IBOutlet weak var p5ImgVw: UIImageView!
    
    @IBOutlet weak var venueHoursLabel: UILabel!
    
    @IBOutlet weak var venueOpenLabel: UILabel!
    
    
    @IBOutlet weak var venueReviewLabel: UILabel!
    @IBOutlet weak var fakeReviewTextView: UITextView!
    
    var venue: Venue?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setNavBar()
        getVenueData()
        blurTextView()
        
    }
    
    
    // MARK: - Get Venue Data
    
    func getVenueData() {
        
        if let titleName = venue?.name {
            title = titleName
        }
        
        NetworkUtility.shared.getImageForVenue(venue: venue!) { (image) in
            self.venueImageView.image = image
        }
        
        if let desc = venue?.venueDescription {
            venueDescriptionLabel.text = desc
        }
        
        if let ratNum = venue?.rating {
            if ratNum == 0 {
                r1ImgVw.image = nil
                r2ImgVw.image = nil
                r3ImgVw.image = nil
                r4ImgVw.image = nil
                r5ImgVw.image = nil
            } else if ratNum == 1 {
                r1ImgVw.image = UIImage.init(named: "thumb.png")
                r2ImgVw.image = nil
                r3ImgVw.image = nil
                r4ImgVw.image = nil
                r5ImgVw.image = nil
            } else if ratNum == 2 {
                r1ImgVw.image = UIImage.init(named: "thumb.png")
                r2ImgVw.image = UIImage.init(named: "thumb.png")
                r3ImgVw.image = nil
                r4ImgVw.image = nil
                r5ImgVw.image = nil
            } else if ratNum == 3 {
                r1ImgVw.image = UIImage.init(named: "thumb.png")
                r2ImgVw.image = UIImage.init(named: "thumb.png")
                r3ImgVw.image = UIImage.init(named: "thumb.png")
                r4ImgVw.image = nil
                r5ImgVw.image = nil
            } else if ratNum == 4 {
                r1ImgVw.image = UIImage.init(named: "thumb.png")
                r2ImgVw.image = UIImage.init(named: "thumb.png")
                r3ImgVw.image = UIImage.init(named: "thumb.png")
                r4ImgVw.image = UIImage.init(named: "thumb.png")
                r5ImgVw.image = nil
            } else if ratNum == 5 {
                r1ImgVw.image = UIImage.init(named: "thumb.png")
                r2ImgVw.image = UIImage.init(named: "thumb.png")
                r3ImgVw.image = UIImage.init(named: "thumb.png")
                r4ImgVw.image = UIImage.init(named: "thumb.png")
                r5ImgVw.image = UIImage.init(named: "thumb.png")
            }
        }
        
        if let pricNum = venue?.price {
            if pricNum == 0 {
                p1ImgVw.image = nil
                p2ImgVw.image = nil
                p3ImgVw.image = nil
                p4ImgVw.image = nil
                p5ImgVw.image = nil
            } else if pricNum == 1 {
                p1ImgVw.image = UIImage.init(named: "money.png")
                p2ImgVw.image = nil
                p3ImgVw.image = nil
                p4ImgVw.image = nil
                p5ImgVw.image = nil
            } else if pricNum == 2 {
                p1ImgVw.image = UIImage.init(named: "money.png")
                p2ImgVw.image = UIImage.init(named: "money.png")
                p3ImgVw.image = nil
                p4ImgVw.image = nil
                p5ImgVw.image = nil
            } else if pricNum == 3 {
                p1ImgVw.image = UIImage.init(named: "money.png")
                p2ImgVw.image = UIImage.init(named: "money.png")
                p3ImgVw.image = UIImage.init(named: "money.png")
                p4ImgVw.image = nil
                p5ImgVw.image = nil
            } else if pricNum == 4 {
                p1ImgVw.image = UIImage.init(named: "money.png")
                p2ImgVw.image = UIImage.init(named: "money.png")
                p3ImgVw.image = UIImage.init(named: "money.png")
                p4ImgVw.image = UIImage.init(named: "money.png")
                p5ImgVw.image = nil
            } else if pricNum == 5 {
                p1ImgVw.image = UIImage.init(named: "money.png")
                p2ImgVw.image = UIImage.init(named: "money.png")
                p3ImgVw.image = UIImage.init(named: "money.png")
                p4ImgVw.image = UIImage.init(named: "money.png")
                p5ImgVw.image = UIImage.init(named: "money.png")
            }
        }
        
        
        venueHoursLabel.text = venue?.hours
        
        if let opn = venue?.isOpen {
            if opn == true {
                venueOpenLabel.text = "Open Now!"
            } else {
                venueOpenLabel.text = "Closed!"
            }
        }
        
        if let rt = venue?.reviews {
            venueReviewLabel.text = "\(String(rt)) Reviews"
        }
    }
    
    
    // MARK: - Blur Fake Review
    
    func blurTextView() {
        let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.light)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        blurEffectView.alpha = 0.93
        fakeReviewTextView.addSubview(blurEffectView)
    }
    
    // MARK: - IBActions
    
    @IBAction func leftNavButtonTapped(_ sender: UIBarButtonItem) {
        navigationController?.popViewController(animated: true)
    }
    
    
}
