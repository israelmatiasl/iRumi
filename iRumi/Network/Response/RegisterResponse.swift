//
//  RegisterResponse.swift
//  iRumi
//
//  Created by Israel Matias on 6/26/19.
//  Copyright © 2019 Israel Matias. All rights reserved.
//

import Foundation

struct RegisterResponse: Codable {
    var success: Bool
    var name: String
    var gender: String
}

