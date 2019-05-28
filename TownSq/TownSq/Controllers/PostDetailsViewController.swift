//
//  PostDetailsViewController.swift
//  TownSq
//
//  Created by Guilherme Piccoli on 27/05/19.
//  Copyright © 2019 Guilherme Piccoli. All rights reserved.
//

import UIKit

class PostDetailsViewController: UIViewController {
    
    
    @IBOutlet weak var postTitleLabel: UILabel!
    @IBOutlet weak var postBodyLabel: UILabel!
    @IBOutlet weak var postUserNameLabel: UILabel!
    @IBOutlet weak var bodyView: UIView!
    
    var user: User?
    var post: Post?
    
    override func viewDidLoad() {
        
        postBodyLabel.sizeToFit()
        
        if user != nil && post != nil {
            postTitleLabel.text = post?.title
            postUserNameLabel.text = "From: \(user!.name) (\(user!.username))"
            postBodyLabel.text = post?.body
            
            bodyView.layer.cornerRadius = 12
            bodyView.layer.masksToBounds = true
            bodyView.layer.borderWidth = 1
            bodyView.layer.borderColor = UIColor.black.cgColor
            bodyView.addShadowToView()
        
        }
    }
    
}
