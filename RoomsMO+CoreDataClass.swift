//
//  RoomsMO+CoreDataClass.swift
//  NestedJSONPreloadToCoreData
//
//  Created by Chris Holschuh on 2/8/20.
//  Copyright © 2020 Chris Holschuh. All rights reserved.
//
//

import UIKit
import CoreData

@objc(RoomsMO)
public class RoomsMO: NSManagedObject {
    
    convenience init?(name: String?, information: String?, beaconMajorVal: String?, beaconMinorVal: String?) {
        let appdelegate = UIApplication.shared.delegate as? AppDelegate
        guard let context = appdelegate?.persistentContainer.viewContext else{
            return nil
        }
        self.init(entity: RoomsMO.entity(), insertInto: context)
        self.name = name
        self.information = information
        self.beaconMajorVal = beaconMajorVal
        self.beaconMinorVal = beaconMinorVal
    }
    
}
