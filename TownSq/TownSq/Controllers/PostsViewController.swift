//
//  ViewController.swift
//  TownSq
//
//  Created by Guilherme Piccoli on 27/05/19.
//  Copyright © 2019 Guilherme Piccoli. All rights reserved.
//

import UIKit

class PostsViewController: UIViewController {

    
    var listPosts: [Post]?
    var listUsers: [User]?

    
    @IBOutlet weak var postsTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.postsTableView.delegate = self
        self.postsTableView.dataSource = self
        
        
        APIService.getPosts { (posts) in
            self.listPosts = posts
            print(self.listPosts!.count)
            
            DispatchQueue.main.async {
                self.postsTableView.reloadData()
            }
        }
        
        APIService.getUsers { (users) in
            self.listUsers = users
            DispatchQueue.main.async {
                self.postsTableView.reloadData()
            }
        }
 
    }


}

extension PostsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let listPosts = listPosts else {return}
        guard let listUsers = listUsers else {return}
        
        guard let post: Post = listPosts[indexPath.row] else {return}
        guard let user: User = self.listUsers![self.listPosts![indexPath.row].userId-1] else {return}

        performSegue(withIdentifier: "postDetails", sender: (post: post, user: user))
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let postDetails = segue.destination as? PostDetailsViewController {
            if let (post, user) = sender as? (Post, User) {
                postDetails.post = post
                postDetails.user = user
            }
        }
    }
    
}

extension PostsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let listPosts = listPosts else { return 0 }
        return listPosts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = postsTableView.dequeueReusableCell(withIdentifier: "post") as! PostTableViewCell
        
        guard let listPosts = listPosts else {return cell}
        guard let listUsers = listUsers else {return cell}
        
        cell.postTitleLabel.text = self.listPosts![indexPath.row].title
        cell.postAuthorCell.text = "\(self.listUsers![self.listPosts![indexPath.row].userId-1].name) (\(self.listUsers![self.listPosts![indexPath.row].userId-1].username))"
        return cell
    }
}
