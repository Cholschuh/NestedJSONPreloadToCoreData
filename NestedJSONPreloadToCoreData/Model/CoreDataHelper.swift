//
//  CoreDataHelper.swift
//  NestedJSONPreloadToCoreData
//
//  Created by Chris Holschuh on 2/7/20.
//  Copyright © 2020 Chris Holschuh. All rights reserved.
//

import UIKit
import Foundation
import CoreData


class coreDataHelper: NSObject {
    
    private class func getContext() -> NSManagedObjectContext{
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
        
    }
    
    class func recordVistedLoc(name: String)-> Bool{
        do {
            let context = getContext()
            let vistedRooms = VisitedRoomsMO(context: context)
            vistedRooms.name = name
            try context.save()
            return true
        }catch{
            print(error.localizedDescription)
            return false
        }
    }
    
    class func clearAllVistedLoc () -> Bool{
        let context = getContext()
        let deleteAllRequest = NSBatchDeleteRequest(fetchRequest: VisitedRoomsMO.fetchRequest())
        
        do {
            try context.execute(deleteAllRequest)
            return true
        }catch{
            print (error.localizedDescription)
            return false
        }
    }
    
    class func fetchRecord () -> Bool{
        
       return true
    }
    
}
