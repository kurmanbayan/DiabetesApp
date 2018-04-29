//
//  CategoryTableViewCell.swift
//  project1
//
//  Created by Kurnmanbay Ayan on 4/25/18.
//  Copyright © 2018 Kurmanbay Ayan. All rights reserved.
//

import UIKit

class CategoryTableViewCell: UITableViewCell {

    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var categoryBackgroundView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        categoryBackgroundView.layer.cornerRadius = 3
        categoryBackgroundView.layer.masksToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
