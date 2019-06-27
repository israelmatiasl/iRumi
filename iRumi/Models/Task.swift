//
//  Task.swift
//  iRumi
//
//  Created by Israel Matias on 6/27/19.
//  Copyright © 2019 Israel Matias. All rights reserved.
//

import Foundation

struct Task: Codable {
    var accountId: String?
    var groupId: String?
    var title: String?
    var description: String?
    var responsible: Array<String>
    var status: String?
}