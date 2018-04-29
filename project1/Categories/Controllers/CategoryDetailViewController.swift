//
//  CategoryDetailViewController.swift
//  project1
//
//  Created by Kurnmanbay Ayan on 4/25/18.
//  Copyright © 2018 Kurmanbay Ayan. All rights reserved.
//

import UIKit
import NVActivityIndicatorView
import SDWebImage

private struct Constants {
    static let topCell = "TopCell"
    static let bottomCell = "BottomCell"
}
class CategoryDetailViewController: UIViewController, NVActivityIndicatorViewable {

    @IBOutlet weak var tableView: UITableView!
    var category: Category!
    var categoryRecipes: [Recipes] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        getRecipesByCategory()
    }
    
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return .lightContent
    }
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func getRecipesByCategory() {
        startAnimating()
        Recipes.getRecipesByCategory(category.id) { (data, message) in
            self.stopAnimating()
            if let message = message {
                print(message)
            }
            else {
                self.categoryRecipes = data!
            }
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let detailVC = segue.destination as? CookDetailViewController {
            detailVC.recipes = categoryRecipes[sender as! Int]
        }
    }
}

extension CategoryDetailViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categoryRecipes.count + 1;
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
            case 0:
                return 328
            default:
                return 232
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
            case 0:
                let cell = tableView.dequeueReusableCell(withIdentifier: Constants.topCell, for: indexPath) as! CategoryDetailTableViewCell
                cell.categoryImageView.sd_setImage(with: URL(string: category.imgUrl), completed: nil)
                cell.categoryNameLabel.text = category.name
                cell.recipesFoundLabel.text = "\(categoryRecipes.count) Recipes"
                return cell
            default:
                let cell = tableView.dequeueReusableCell(withIdentifier: Constants.bottomCell, for: indexPath) as! CategoriesTableViewCell
                
                cell.recipeImageView.sd_setShowActivityIndicatorView(true)
                cell.recipeImageView.sd_setIndicatorStyle(.gray)
                cell.recipeImageView.sd_setImage(with: URL(string: categoryRecipes[indexPath.row - 1].imgUrl), placeholderImage: UIImage(named: "placeholder"), completed: nil)
                
                cell.recipeNameLabel.text = categoryRecipes[indexPath.row - 1].name
                cell.timeLabel.text = categoryRecipes[indexPath.row - 1].time
                cell.difficultyLabel.text = categoryRecipes[indexPath.row - 1].difficulty
                cell.portionLabel.text = "\(categoryRecipes[indexPath.row - 1].portion) Peoples"
                
                return cell
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row > 0 {
            performSegue(withIdentifier: "CategoryToCookDetail", sender: indexPath.row - 1)
        }
    }
}
