//
//  PersistenceController.swift
//  SaveLinks
//
//  Created by Macbook Pro on 28/11/2023.
//

import CoreData

class PersistenceController {
    static let shared = PersistenceController()
    let container: NSPersistentContainer
    let conainerName: String = "LinkCore"

    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: conainerName)

        if inMemory {
            //inMemory
            container.persistentStoreDescriptions.first?.url = URL(fileURLWithPath: "/dev/null")
        }

        container.loadPersistentStores { description, error in
            if let error {
                print("Could not load Core Data persistence stores.", error.localizedDescription)
                fatalError()
            }
        }
    }
    
    func saveIfAnyChangesAreMade() {
        let context = container.viewContext // Return Bool if any changes are made

        if context.hasChanges {
            do {
                try context.save()
            } catch {
                print("Could not save changes to Core Data.", error.localizedDescription)
            }
        }
    }
   
    // Crud
    
    /// Create
    func create(link: URL,title: String) {
        let entity = LinkCore(context: container.viewContext)
        
        entity.id = UUID()
        entity.createAt = Date()
        entity.title = title
        entity.link = link
        
        //Save TO DB
        saveIfAnyChangesAreMade()
    }
    
    /// Read
    func read(predicate: String? = nil, fetchLimit: Int? = nil) -> [LinkCore] {
        var links: [LinkCore] = []
        
        // Intitalse fetch request
        let request = NSFetchRequest<LinkCore>(entityName: conainerName)
      
        
        // Check for predicate
        if let predicate = predicate {
            request.predicate = NSPredicate(format: predicate)
        }
       
        // Check for fetchLimit
        if let fetchLimit = fetchLimit {
            request.fetchLimit = fetchLimit
        }
        
        // Time to fetch
        do {
            links = try container.viewContext.fetch(request)
        } catch {
            print("Error: Could not fetch Links from Core Data")
        }
        return links
    }
    
    /// Update
    func update(entity: LinkCore, title: String? = nil, link: URL? = nil) {
        var hasUpdated = false
        
        if let title = title {
            entity.title = title
            hasUpdated = true
            
        }
        
        if let link = link {
            entity.link = link
            hasUpdated = true
        }
        
        if hasUpdated {
            saveIfAnyChangesAreMade()
        }
    }
    
    ///Delete
    func delete(entity: LinkCore){
        container.viewContext.delete(entity)
        saveIfAnyChangesAreMade()
    }
    
}

