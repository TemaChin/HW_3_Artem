//
//  Friend+CoreDataProperties.swift
//  VK_app
//
//  Created by Артем Станкевич on 22.11.2020.
//
//

import Foundation
import CoreData


extension Friend {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Friend> {
        return NSFetchRequest<Friend>(entityName: "Friend")
    }

    @NSManaged public var city: String?
    @NSManaged public var name: String?

}

//extension Friend : Identifiable {

//}
