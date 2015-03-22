//
//  Bow_Ties.swift
//  Bow Ties
//
//  Created by Murali Korukonda on 3/3/15.
//  Copyright (c) 2015 Razeware. All rights reserved.
//

import Foundation
import CoreData

class Bowtie: NSManagedObject {

    @NSManaged var isFavorite: NSNumber
    @NSManaged var lastWorn: NSDate
    @NSManaged var name: String
    @NSManaged var photoData: NSData
    @NSManaged var rating: NSNumber
    @NSManaged var searchKey: String
    @NSManaged var timesWorn: NSNumber
    @NSManaged var tintColor: AnyObject

}
