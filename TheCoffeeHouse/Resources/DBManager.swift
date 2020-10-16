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
    
    func getNewsFormDB() -> Results<NewsRealm> {
        let result: Results<NewsRealm> = database.objects(NewsRealm.self)
        return result
    }
    
    func getUpdateFormHome() -> Results<UpdateFormHome> {
        let result: Results<UpdateFormHome> = database.objects(UpdateFormHome.self)
        return result
    }
    
    func getCoffeeLove() -> Results<CoffeLove> {
        let result: Results<CoffeLove> = database.objects(CoffeLove.self)
        return result
    }
    
    func getDrinks() -> Results<Drinks> {
        let result: Results<Drinks> = database.objects(Drinks.self)
        return result
    }
    
    func getFoods() -> Results<Foods> {
        let result: Results<Foods> = database.objects(Foods.self)
        return result
    }
}
