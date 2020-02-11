//
//  ViewController.swift
//  NestedJSONPreloadToCoreData
//
//  Created by Chris Holschuh on 2/7/20.
//  Copyright © 2020 Chris Holschuh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // add a record to rooms visted
        coreDataHelper.recordVisitedLoc(name: "Chris's Room")
        
        // Creates a VisitedRoomsMO Object Array
        var visitedRooms: [VisitedRoomsMO] = []
        
        //Call the coreDataHelper to fetch Vis
        visitedRooms = coreDataHelper.fetchAllVisitedRoomsdData()
        print(visitedRooms.count)
        for room in visitedRooms {
            print(room.name!)
        }
        print(coreDataHelper.roomHasBeenVisited(roomName: "Chris's Room"))
        
        //removes all rooms for Visited Rooms
        coreDataHelper.clearAllVisitedLoc()
    }
    
    

}

