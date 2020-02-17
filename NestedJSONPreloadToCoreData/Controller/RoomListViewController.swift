//
//  RoomListViewController.swift
//  NestedJSONPreloadToCoreData
//
//  Created by Chris Holschuh on 2/16/20.
//  Copyright © 2020 Chris Holschuh. All rights reserved.
//

import UIKit

class RoomListViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var floorObj: FloorsMO?
    var roomObj: RoomsMO?
    var currentIndex: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.reloadData()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
           tableView.reloadData()
           
       }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToRoomDetails" {
            let destinationVC = segue.destination as! RoomDetailsViewController
            destinationVC.roomObj = roomObj
        }
    }
    
}
extension RoomListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return floorObj?.rooms?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "roomNameCell") as? customRoomCell {
            if let room = floorObj?.rooms?[indexPath.row]{
                 cell.configureCell(roomObj: room)
            }
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        currentIndex = indexPath.row
        roomObj = (floorObj?.rooms?[currentIndex])!
        tableView.deselectRow(at: indexPath, animated: true)
        self.performSegue(withIdentifier: "goToRoomDetails", sender: self)
    }
    
}

