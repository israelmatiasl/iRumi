//
//  Group.swift
//  iRumi
//
//  Created by Israel Matias on 6/26/19.
//  Copyright © 2019 Israel Matias. All rights reserved.
//

import Foundation

struct Group: Codable {
    
    var groupId: String?
    var name: String?
    var owner: String?
    var participants: Array<Participant>
    var image: String?
    var active: Bool?
}
