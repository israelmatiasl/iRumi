//
//  Task.swift
//  iRumi
//
//  Created by Israel Matias on 6/27/19.
//  Copyright © 2019 Israel Matias. All rights reserved.
//

import Foundation

struct Task: Codable {
    var taskId: String?
    var groupName: String?
    var title: String?
    var description: String?
    var responsible: Array<String>?
    var status: String?
    var startAt: Date?
    var modifiedAt: Date?
    var endsAt: Date?
}
