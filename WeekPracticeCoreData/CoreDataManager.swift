//
//  CoreDataManager.swift
//  WeekPracticeCoreData
//
//  Created by 양호준 on 2022/01/29.
//

import CoreData

class CoreDataManager {
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "CoreData")
        container.loadPersistentStores { description, error in
            if let error = error {
                print("영구 저장소에서 데이터를 불러오지 못했습니다")
            }
        }
        return container
    }()
    
    func saveContext() {
        let context = persistentContainer.viewContext
        guard context.hasChanges else { return }
        do {
            try context.save()
        } catch let error as NSError {
            print("Error: \(error), \(error.userInfo)")
        }
    }
}

