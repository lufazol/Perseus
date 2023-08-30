//
//  Medicamento+CoreDataProperties.swift
//  perseus
//
//  Created by Vitor Monzillo on 30/08/23.
//
//

import Foundation
import CoreData


extension Medicamento {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Medicamento> {
        return NSFetchRequest<Medicamento>(entityName: "Medicamento")
    }

    @NSManaged public var createdAt: Date?
    @NSManaged public var id: UUID?
    @NSManaged public var nome: String?
    @NSManaged public var dosagem: String?
    @NSManaged public var ultimaVez: Date?
    @NSManaged public var intervalo: Int64
    @NSManaged public var observacoes: String?
    @NSManaged public var imagem: Data?
    @NSManaged public var idoso: Idoso?
    @NSManaged public var quantidade: String?

}

extension Medicamento : Identifiable {

}
