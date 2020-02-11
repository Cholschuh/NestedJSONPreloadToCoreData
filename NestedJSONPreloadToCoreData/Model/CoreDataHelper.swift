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
    
    class func recordVisitedLoc(name: String)-> Bool{
        let context = getContext()
        let vistedRooms = VisitedRoomsMO(context: context)
        vistedRooms.name = name
        
        do {
            try context.save()
            return true
        }catch{
            print(error.localizedDescription)
            return false
        }
    }
    
    class func clearAllVisitedLoc () -> Bool{
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
    
    
    class func fetchAllVisitedRoomsdData() -> [VisitedRoomsMO]{
            let context = getContext()
            var results: [VisitedRoomsMO] = []
            //let fetch = NSFetchRequest<VisitedRoomsMO>(entityName:"VisitedRoomsMO")
            let fetch = VisitedRoomsMO.createfetchRequest()
            do{
                results = try context.fetch(fetch)
            }catch {
                print(error.localizedDescription)
            }
            return results
        }
    
    class func roomHasBeenVisited(roomName: String) -> Bool {
        let context = getContext()
        var records: [VisitedRoomsMO] = []
        let fetch = VisitedRoomsMO.createfetchRequest()
        fetch.predicate = NSPredicate(format: "name = %@",roomName)
        
        do{
            records = try context.fetch(fetch)
            print(records.count)
            if records.count > 0 {
                return true
            }
        }catch{
            print("something went wrong")
        }
    return false
    }
    
}
