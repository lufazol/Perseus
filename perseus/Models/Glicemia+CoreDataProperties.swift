//
//  Glicemia+CoreDataProperties.swift
//  perseus
//
//  Created by Vitor Monzillo on 29/08/23.
//
//

import Foundation
import CoreData


extension Glicemia {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Glicemia> {
        return NSFetchRequest<Glicemia>(entityName: "Glicemia")
    }

    @NSManaged public var createdAt: Date?
    @NSManaged public var id: UUID?
    @NSManaged public var valor: Double
    @NSManaged public var idoso: Idoso?

}

extension Glicemia : Identifiable {

}
