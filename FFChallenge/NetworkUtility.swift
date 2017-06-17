//
//  NetworkUtility.swift
//  FFChallenge
//
//  Created by Matthew Howes Singleton on 6/16/17.
//  Copyright © 2017 Matthew Howes Singleton. All rights reserved.
//

import UIKit

class NetworkUtility: NSObject {
    
    static let shared = NetworkUtility()
    
    var imageCache = NSCache<AnyObject, UIImage>()
    
    func downloadVenues(completion: @escaping (_ venues: [Venue]?, _ error: Error?) -> Void) {
        if let url = URL(string: "https://fetchy-interview.herokuapp.com/api/placedata") {
            
            let session = URLSession.shared
            let dataTask = session.dataTask(with: url, completionHandler: { (data, response, error) in
                if let theData = data {
                    if let json = try? JSONSerialization.jsonObject(with: theData, options: []) {
                        if let objects = (json as? [String : Any])?["data"] as? [[String : Any]] {
                            let venues = objects.map({ (object) -> Venue in
                                return Venue(object: object)
                            })
                            DispatchQueue.main.async {
                                completion(venues, nil)
                            }
                        }
                        else {
                            DispatchQueue.main.async {
                                completion(nil, nil)
                            }
                        }
                    }
                    else {
                        DispatchQueue.main.async {
                            completion(nil, nil)
                        }
                    }
                }
                else {
                    DispatchQueue.main.async {
                        completion(nil, error)
                    }
                }
            })
            dataTask.resume()
            
        }
        else {
            DispatchQueue.main.async {
                completion(nil, nil)
            }
        }
    }
    
    func getImageForVenue(venue: Venue, completion: @escaping (_ image: UIImage?) -> Void) {
        if let venueId = venue.id {
            if let cachedImage = imageCache.object(forKey: venueId as AnyObject) {
                completion(cachedImage)
            }
            else if let imageURL = venue.imageURL {
                let downloadTask = URLSession.shared.dataTask(with: imageURL, completionHandler: { (data, response, error) in
                    if let theData = data {
                        let image = UIImage(data: theData)
                        if let theImage = image {
                            self.imageCache.setObject(theImage, forKey: venueId as AnyObject)
                        }
                        DispatchQueue.main.async {
                            completion(image)
                        }
                    }
                    else {
                        DispatchQueue.main.async {
                            completion(nil)
                        }
                    }
                })
                downloadTask.resume()
            }
            else {
                DispatchQueue.main.async {
                    completion(nil)
                    
                }
            }
        }
        else {
            DispatchQueue.main.async {
                completion(nil)
            }
        }
    }
    
}
