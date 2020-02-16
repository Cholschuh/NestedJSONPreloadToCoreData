//
//  customFloorsCell.swift
//  NestedJSONPreloadToCoreData
//
//  Created by Chris Holschuh on 2/16/20.
//  Copyright © 2020 Chris Holschuh. All rights reserved.
//

import Foundation
import UIKit

class customFloorCell: UITableViewCell {
    @IBOutlet weak var cellLabel: UILabel!
    
    func configureCell(floorObj: FloorsMO){
        cellLabel.text = floorObj.name
    }
    
}
