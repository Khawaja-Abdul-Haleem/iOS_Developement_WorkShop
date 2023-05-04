//
//  NameViewController.swift
//  iOSTutorials
//
//  Created by Sadia on 22/09/2021.
//  Copyright © 2021 Sadia. All rights reserved.
//

import UIKit

class NameViewController: UIViewController,UICollectionViewDataSource, UICollectionViewDelegate  {
    
    @IBOutlet weak var `switch`: UISwitch!
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return name.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! NameCollectionViewCell
        cell.lblName.text = name[indexPath.row]
        
        return cell
    }
    
  var name = [String]()
    
    
    
    
    
    
    
    
    
    @IBAction func switchchanged(_ sender: UISwitch) {
      if sender.isOn
      {
         view.backgroundColor = .blue
      }
        else
      {
        view.backgroundColor = .black
       }
    }
    
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        name = ["red","black","orange","blue","green","yellow"]
        

            }
    

   }
 
