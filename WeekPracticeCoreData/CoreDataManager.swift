//
//  CoreDataManager.swift
//  WeekPracticeCoreData
//
//  Created by 양호준 on 2022/01/29.
//

import CoreData

class CoreDataManager {
    static var shared: CoreDataManager = CoreDataManager()
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
    
    func insertJoke(model: Model) {
        if let entity = NSEntityDescription.entity(forEntityName: "Joke",
                                                   in: persistentContainer.viewContext) {
            let joke = NSManagedObject(entity: entity, insertInto: persistentContainer.viewContext)
            joke.setValue(model.content, forKey: "content")
            joke.setValue(model.category, forKey: "category")
            joke.setValue(model.id, forKey: "id")
            saveContext()
        }
    }
    
    func fetchContext() -> [Joke] {
        let context = persistentContainer.viewContext
        let fetchRequest: NSFetchRequest<Joke>
        fetchRequest = Joke.fetchRequest()
        
        do {
            let objects = try context.fetch(fetchRequest)
            return objects
        } catch let error as NSError {
            print("Error: \(error), \(error.userInfo)")
        }
        return []
    }
}

