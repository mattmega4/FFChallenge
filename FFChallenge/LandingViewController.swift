//
//  LandingViewController.swift
//  FFChallenge
//
//  Created by Matthew Howes Singleton on 6/16/17.
//  Copyright © 2017 Matthew Howes Singleton. All rights reserved.
//

import UIKit


class LandingViewController: UIViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var collectionView: UICollectionView!
    
    let margin: CGFloat = 10
    let cellsPerC = 3
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setNavBar()
        collectionView.backgroundColor = UIColor.init(red: 5.0/255.0,
                                                      green: 153.0/255.0,
                                                      blue: 146.0/255.0,
                                                      alpha: 0.1)
    }
    
    func setNavBar() {
        title = "FetchyFox Challenge"
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


//extension LandingViewController: UICollectionViewDelegate, UICollectionViewDataSource {

//func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//    let flowLayout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
//    let marginsAndInsets = flowLayout.sectionInset.left + flowLayout.sectionInset.right + flowLayout.minimumInteritemSpacing * CGFloat(cellsPerC - 1)
//    let itemWidth = ((collectionView.bounds.size.width - marginsAndInsets) / CGFloat(cellsPerC)).rounded(.down)
//    return CGSize(width: itemWidth, height: itemWidth)
//}

//}




