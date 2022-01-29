//
//  ViewController.swift
//  WeekPracticeCoreData
//
//  Created by 양호준 on 2022/01/29.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var coreDataManager: CoreDataManager = CoreDataManager.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        coreDataManager.fetchContext().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") else {
            return UITableViewCell()
        }
        
        var content = cell.defaultContentConfiguration()
        content.text = coreDataManager.fetchContext()[indexPath.row].description
        cell.contentConfiguration = content
        
        return cell
    }
}

