//
//  Medicamento+CoreDataProperties.swift
//  perseus
//
//  Created by Vitor Monzillo on 04/09/23.
//
//

import Foundation
import CoreData


extension Medicamento {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Medicamento> {
        return NSFetchRequest<Medicamento>(entityName: "Medicamento")
    }

    @NSManaged public var createdAt: Date?
    @NSManaged public var dosagem: String?
    @NSManaged public var id: UUID?
    @NSManaged public var imagem: Data?
    @NSManaged public var intervalo: String?
    @NSManaged public var nome: String?
    @NSManaged public var observacoes: String?
    @NSManaged public var quantidade: String?
    @NSManaged public var ultimaVez: Date?
    @NSManaged public var idoso: Idoso?

}

extension Medicamento : Identifiable {

}
