//
//  Entity+CoreDataProperties.swift
//  WeekPracticeCoreData
//
//  Created by 양호준 on 2022/01/29.
//
//

import Foundation
import CoreData


extension Joke {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Joke> {
        return NSFetchRequest<Joke>(entityName: "Entity")
    }
    
    @NSManaged public var body: String?
    @NSManaged public var category: String?
    @NSManaged public var id: UUID?

}

extension Joke : Identifiable {

}
