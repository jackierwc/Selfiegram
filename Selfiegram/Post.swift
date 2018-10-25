//
//  Post.swift
//  Selfiegram
//
//  Created by Jacqueline Chen on 2018-10-03.
//  Copyright © 2018 Jacqueline Chen. All rights reserved.
//

import Foundation
import UIKit
import Parse

class Post:PFObject, PFSubclassing {
    
    @NSManaged var image:PFFile
    @NSManaged var user:PFUser
    @NSManaged var comment:String
    
    var likes: PFRelation<PFObject>! {
        return relation(forKey: "likes")
    }
    
    static func parseClassName() -> String {
        return "Post"
    }
    
    convenience init(image:PFFile, user:PFUser, comment:String){
        self.init()
        self.image = image
        self.user = user
        self.comment = comment
    }
    
}
