//
//  FavoritesTableViewCell.swift
//  project1
//
//  Created by Kurnmanbay Ayan on 4/27/18.
//  Copyright © 2018 Kurmanbay Ayan. All rights reserved.
//

import UIKit

class FavoritesTableViewCell: UITableViewCell {

    @IBOutlet weak var recipeImageView: UIImageView!
    @IBOutlet weak var recipeCategoryLabel: UILabel!
    @IBOutlet weak var recipeNameLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var difficultyLabel: UILabel!
    @IBOutlet weak var portionLabel: UILabel!
    @IBOutlet weak var recipeBackgroundView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        recipeBackgroundView.layer.cornerRadius = 5
        recipeBackgroundView.layer.masksToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
