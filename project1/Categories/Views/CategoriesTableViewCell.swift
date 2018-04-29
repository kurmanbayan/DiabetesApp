//
//  CategoriesTableViewCell.swift
//  project1
//
//  Created by Kurnmanbay Ayan on 4/25/18.
//  Copyright © 2018 Kurmanbay Ayan. All rights reserved.
//

import UIKit

class CategoriesTableViewCell: UITableViewCell {
    
    @IBOutlet weak var recipeImageView: UIImageView!
    @IBOutlet weak var recipeBackgroundView: UIView!
    @IBOutlet weak var recipeNameLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var difficultyLabel: UILabel!
    @IBOutlet weak var portionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        recipeBackgroundView.layer.cornerRadius = 5
        recipeBackgroundView.layer.masksToBounds = true
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
