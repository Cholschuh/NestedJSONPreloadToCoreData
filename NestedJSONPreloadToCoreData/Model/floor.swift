//
//  floor.swift
//  NestedJSONPreloadToCoreData
//
//  Created by Chris Holschuh on 2/7/20.
//  Copyright © 2020 Chris Holschuh. All rights reserved.
//

import Foundation
struct floor: Codable{
    var name: String
    var mapImage: String
    var rooms: [room]
}
