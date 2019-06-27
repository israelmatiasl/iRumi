//
//  Incidence.swift
//  iRumi
//
//  Created by Israel Matias on 6/27/19.
//  Copyright © 2019 Israel Matias. All rights reserved.
//

import Foundation

struct Incidence: Codable {
    
    var incidenceId: String?
    var groupId: String?
    var description: String?
    var profile : Profile
    
    var resolved :Bool?
    
    var isResolved: Bool {
        get {
            return resolved!
        }
        set {
            resolved = true
        }
    }
    
}
