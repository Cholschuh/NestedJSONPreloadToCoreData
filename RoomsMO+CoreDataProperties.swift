//
//  RoomsMO+CoreDataProperties.swift
//  NestedJSONPreloadToCoreData
//
//  Created by Chris Holschuh on 2/8/20.
//  Copyright © 2020 Chris Holschuh. All rights reserved.
//
//

import Foundation
import CoreData


extension RoomsMO {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<RoomsMO> {
        return NSFetchRequest<RoomsMO>(entityName: "RoomsMO")
    }

    @NSManaged public var beaconMajorVal: String?
    @NSManaged public var beaconMinorVal: String?
    @NSManaged public var information: String?
    @NSManaged public var name: String?
    @NSManaged public var floor: FloorsMO?
    @NSManaged public var rawPhotos: NSSet?

}

// MARK: Generated accessors for rawPhotos
extension RoomsMO {

    @objc(addRawPhotosObject:)
    @NSManaged public func addToRawPhotos(_ value: PhotosMO)

    @objc(removeRawPhotosObject:)
    @NSManaged public func removeFromRawPhotos(_ value: PhotosMO)

    @objc(addRawPhotos:)
    @NSManaged public func addToRawPhotos(_ values: NSSet)

    @objc(removeRawPhotos:)
    @NSManaged public func removeFromRawPhotos(_ values: NSSet)

}
