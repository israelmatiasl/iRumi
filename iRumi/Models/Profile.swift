//
//  Profile.swift
//  iRumi
//
//  Created by Israel Matias on 6/26/19.
//  Copyright © 2019 Israel Matias. All rights reserved.
//

import Foundation

struct Profile: Codable {
    var profileId:String?
    var name:String?
    var surname:String?
    var phone:String?
    var gender:String?
    var image:String?
    var description:String?
    var occupation:String?
    var skills:[String]?
    var score:Int?
}
