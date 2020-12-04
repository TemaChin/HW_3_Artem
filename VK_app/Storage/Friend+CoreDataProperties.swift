//
//  Friend+CoreDataProperties.swift
//  VK_app
//
//  Created by Артем Станкевич on 23.11.2020.
//
//

import Foundation
import CoreData


extension Friend {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Friend> {
        return NSFetchRequest<Friend>(entityName: "Friend")
    }

    @NSManaged public var name: String?
    @NSManaged public var city: String?

}

extension Friend : Identifiable {

}
