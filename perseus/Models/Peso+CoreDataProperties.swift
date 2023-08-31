//
//  Peso+CoreDataProperties.swift
//  perseus
//
//  Created by Vitor Monzillo on 29/08/23.
//
//

import Foundation
import CoreData


extension Peso {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Peso> {
        return NSFetchRequest<Peso>(entityName: "Peso")
    }

    @NSManaged public var createdAt: Date?
    @NSManaged public var id: UUID?
    @NSManaged public var valor: Double
    @NSManaged public var idoso: Idoso?

}

extension Peso : Identifiable {

}
