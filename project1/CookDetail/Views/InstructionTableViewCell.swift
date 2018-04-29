//
//  InstructionTableViewCell.swift
//  project1
//
//  Created by Kurnmanbay Ayan on 4/24/18.
//  Copyright © 2018 Kurmanbay Ayan. All rights reserved.
//

import UIKit

class InstructionTableViewCell: UITableViewCell, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.estimatedRowHeight = 200
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    var instructions: [String] = []
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return instructions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CookInstructionFull", for: indexPath) as! InstructionDetailTableViewCell
        cell.numerationLabel.text = "\(indexPath.row + 1)"
        cell.instructionLabel.text = instructions[indexPath.row]
        return cell
    }
}
