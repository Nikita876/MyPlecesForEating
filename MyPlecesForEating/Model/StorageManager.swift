//
//  StorageManager.swift
//  MyPlecesForEating
//
//  Created by Никита Коголенок on 7.06.21.
//

import RealmSwift

let realm = try! Realm()

class StorageManager {
    // MARK: - Methods
    /// Save object in database
    static func saveObject(_ place: Place) {
        try! realm.write {
            realm.add(place)
        }
    }
    /// Delete object in database
    static func deleteObject(_ place: Place) {
        try! realm.write {
            realm.delete(place)
        }
    }
}
