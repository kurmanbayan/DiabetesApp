//
//  CategoriesViewController.swift
//  project1
//
//  Created by Kurnmanbay Ayan on 4/25/18.
//  Copyright © 2018 Kurmanbay Ayan. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

class CategoriesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, NVActivityIndicatorViewable {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchView: UIView!
    
    @IBAction func searchButtonPressed(_ sender: UIButton) {
        UIView.animate(withDuration: 0.3) {
            self.searchView.isHidden = false
        }
    }
    
    @IBAction func searchCancelButtonPressed(_ sender: UIButton) {
        UIView.animate(withDuration: 0.3) {
            self.searchView.isHidden = true
        }
    }
    
    
    var categories: [Category] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 64.5
        tableView.delegate = self
        tableView.dataSource = self
        getCategories()
    }
    
    func getCategories() {
        startAnimating()
        Category.getCategories() { (data, message) in
            self.stopAnimating()
            if let message = message {
                print(message)
            }
            else {
                self.categories = data!
            }
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let detailVC = segue.destination as? CategoryDetailViewController {
            detailVC.category = categories[sender as! Int]
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath) as! CategoryTableViewCell
        cell.categoryLabel.text = categories[indexPath.row].name.uppercased()
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "ShowCategoryDetail", sender: indexPath.row)
    }
}
