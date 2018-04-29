//
//  CategoryDetailTableViewCell.swift
//  project1
//
//  Created by Kurnmanbay Ayan on 4/25/18.
//  Copyright © 2018 Kurmanbay Ayan. All rights reserved.
//

import UIKit

class CategoryDetailTableViewCell: UITableViewCell {

    @IBOutlet weak var categoryImageView: UIImageView!
    @IBOutlet weak var categoryNameLabel: UILabel!
    @IBOutlet weak var recipesFoundLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
