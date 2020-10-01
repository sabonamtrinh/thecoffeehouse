//
//  DBManager.swift
//  TheCoffeeHouse
//
//  Created by namtrinh on 10/1/20.
//  Copyright © 2020 namtrinh. All rights reserved.
//

import Foundation
import RealmSwift

class DBManager {
    private var database: Realm
    static let sharedInstance = DBManager()
    static var autoID:Int = 0
    
    let userData: UserDefaults!
    
    private init(){
        database = try! Realm()
        userData = UserDefaults.standard
        DBManager.autoID = userData.integer(forKey: "autoID")
    }
    
    func getDataFormDB() -> Results<ProDucts> {
        let result: Results<ProDucts> = database.objects(ProDucts.self)
        return result
    }
    
    func addData(object: ProDucts) {
        try! database.write {
            DBManager.autoID += 1
            object.id = DBManager.autoID
            database.add(object)
        }
    }
}
