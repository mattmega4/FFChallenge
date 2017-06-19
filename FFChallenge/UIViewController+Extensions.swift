//
//  UIViewController+Extensions.swift
//  FFChallenge
//
//  Created by Matthew Howes Singleton on 6/19/17.
//  Copyright © 2017 Matthew Howes Singleton. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    func setNavBar() {
        self.navigationController?.isNavigationBarHidden = false
        navigationController?.navigationBar.barTintColor = UIColor(red: 230.0/255.0,
                                                                   green: 114.0/255.0,
                                                                   blue: 53.0/255.0,
                                                                   alpha: 1.0)
        UINavigationBar.appearance().tintColor = .white
        UINavigationBar.appearance().titleTextAttributes = [NSForegroundColorAttributeName : UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white,
                                                                   NSFontAttributeName: UIFont(name: "Helvetica-Bold",
                                                                                               size: 18)!]
    }
    
    
}
