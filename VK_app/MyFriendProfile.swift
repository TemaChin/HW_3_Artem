//
//  MyFriendProfile.swift
//  HomeWork_2_AppScreens
//
//  Created by Артем Станкевич on 19.10.2020.
//

import Foundation
import RealmSwift

/// структура профиля друга
struct MyFriendProfile {
    
    var name: String?
    var info: String?
    
    init( _ name: String, _ info: String) {
        self.name = name
        self.info = info
    }
}
