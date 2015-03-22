//
//  CoreDataStack.swift
//  Dog Walk
//
//  Created by Murali Korukonda on 3/3/15.
//  Copyright (c) 2015 Razeware. All rights reserved.
//

import CoreData

class CoreDataStack {
    let context:NSManagedObjectContext
    let psc:NSPersistentStoreCoordinator
    let model:NSManagedObjectModel
    let store:NSPersistentStore?
    
    init(){
        let bundle = NSBundle.mainBundle()
        let modelURL = bundle.URLForResource("Dog Walk", withExtension: "momd")
        model = NSManagedObjectModel(contentsOfURL: modelURL!)
        
        psc = NSPersistentStoreCoordinator(managedObjectModel: model)
        
        context = NSManagedObjectContext()
        context.persistentStoreCoordinator = psc
        
        let documentsURL = applicationDocumentsDirectory()
        let storeURL = documentsURL.URLByAppendingPathComponent("Dog Walk")
        let options = [NSMigratePersistentStoresAutomaticallyOption:true]
        
        var error:NSError? = nil
        store = psc.addPersistentStoreWithType(NSSQLiteStoreType, configuration: nil, URL: storeURL, options: options, error: &error)
        if store == nil{
            println("Error adding persistent store:\(error)")
            abort()
        }
    }
    
    func saveContext() {
        var error: NSError? = nil
        if context.hasChanges && !context.save(&error) {
        println("Could not save: \(error), \(error?.userInfo)")
        }
    }
    
    
    func applicationDocumentsDirectory()->NSURL{
        let fileManager = NSFileManager.defaultManager()
        let urls = fileManager.URLsForDirectory(.DocumentsDirectory,inDomains: .UserDomainMask) as [NSURL]
        return urls[0]
    }
    
}