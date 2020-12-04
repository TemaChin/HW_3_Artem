//
//  RealmModel.swift
//  VK_app
//
//  Created by Артем Станкевич on 28.11.2020.
//

import Foundation
import RealmSwift

class MyFriendProfileRealm: Object {
    @objc dynamic var friendName = ""
    @objc dynamic var friendCity = ""
    
    convenience required init(name: String, city: String) {
        self.init()
        self.friendName = name
        self.friendCity = city
    }
}
