//
//  Humor+CoreDataProperties.swift
//  perseus
//
//  Created by Vitor Monzillo on 29/08/23.
//
//

import Foundation
import CoreData


extension Humor {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Humor> {
        return NSFetchRequest<Humor>(entityName: "Humor")
    }

    @NSManaged public var createdAt: Date?
    @NSManaged public var id: UUID?
    @NSManaged public var valor: String?
    @NSManaged public var descricao: String?
    @NSManaged public var idoso: Idoso?

}

extension Humor : Identifiable {

}
