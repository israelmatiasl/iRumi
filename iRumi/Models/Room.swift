//
//  Room.swift
//  iRumi
//
//  Created by Miguel Angel cordova on 6/27/19.
//  Copyright © 2019 Israel Matias. All rights reserved.
//

import Foundation

struct Room: Codable {
    var roomId: String
    var placeId: String?
    var profile: String?
    var image: String?
    var isOccupied: Bool
    var isFurnished: Bool
    var active: Bool
    var vacatedAt: Date?
    var price: Int
    var title: String?
    var description: String?
}
