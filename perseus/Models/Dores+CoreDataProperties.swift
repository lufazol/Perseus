//
//  Dores+CoreDataProperties.swift
//  perseus
//
//  Created by Vitor Monzillo on 29/08/23.
//
//

import Foundation
import CoreData


extension Dores {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Dores> {
        return NSFetchRequest<Dores>(entityName: "Dores")
    }

    @NSManaged public var descricao: String?
    @NSManaged public var createdAt: Date?
    @NSManaged public var id: UUID?
    @NSManaged public var valor: String?
    @NSManaged public var idoso: Idoso?

}

extension Dores : Identifiable {

}
