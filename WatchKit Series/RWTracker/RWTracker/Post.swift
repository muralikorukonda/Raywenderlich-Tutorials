//
//  Post.swift
//  RWTracker
//
//  Created by Greg Heo on 2014-11-30.
//  Copyright (c) 2014 Razeware LLC. All rights reserved.
//

import Foundation
import CoreData

@objc(Post)
class Post: NSManagedObject {

  @NSManaged var category: String
  @NSManaged var content: String
  @NSManaged var identifier: String
  @NSManaged var link: String
  @NSManaged var timestamp: NSDate
  @NSManaged var title: String

}
