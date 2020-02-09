//
//  FloorsMO+CoreDataClass.swift
//  NestedJSONPreloadToCoreData
//
//  Created by Chris Holschuh on 2/8/20.
//  Copyright © 2020 Chris Holschuh. All rights reserved.
//
//

import UIKit
import CoreData

@objc(FloorsMO)
public class FloorsMO: NSManagedObject {
    
    convenience init?(name: String?, mapImage: String?) {
        let appdelegate = UIApplication.shared.delegate as? AppDelegate
        guard let context = appdelegate?.persistentContainer.viewContext else{
            return nil
        }
        self.init(entity: FloorsMO.entity(), insertInto: context)
        self.name = name
        self.mapImage = mapImage
    }
}
