//
//  VisitedRoomsMO+CoreDataProperties.swift
//  NestedJSONPreloadToCoreData
//
//  Created by Chris Holschuh on 2/10/20.
//  Copyright © 2020 Chris Holschuh. All rights reserved.
//
//

import Foundation
import CoreData


extension VisitedRoomsMO {

    @nonobjc public class func createfetchRequest() -> NSFetchRequest<VisitedRoomsMO> {
        return NSFetchRequest<VisitedRoomsMO>(entityName: "VisitedRoomsMO")
    }

    @NSManaged public var name: String?

}
