//
//  FavoriteViewController.swift
//  project1
//
//  Created by Kurnmanbay Ayan on 4/23/18.
//  Copyright © 2018 Kurmanbay Ayan. All rights reserved.
//

import UIKit
import RealmSwift
import SDWebImage

class FavoriteViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    var recipes: [RecipeObject] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 248.5
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getFavorites()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipes.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FavoriteCell", for: indexPath) as! FavoritesTableViewCell
        cell.recipeNameLabel.text = recipes[indexPath.row].name
        cell.recipeImageView.sd_setImage(with: URL(string: recipes[indexPath.row].imgUrl), completed: nil)
        cell.recipeCategoryLabel.text = recipes[indexPath.row].category.uppercased()
        cell.timeLabel.text = recipes[indexPath.row].time
        cell.portionLabel.text = "\(recipes[indexPath.row].portion) People"
        cell.difficultyLabel.text = recipes[indexPath.row].difficulty
        return cell
    }
    
    func getFavorites() {
        let realm = try! Realm()
        let results = realm.objects(RecipeObject.self)
        self.recipes = Array(results)
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}
