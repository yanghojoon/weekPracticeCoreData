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
        tableView.dataSource = self
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
        content.text = coreDataManager.fetchContext()[indexPath.row].body
        cell.contentConfiguration = content
        
        return cell
    }
    
    func tableView(_ tableView: UITableView,
                   commit editingStyle: UITableViewCell.EditingStyle,
                   forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let object = coreDataManager.fetchContext()[indexPath.row]
            coreDataManager.delete(object: object)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}

