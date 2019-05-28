//
//  PostTableViewCell.swift
//  TownSq
//
//  Created by Guilherme Piccoli on 27/05/19.
//  Copyright © 2019 Guilherme Piccoli. All rights reserved.
//

import UIKit

class PostTableViewCell: UITableViewCell {

    @IBOutlet weak var postTitleLabel: UILabel!
    @IBOutlet weak var postAuthorCell: UILabel!
    
    @IBOutlet weak var cardView: UIView!
    
    override func awakeFromNib() {
        cardView.layer.cornerRadius = 12
        cardView.layer.masksToBounds = true
        cardView.layer.borderWidth = 2
        cardView.layer.borderColor = UIColor.lightGray.cgColor
        cardView.addShadowToView()
    }
   

}
