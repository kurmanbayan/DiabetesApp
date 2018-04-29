//
//  IngredientTableViewCell.swift
//  project1
//
//  Created by Kurnmanbay Ayan on 4/24/18.
//  Copyright © 2018 Kurmanbay Ayan. All rights reserved.
//

import UIKit

class IngredientTableViewCell: UITableViewCell, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.estimatedRowHeight = 200
        tableView.dataSource = self
    }
    
    var ingredients: [String] = []
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ingredients.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CookIngredientFull", for: indexPath) as! IngredientFullTableViewCell
        cell.ingredientLabel.text = ingredients[indexPath.row]
        return cell
    }
}
