//
//  Pressao+CoreDataProperties.swift
//  perseus
//
//  Created by Vitor Monzillo on 29/08/23.
//
//

import Foundation
import CoreData


extension Pressao {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Pressao> {
        return NSFetchRequest<Pressao>(entityName: "Pressao")
    }

    @NSManaged public var createdAt: Date?
    @NSManaged public var id: UUID?
    @NSManaged public var valor: Double
    @NSManaged public var idoso: Idoso?

}

extension Pressao : Identifiable {

}
