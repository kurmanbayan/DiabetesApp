//
//  HomeCollectionViewCell.swift
//  project1
//
//  Created by Kurnmanbay Ayan on 4/23/18.
//  Copyright © 2018 Kurmanbay Ayan. All rights reserved.
//

import UIKit

class HomeCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var featuredImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        featuredImageView.layer.cornerRadius = 5
        featuredImageView.layer.masksToBounds = true
    }
}
