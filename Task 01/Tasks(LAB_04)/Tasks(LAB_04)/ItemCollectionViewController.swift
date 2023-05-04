//
//  ItemCollectionViewController.swift
//  Tasks(LAB_04)
//
//  Created by Khawaja Abdul Haleem on 24/09/2021.
//

import UIKit

class ItemCollectionViewController: UIViewController {

    let collectionItems = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "a", "b", "c", "d", "e", "f", "g", "h", "Collection", "Items", "are", "as", "Follows"]
  
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    

}

extension ItemCollectionViewController : UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
        
        cell.collectionLabel.text = collectionItems[indexPath.row]
        return cell
    }
    
    
}
