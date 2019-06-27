//
//  RoomRequest.swift
//  iRumi
//
//  Created by Miguel Angel cordova on 6/27/19.
//  Copyright © 2019 Israel Matias. All rights reserved.
//

import Foundation
struct RoomRequest: Codable {
    var AccountId : String
    var Title : String
    var Description : String
    var IsFurnished : Bool
    var Price : Int
}
