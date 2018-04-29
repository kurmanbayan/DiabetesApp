//
//  HomeViewController.swift
//  project1
//
//  Created by Kurnmanbay Ayan on 4/23/18.
//  Copyright © 2018 Kurmanbay Ayan. All rights reserved.
//

import UIKit
import NVActivityIndicatorView
import SDWebImage

private struct Constants {
    static let collectionViewCell = "HomeCollectionCell"
    static let tableViewCell = "HomeTableCell"
    static let homeToCookDeatil = "HomeToCookDetail"
}

class HomeViewController: UIViewController, NVActivityIndicatorViewable {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var tableView: UITableView!
    
    var recipes: [Recipes] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.rowHeight = 248.5
        viewsSetup()
        navBarSetup()
        getRecipes()
    }
    
    func navBarSetup() {
        navigationController?.navigationBar.barTintColor = UIColor.init(red: 249/255, green: 248/255, blue: 252/255, alpha: 1)
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "nav1", style: .done, target: self, action: #selector(addTapped))
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "nav2", style: .done, target: self, action: #selector(addTapped))
        self.navigationItem.title = "App name"
    }
    
    @objc func addTapped() {
        print("asd")
    }
    
    func getRecipes() {
        startAnimating()
        Recipes.getRecipes() { (data, message) in
            self.stopAnimating()
            if let message = message {
                print(message)
            }
            else {
                self.recipes = data!
            }
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }

        }
    }
    
    func viewsSetup() {
        collectionView.delegate = self
        collectionView.dataSource = self
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let cookDetailVC = segue.destination as? CookDetailViewController {
            cookDetailVC.recipes = recipes[sender as! Int]
        }
    }
    
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipes.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.tableViewCell, for: indexPath) as! HomeTableViewCell
        cell.categoryLabel.text = recipes[indexPath.row].category.uppercased()
        cell.cookNameLabel.text = recipes[indexPath.row].name
        cell.timeLabel.text = recipes[indexPath.row].time
        cell.latestImageView.sd_setImage(with: URL(string: recipes[indexPath.row].imgUrl))
        cell.portionLabel.text = "\(recipes[indexPath.row].portion) People"
        cell.difficultyLabel.text = "\(recipes[indexPath.row].difficulty)"
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: Constants.homeToCookDeatil, sender: indexPath.row)
    }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.collectionViewCell, for: indexPath) as! HomeCollectionViewCell
        
        return cell
    }
}

