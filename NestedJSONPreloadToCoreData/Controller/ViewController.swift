//
//  ViewController.swift
//  NestedJSONPreloadToCoreData
//
//  Created by Chris Holschuh on 2/7/20.
//  Copyright © 2020 Chris Holschuh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var visitedRooms: [VisitedRoomsMO] = []
    var floorObjects: [FloorsMO] = []
    var currentIndex: Int = 0
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ///Adds Room to VisitedRoomMO Entity
        coreDataHelper.recordVisitedLoc(name: "Chris's Room")
        ///Call the coreDataHelper to fetch Visited Rooms and Prints them
        visitedRooms = coreDataHelper.fetchAllVisitedRoomsdData()
        print(visitedRooms.count)
        for room in visitedRooms {
            print(room.name!)
        }
        ///Returns Bool on whether a room has been visited or not
        print(coreDataHelper.roomHasBeenVisited(roomName: "Chris's Room"))
        
        ///removes all rooms for VisitedRoomsMO Entity
        coreDataHelper.clearAllVisitedLoc()
        
        //print(coreDataHelper.getAllRooms())
    }
    
    override func viewWillAppear(_ animated: Bool) {
        floorObjects = coreDataHelper.getFloorObject()
        tableView.reloadData()
    }
    

}
extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return floorObjects.count
    }

   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "floorNameCell") as? customFloorCell {
            cell.configureCell(floorObj: floorObjects[indexPath.row])
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
         return 80
     }

     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         currentIndex = indexPath.row
         tableView.deselectRow(at: indexPath, animated: true)
         //self.performSegue(withIdentifier: "goTo", sender: self)
     }
}

