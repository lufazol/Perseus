//
//  Temperatura+CoreDataProperties.swift
//  perseus
//
//  Created by Vitor Monzillo on 29/08/23.
//
//

import Foundation
import CoreData


extension Temperatura {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Temperatura> {
        return NSFetchRequest<Temperatura>(entityName: "Temperatura")
    }

    @NSManaged public var valor: Double
    @NSManaged public var id: UUID?
    @NSManaged public var createdAt: Date?
    @NSManaged public var idoso: Idoso?

}

extension Temperatura : Identifiable {

}
