//
//  Entity+CoreDataProperties.swift
//  WeekPracticeCoreData
//
//  Created by 양호준 on 2022/01/29.
//
//

import Foundation
import CoreData


extension Entity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Entity> {
        return NSFetchRequest<Entity>(entityName: "Entity")
    }


}

extension Entity : Identifiable {

}
