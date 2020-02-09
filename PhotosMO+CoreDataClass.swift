//
//  PhotosMO+CoreDataClass.swift
//  NestedJSONPreloadToCoreData
//
//  Created by Chris Holschuh on 2/8/20.
//  Copyright © 2020 Chris Holschuh. All rights reserved.
//
//

import UIKit
import CoreData

@objc(PhotosMO)
public class PhotosMO: NSManagedObject {
    
    convenience init?(altText: String?, path: String?) {
        let appdelegate = UIApplication.shared.delegate as? AppDelegate
        guard let context = appdelegate?.persistentContainer.viewContext else{
            return nil
        }
        self.init(entity: PhotosMO.entity(), insertInto: context)
        self.altText = altText
        self.path = path
    }
}
