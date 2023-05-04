//
//  ViewController.swift
//  task_book
//
//  Created by Khawaja Abdul Haleem on 14/10/2021.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var tableView: UITableView!
    var manager = BookManager()
    var mybooks : [Book] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        mybooks = manager.AllBooks()
        
    }
    override func viewDidAppear(_ animated: Bool) {
        
        mybooks = manager.AllBooks()
        tableView.reloadData()
    }

    
    @IBAction func deleteBtn(_ sender: UIButton) {
        let bookId = sender.tag
        
        if manager.deleteBooks(bid: bookId) {
            mybooks = manager.AllBooks()
            tableView.reloadData()
        } else {
            print(manager.Message)
        }
    }
    
    @IBAction func editBtn(_ sender: UIButton) {
        let row = sender.tag
        let book = mybooks[row]
        
        let dest = storyboard?.instantiateViewController(identifier: "ModifyBookViewController") as! ModifyBookViewController
        dest.book = book
        navigationController?.pushViewController(dest, animated: true)
    }
    
}

extension ViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 119
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mybooks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! BookDetailCell
        
        let book = mybooks[indexPath.row]
        
        cell.bookTitle.text = book.Title!
        cell.authorName.text = book.Author!
        cell.publisherName.text = book.Pubisher!
        cell.coverPicture.image = Utilities.getImageFromURL(name: book.CoverPicture!)
        cell.bookPrice.text = "RS.\(book.Price!)"
        
        cell.btnEdit.tag = indexPath.row
        cell.btnDelete.tag = book.Id
        
        return cell
    }
    
    
}
