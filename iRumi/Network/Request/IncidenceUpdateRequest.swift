//
//  IncidenceUpdateRequest.swift
//  iRumi
//
//  Created by Israel Matias on 6/27/19.
//  Copyright © 2019 Israel Matias. All rights reserved.
//

import Foundation

struct IncidenceUpdateRequest{
    
    
    var Resolved: Bool?
    var Response: String?
    
    init(resolved:Bool, response:String) {
        self.Resolved = resolved
        self.Response = response
        
    }
}
