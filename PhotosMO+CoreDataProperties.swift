//
//  PhotosMO+CoreDataProperties.swift
//  NestedJSONPreloadToCoreData
//
//  Created by Chris Holschuh on 2/8/20.
//  Copyright © 2020 Chris Holschuh. All rights reserved.
//
//

import Foundation
import CoreData


extension PhotosMO {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<PhotosMO> {
        return NSFetchRequest<PhotosMO>(entityName: "PhotosMO")
    }

    @NSManaged public var altText: String?
    @NSManaged public var path: String?
    @NSManaged public var room: RoomsMO?

}
