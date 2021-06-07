//
//  StorageManager.swift
//  MyPlecesForEating
//
//  Created by Никита Коголенок on 7.06.21.
//

import RealmSwift

let realm = try! Realm()

class StorageManager {
    static func saveObject(_ place: Place) {
       
        try! realm.write {
            realm.add(place)
        }
    }
}
