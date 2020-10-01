//
//  Models.swift
//  TheCoffeeHouse
//
//  Created by namtrinh on 9/14/20.
//  Copyright © 2020 namtrinh. All rights reserved.
//

import Foundation
import RealmSwift

struct News{
    let image: String
    let title: String
    let content: String
    let button: String
}

struct Model {
    let imageName: String
    let title: String
    let content: String
    let namebutton: String
    init(imageName: String, title:String, content:String, namebutton:String){
        self.imageName = imageName
        self.title = title
        self.content = content
        self.namebutton = namebutton
    }
}

struct AccountViewType {
    let nameimage: String
    let text: String
}

struct Product {
    let imageName: String
    let name: String
    let price: String
}

class ProDucts : Object {
    @objc dynamic var id:Int = 0
    @objc dynamic var imageName: String = ""
    @objc dynamic var name: String = ""
    @objc dynamic var price: String = ""
    
    override static func primaryKey() -> String? {
        return "id"
    }
}
