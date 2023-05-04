//
//  ViewController.swift
//  Task_iOSDev
//
//  Created by Khawaja Abdul Haleem on 24/10/2022.
//

import UIKit

class PostsViewController: BaseViewController {

    let mPostViewModel = PostViewModel()
    var postsVcViewModel = PostsVcViewModel()
    
    @IBOutlet weak var postsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        initialSetup()
        setTableView()
        
      
    }

    private func initialSetup() {
      
        self.showActivityIndicator()
        mPostViewModel.getAllPosts { data in
       
            self.postsVcViewModel.postsList = data
            if self.postsVcViewModel.postsList.count != 0 {
                
                DispatchQueue.main.async {
                    
                 
                    self.postsTableView.isHidden = false
                    self.postsTableView.reloadData()
                    self.removeActivityIndicator()
                }
            }
          
           
        }
        
    }
 
    
    private func setTableView() {
        postsTableView.isHidden = true
        
        postsTableView.register(UINib(nibName: UINibConstant.PostsTableViewCellNib, bundle: nil), forCellReuseIdentifier: TableViewcellIdentifiers.PostsTableViewCellIdentifier)
        
      
    }

}

extension PostsViewController: UITableViewDelegate, UITableViewDataSource {
  
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return postsVcViewModel.postsList.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 136
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let postsCell = tableView.dequeueReusableCell(withIdentifier: TableViewcellIdentifiers.PostsTableViewCellIdentifier) as! PostsTableViewCell
       
        postsCell.configurPostsCell(postsModel: postsVcViewModel.postsList[indexPath.row])
        
        return postsCell
        
    }
    
    
}
