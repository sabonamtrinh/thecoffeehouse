//
//  Models.swift
//  TheCoffeeHouse
//
//  Created by namtrinh on 9/14/20.
//  Copyright © 2020 namtrinh. All rights reserved.
//

import Foundation

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
