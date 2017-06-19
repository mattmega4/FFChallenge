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
    
    let margin: CGFloat = 20
    let cellsPerC = 2
    
    var venues = [Venue]()
    
    var searchActive : Bool = false
    var filtered: [Venue] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.searchBar.delegate = self
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        loadData()
        setNavBar()
        title = "FetchyFox Challenge"
        
        
        
        
        collectionView.backgroundColor = UIColor.init(red: 5.0/255.0,
                                                      green: 153.0/255.0,
                                                      blue: 146.0/255.0,
                                                      alpha: 0.1)
    }
    
    
    // MARK: - Load Venues
    
    func loadData() {
        NetworkUtility.shared.downloadVenues { (venues, error) in
            if let theVenues = venues {
                self.venues = theVenues
                self.collectionView.reloadData()
            }
        }
    }
    
} // End of LandingViewController


// MARK: - CollectionView Delegate & DataSource & FlowLayout Methods

extension LandingViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return venues.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! EstablishmentCollectionViewCell
        let venue = venues[indexPath.row]
        cell.nameLabel.text = venue.name
        NetworkUtility.shared.getImageForVenue(venue: venue) { (image) in
            cell.imgView.image = image
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let venue = venues[indexPath.row]
        
        if let detailVC = storyboard?.instantiateViewController(withIdentifier: "detailVC") as? DetailViewController {
            detailVC.venue = venue
            navigationController?.pushViewController(detailVC, animated: true)
        }
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        collectionView?.collectionViewLayout.invalidateLayout()
        super.viewWillTransition(to: size, with: coordinator)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let flowLayout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        let marginsAndInsets = flowLayout.sectionInset.left + flowLayout.sectionInset.right + flowLayout.minimumInteritemSpacing * CGFloat(cellsPerC - 1)
        let itemWidth = ((collectionView.bounds.size.width - marginsAndInsets) / CGFloat(cellsPerC)).rounded(.down)
        return CGSize(width: itemWidth, height: itemWidth)
    }
    
}


// MARK: - UISearch Bar UISearchBarDelegate & UISearchDisplayDelegate

extension LandingViewController: UISearchBarDelegate, UISearchDisplayDelegate {
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchActive = true;
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        searchActive = false;
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchActive = false;
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchActive = false;
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        //
    }
    
    
    
}




