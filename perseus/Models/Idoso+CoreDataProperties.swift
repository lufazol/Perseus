//
//  Idoso+CoreDataProperties.swift
//  perseus
//
//  Created by Vitor Monzillo on 29/08/23.
//
//

import Foundation
import CoreData


extension Idoso {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Idoso> {
        return NSFetchRequest<Idoso>(entityName: "Idoso")
    }

    @NSManaged public var createdAt: Date?
    @NSManaged public var id: UUID?
    @NSManaged public var ficha: Ficha?
    @NSManaged public var temperatura: NSSet?
    @NSManaged public var glicemia: NSSet?
    @NSManaged public var pressao: NSSet?
    @NSManaged public var peso: NSSet?
    @NSManaged public var humor: NSSet?
    @NSManaged public var dores: NSSet?
    @NSManaged public var lucidez: NSSet?
    @NSManaged public var image: Data?

}

// MARK: Generated accessors for temperatura
extension Idoso {

    @objc(addTemperaturaObject:)
    @NSManaged public func addToTemperatura(_ value: Temperatura)

    @objc(removeTemperaturaObject:)
    @NSManaged public func removeFromTemperatura(_ value: Temperatura)

    @objc(addTemperatura:)
    @NSManaged public func addToTemperatura(_ values: NSSet)

    @objc(removeTemperatura:)
    @NSManaged public func removeFromTemperatura(_ values: NSSet)

}

// MARK: Generated accessors for glicemia
extension Idoso {

    @objc(addGlicemiaObject:)
    @NSManaged public func addToGlicemia(_ value: Glicemia)

    @objc(removeGlicemiaObject:)
    @NSManaged public func removeFromGlicemia(_ value: Glicemia)

    @objc(addGlicemia:)
    @NSManaged public func addToGlicemia(_ values: NSSet)

    @objc(removeGlicemia:)
    @NSManaged public func removeFromGlicemia(_ values: NSSet)

}

// MARK: Generated accessors for pressao
extension Idoso {

    @objc(addPressaoObject:)
    @NSManaged public func addToPressao(_ value: Pressao)

    @objc(removePressaoObject:)
    @NSManaged public func removeFromPressao(_ value: Pressao)

    @objc(addPressao:)
    @NSManaged public func addToPressao(_ values: NSSet)

    @objc(removePressao:)
    @NSManaged public func removeFromPressao(_ values: NSSet)

}

// MARK: Generated accessors for peso
extension Idoso {

    @objc(addPesoObject:)
    @NSManaged public func addToPeso(_ value: Peso)

    @objc(removePesoObject:)
    @NSManaged public func removeFromPeso(_ value: Peso)

    @objc(addPeso:)
    @NSManaged public func addToPeso(_ values: NSSet)

    @objc(removePeso:)
    @NSManaged public func removeFromPeso(_ values: NSSet)

}

// MARK: Generated accessors for humor
extension Idoso {

    @objc(addHumorObject:)
    @NSManaged public func addToHumor(_ value: Humor)

    @objc(removeHumorObject:)
    @NSManaged public func removeFromHumor(_ value: Humor)

    @objc(addHumor:)
    @NSManaged public func addToHumor(_ values: NSSet)

    @objc(removeHumor:)
    @NSManaged public func removeFromHumor(_ values: NSSet)

}

// MARK: Generated accessors for dores
extension Idoso {

    @objc(addDoresObject:)
    @NSManaged public func addToDores(_ value: Dores)

    @objc(removeDoresObject:)
    @NSManaged public func removeFromDores(_ value: Dores)

    @objc(addDores:)
    @NSManaged public func addToDores(_ values: NSSet)

    @objc(removeDores:)
    @NSManaged public func removeFromDores(_ values: NSSet)

}

// MARK: Generated accessors for lucidez
extension Idoso {

    @objc(addLucidezObject:)
    @NSManaged public func addToLucidez(_ value: Lucidez)

    @objc(removeLucidezObject:)
    @NSManaged public func removeFromLucidez(_ value: Lucidez)

    @objc(addLucidez:)
    @NSManaged public func addToLucidez(_ values: NSSet)

    @objc(removeLucidez:)
    @NSManaged public func removeFromLucidez(_ values: NSSet)

}

extension Idoso : Identifiable {

}
