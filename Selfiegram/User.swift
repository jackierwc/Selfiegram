//
//  User.swift
//  Selfiegram
//
//  Created by Jacqueline Chen on 2018-10-03.
//  Copyright © 2018 Jacqueline Chen. All rights reserved.
//

import Foundation
import UIKit

class User {
    let username: String
    let profileImage: UIImage
    
    init(aUsername:String, aProfileImage: UIImage) {
        username = aUsername
        profileImage = aProfileImage
    }
}
