//
//  Model.swift
//  WeekPracticeCoreData
//
//  Created by 양호준 on 2022/01/29.
//

import Foundation

struct Model {
    let content: String
    let category: Category
    let id: UUID
}

extension Model {
    enum Category: Int {
        case buzzword
        case gag
    }
}
