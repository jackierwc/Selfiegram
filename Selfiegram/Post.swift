//
//  Post.swift
//  Selfiegram
//
//  Created by Jacqueline Chen on 2018-10-03.
//  Copyright © 2018 Jacqueline Chen. All rights reserved.
//

import Foundation
import UIKit

class Post {
    let imageURL:URL
    let user: User
    let comment: String
    
    init(imageURL:URL, user:User, comment:String) {
        self.imageURL = imageURL
        self.user = user
        self.comment = comment
    }
}
