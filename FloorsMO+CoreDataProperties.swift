//
//  FloorsMO+CoreDataProperties.swift
//  NestedJSONPreloadToCoreData
//
//  Created by Chris Holschuh on 2/8/20.
//  Copyright © 2020 Chris Holschuh. All rights reserved.
//
//

import Foundation
import CoreData


extension FloorsMO {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<FloorsMO> {
        return NSFetchRequest<FloorsMO>(entityName: "FloorsMO")
    }

    @NSManaged public var mapImage: String?
    @NSManaged public var name: String?
    @NSManaged public var rawRooms: NSSet?

}

// MARK: Generated accessors for rawRooms
extension FloorsMO {

    @objc(addRawRoomsObject:)
    @NSManaged public func addToRawRooms(_ value: RoomsMO)

    @objc(removeRawRoomsObject:)
    @NSManaged public func removeFromRawRooms(_ value: RoomsMO)

    @objc(addRawRooms:)
    @NSManaged public func addToRawRooms(_ values: NSSet)

    @objc(removeRawRooms:)
    @NSManaged public func removeFromRawRooms(_ values: NSSet)

}
