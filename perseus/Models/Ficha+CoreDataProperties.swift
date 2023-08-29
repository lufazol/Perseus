//
//  Ficha+CoreDataProperties.swift
//  perseus
//
//  Created by Vitor Monzillo on 29/08/23.
//
//

import Foundation
import CoreData


extension Ficha {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Ficha> {
        return NSFetchRequest<Ficha>(entityName: "Ficha")
    }

    @NSManaged public var alergias: String?
    @NSManaged public var cirurgias: String?
    @NSManaged public var createdAt: Date?
    @NSManaged public var doencas: String?
    @NSManaged public var id: UUID?
    @NSManaged public var nascimento: Date?
    @NSManaged public var nome: String?
    @NSManaged public var peso: Int64
    @NSManaged public var sexo: String?
    @NSManaged public var tipoSanguineo: String?
    @NSManaged public var idoso: Idoso?

}

extension Ficha : Identifiable {

}
