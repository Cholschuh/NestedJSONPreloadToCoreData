//
//  AppDelegate.swift
//  NestedJSONPreloadToCoreData
//
//  Created by Chris Holschuh on 2/7/20.
//  Copyright © 2020 Chris Holschuh. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        preloadData()
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }

    // MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
        */
        let container = NSPersistentContainer(name: "NestedJSONPreloadToCoreData")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                 
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support

    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    func preloadData(){
        //Check to see if the preloadedDataKey is set to True if not then it will upload data and mark key as true.
        
        let preloadedDataKey = "didPreloadData"
        let userDefaults = UserDefaults.standard
        
        if userDefaults.bool(forKey: preloadedDataKey) == false {
            //preload
            guard let fileUrl = Bundle.main.path(forResource: "FloorAndRoomData", ofType: "json") else {
                print("Unable to find file, Could not load data.")
                return
            }
            // gets readable URL
            let dataURL = URL(fileURLWithPath: fileUrl)
            
            let backgroundContext = persistentContainer.newBackgroundContext()
            persistentContainer.viewContext.automaticallyMergesChangesFromParent = true
            
            backgroundContext.perform {
                var floors = [floor]()
                var rooms = [room]()
                var photos = [photo]()
                let task = URLSession.shared.dataTask(with: dataURL) { (data, response, error) in
                    
                    if let error = error {
                        print(error)
                        return
                    }
                    
                    if let data = data {
                        //Decodes Json to room objects and stores in the Rooms array of room objets
                        do {
                            floors = try JSONDecoder().decode([floor].self, from: data)
                            for floor in floors{
                                print(floor.name)
                                print(floor.mapImage)
                                for room in floor.rooms{
                                    print(room.name)
                                    for photo in room.photos!{
                                        print(photo.altText)
                                    }
                                }
                                //let floorObject = FloorsMO(context: backgroundContext)
//                                roomObject.name = room.name
//                                roomObject.floor = room.floor
//                                roomObject.information = room.information
//                                roomObject.photo = room.photo
//                                roomObject.beaconMajorVal = room.beaconMajorVal
//                                roomObject.beaconMinorVal = room.beaconMinorVal
//                                roomObject.isVisited = room.isVisited
                            }
                            //try backgroundContext.save()
                        } catch {
                            print(error.localizedDescription)
                        }
                    }
                    
                }
                task.resume()
                //userDefaults.set(true, forKey: preloadedDataKey)
            }
            
        }else{
            //print("Data already loaded")
            
        }
    }

}

