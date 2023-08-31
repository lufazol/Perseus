//
//  Contato+CoreDataProperties.swift
//  perseus
//
//  Created by Vitor Monzillo on 30/08/23.
//
//

import Foundation
import CoreData


extension Contato {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Contato> {
        return NSFetchRequest<Contato>(entityName: "Contato")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var createdAt: Date?
    @NSManaged public var nome: String?
    @NSManaged public var sobrenome: String?
    @NSManaged public var telefone: String?
    @NSManaged public var parentesco: String?
    @NSManaged public var endereco: String?
    @NSManaged public var imagem: Data?
    @NSManaged public var idoso: Idoso?

}

extension Contato : Identifiable {

}
