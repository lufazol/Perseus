//
//  FichaService.swift
//  perseus
//
//  Created by Vitor Monzillo on 24/08/23.
//

import Foundation

class FichaService: ObservableObject {
    @Published var dadosFicha: Ficha?
    
    let persistence = PersistenceController.shared

    init() {
    }
    //CRUD
    func getDadosDaFicha() -> Ficha? {
        let request = Ficha.fetchRequest()
        
        do {
            let fichas = try persistence.container.viewContext.fetch(request)
            return fichas.first
        } catch {
            print("Erro ao buscar a ficha: \(error)")
            return nil
        }
    }

    func createFicha(nome: String, sexo: String, nascimento: Date, peso: Int64, tipoSanguineo: String, doencas: String, cirurgias: String, alergias: String, image: Data) {
        
        //criando idoso
        let novoIdoso = Idoso(context: persistence.container.viewContext)
        novoIdoso.id = UUID()
        novoIdoso.createdAt = Date()
        novoIdoso.image = image
        
        //criando ficha
        let novaFicha = Ficha(context: persistence.container.viewContext)
        novaFicha.nome = nome
        novaFicha.sexo = sexo
        novaFicha.nascimento = nascimento
        novaFicha.peso = peso
        novaFicha.tipoSanguineo = tipoSanguineo
        novaFicha.doencas = doencas
        novaFicha.cirurgias = cirurgias
        novaFicha.alergias = alergias
        novaFicha.id = UUID()
        novaFicha.createdAt = Date()
        
        // Associando a ficha ao idoso criado
        novoIdoso.ficha = novaFicha
        novaFicha.idoso = novoIdoso
    
        persistence.saveContext()  // Salve as alterações no contexto
    }

    func updateFicha(ficha: Ficha, nome: String, sexo: String, nascimento: Date, peso: Int64, tipoSanguineo: String, doencas: String, cirurgias: String, alergias: String, image: Data) {
        ficha.nome = nome
        ficha.sexo = sexo
        ficha.nascimento = nascimento
        ficha.peso = peso
        ficha.tipoSanguineo = tipoSanguineo
        ficha.doencas = doencas
        ficha.cirurgias = cirurgias
        ficha.alergias = alergias
        ficha.idoso?.image = image
        
        persistence.saveContext()
    }
    
    func deleteFicha(ficha: Ficha) {
        persistence.delete(item: ficha)
    }
    
    func deleteALLFICHAS() {
        let request = Ficha.fetchRequest()
        do {
            let fichas = try persistence.container.viewContext.fetch(request)
            for ficha in fichas {
                deleteFicha(ficha: ficha)
            }
        } catch {
            print("Erro ao buscar fichas para deleção: \(error)")
        }
    }
    
    func getALLFICHAS() -> [Ficha?] {
        let request = Ficha.fetchRequest()
        do {
            let fichas = try persistence.container.viewContext.fetch(request)
            return fichas
        } catch {
            print("Erro ao buscar fichas para deleção: \(error)")
            return [nil]
        }
    }
}
