//
//  Activity.swift
//  Selfiegram
//
//  Created by Jacqueline Chen on 2018-10-24.
//  Copyright © 2018 Jacqueline Chen. All rights reserved.
//

import Foundation
import Parse

class Activity:PFObject, PFSubclassing {
    
    @NSManaged var type:String
    @NSManaged var post:Post
    @NSManaged var user:PFUser
    
    static func parseClassName() -> String {
        return "Activity"
    }
    
    convenience init(type:String, post:Post, user:PFUser){
        self.init()
        self.type = type
        self.post = post
        self.user = user
    }
    
}
