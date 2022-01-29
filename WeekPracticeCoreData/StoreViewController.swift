//
//  StoreViewController.swift
//  WeekPracticeCoreData
//
//  Created by 양호준 on 2022/01/29.
//

import UIKit

class StoreViewController: UIViewController {
    @IBOutlet weak var contentTextField: UITextField!
    @IBOutlet weak var categorySegmentedControll: UISegmentedControl!
    var coreDataManager: CoreDataManager = CoreDataManager.shared
    weak var delegate: ReloadDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func touchUpStoreButton(_ sender: UIButton) {
        let index = categorySegmentedControll.selectedSegmentIndex
        let category = Model.Category(rawValue: index)
        let uuid = UUID()
        
        let model = Model(content: contentTextField.text!, category: category!, id: uuid)
        coreDataManager.insertJoke(model: model)
        delegate?.reloadData()
        self.dismiss(animated: true, completion: nil)
    }
}
