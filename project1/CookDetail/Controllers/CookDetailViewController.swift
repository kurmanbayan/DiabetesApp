//
//  CookDetailViewController.swift
//  project1
//
//  Created by Kurnmanbay Ayan on 4/24/18.
//  Copyright © 2018 Kurmanbay Ayan. All rights reserved.
//

import UIKit
import SDWebImage
import RealmSwift

private struct Constants {
    static let cookDetail = "CookDetail"
    static let cookInstruction = "CookInstruction"
    static let cookIngredient = "CookIngredient"
}

class CookDetailViewController: UIViewController {
    
    
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var tableView: UITableView!

    @IBAction func likeButtonPressed(_ sender: UIButton) {
        let indexPath = IndexPath(row: 0, section: 0)
        let cell = tableView.cellForRow(at: indexPath) as! CookDetailTableViewCell
        
        let recipeObject = getObj()
        let realm = try! Realm()
        
        if cell.likeButton.currentImage == UIImage(named: "like") {
            try! realm.write {
                realm.add(recipeObject)
            }
            cell.likeButton.setImage(UIImage(named: "liked"), for: .normal)
        }
        else {
            try! realm.write {
                let recipe = realm.objects(RecipeObject.self).filter("id = \(recipes.id)")
                realm.delete(recipe)
            }
            cell.likeButton.setImage(UIImage(named: "like"), for: .normal)
        }
    }
    
    func getObj() -> RecipeObject {
        let recipeObject = RecipeObject()
        recipeObject.id = recipes.id
        recipeObject.name = recipes.name
        recipeObject.category = recipes.category
        recipeObject.time = recipes.time
        recipeObject.imgUrl = recipes.imgUrl
        recipeObject.portion = recipes.portion
        recipeObject.difficulty = recipes.difficulty
        
        return recipeObject
    }
    
    func checkLikeButton() {
        let indexPath = IndexPath(row: 0, section: 0)
        let cell = tableView.cellForRow(at: indexPath) as! CookDetailTableViewCell
        let realm = try! Realm()
        if realm.objects(RecipeObject.self).filter("id = \(recipes.id)").isEmpty {
            cell.likeButton.setImage(UIImage(named: "like"), for: .normal)
        }
        else {
            cell.likeButton.setImage(UIImage(named: "liked"), for: .normal)
        }
    }
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    var recipes: Recipes!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLayoutSubviews() {
        checkLikeButton()
    }
}

extension CookDetailViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            return 360
        case 1:
            return CGFloat(40 * (recipes.ingredients.count + 1))
        default:
            return CGFloat(60 * (recipes.instructions.count + 1))
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cookDetail, for: indexPath) as! CookDetailTableViewCell
            cell.cookNameLabel.text = self.recipes.name
            cell.difficultyLabel.text = self.recipes.difficulty
            cell.timeLabel.text = self.recipes.time
            cell.categoryLabel.text = self.recipes.category.uppercased()
            cell.portionLabel.text = "\(self.recipes.portion) People"
            cell.cookImageView?.sd_setImage(with: URL(string: self.recipes.imgUrl))

            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cookIngredient, for: indexPath) as! IngredientTableViewCell
            cell.ingredients = self.recipes.ingredients
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cookInstruction, for: indexPath) as! InstructionTableViewCell
            cell.instructions = self.recipes.instructions
            return cell
        }
    }
}
