//
//  Venue.swift
//  FFChallenge
//
//  Created by Matthew Howes Singleton on 6/16/17.
//  Copyright © 2017 Matthew Howes Singleton. All rights reserved.
//

import UIKit

class Venue: NSObject {
    
    var id: String?
    var hours: String?
    var imageURL: URL?
    var venueDescription: String?
    var name: String?
    var isPopular = false
    var isNew = false
    var rating: Int = 0
    var reviews: Int = 0
    var isOpen = false
    var price: Int = 0
    
    
    init(object: [String : Any]) {
        
        
        id = object["id"] as? String
        
        hours = object["hours"] as? String
        
        let date = Date()
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: date)
        let minutes = calendar.component(.minute, from: date)
        if let theHours = hours {
            let tmp = theHours.characters.split(separator: " ").map(String.init)
            if tmp.count == 6 {
                let openTimeString = tmp[1]
                let closeTimeString = tmp[4]
                let openTimeAbv = tmp[2]
                let closeTimeAbv = tmp[5]
                
                let openTimeArray = openTimeString.characters.split(separator: ":").map(String.init)
                let closeTimeArray = closeTimeString.characters.split(separator: ":").map(String.init)
                if openTimeArray.count == 2 && closeTimeArray.count == 2 {
                    if var openHour = Int(openTimeArray[0]), var closeHour = Int(closeTimeArray[0]), let openMinute = Int(openTimeArray[1]), let closeMinute = Int(closeTimeArray[1]) {
                        if openTimeAbv == "p.m." && openHour < 12 {
                            openHour += 12
                        }
                        if closeTimeAbv == "p.m." && closeHour < 12 {
                            closeHour += 12
                        }
                        if hour > openHour && hour < closeHour {
                            isOpen = true
                        }
                        else if hour == openHour {
                            if minutes >= openMinute {
                                isOpen = true
                            }
                        }
                        else if hour == closeHour {
                            if minutes < closeMinute {
                                isOpen = true
                            }
                        }
                    }
                }
            }
        }
        
        if let imageURLString = object["url"] as? String {
            imageURL = URL(string: imageURLString)
        }
        
        venueDescription = object["description"] as? String
        
        name = object["title"] as? String
        
        if let popular = object["popular"] as? Bool {
            isPopular = popular
        }
        
        if let new = object["new"] as? Bool {
            isNew = new
        }
        
        if let theRating = object["rating"] as? Int {
            rating = theRating
        }
        
        if let nReviews = object["n_reviews"] as? Int {
            reviews = nReviews
        }
        
        if let thePrice = object["price_range"] as? Int {
            price = thePrice
        }
        
    }
}
