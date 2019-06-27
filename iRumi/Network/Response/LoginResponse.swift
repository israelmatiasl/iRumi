//
//  LoginResponse.swift
//  iRumi
//
//  Created by Israel Matias on 6/26/19.
//  Copyright © 2019 Israel Matias. All rights reserved.
//

import Foundation

struct LoginResponse: Codable {
    var profile: Profile?
    var role: String?
    var token: String?
}
