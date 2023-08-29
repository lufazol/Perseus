//
//  BoletimService.swift
//  perseus
//
//  Created by Vitor Monzillo on 29/08/23.
//

import Foundation

class BoletimService: ObservableObject {
//    @Published var dadosFicha: Ficha?
    
    let persistence = PersistenceController.shared

    init() {
    }
    
    //CRUD Temperatura
    func getTemperaturas() -> [Temperatura?] {
        let request = Temperatura.fetchRequest()
        do {
            let temperaturas = try persistence.container.viewContext.fetch(request)
            return temperaturas
        } catch {
            print("Erro ao buscar temperaturas: \(error)")
            return [nil]
        }
    }

    func createTemperatura(valor: Double, createdAt: Date, id: UUID, idoso: Idoso) {
        //criando temperatura
        let novaTemperatura = Temperatura(context: persistence.container.viewContext)
        novaTemperatura.id = UUID()
        novaTemperatura.createdAt = Date()
        novaTemperatura.idoso = idoso
        novaTemperatura.valor = valor
        
        // Associando a ficha ao idoso criado
        novaTemperatura.idoso = idoso
    
        persistence.saveContext()  // Salve as alterações no contexto
    }
    
    func deleteTemperatura(temperatura: Temperatura) {
        persistence.delete(item: temperatura)
    }
    
    func deleteALLTEMPERATURAS() {
        let request = Temperatura.fetchRequest()
        do {
            let temperaturas = try persistence.container.viewContext.fetch(request)
            for temperatura in temperaturas {
                deleteTemperatura(temperatura: temperatura)
            }
        } catch {
            print("Erro ao deletar temperaturas: \(error)")
        }
    }
    
    //CRUD Pressão
    func getPressoes() -> [Pressao?] {
        let request = Pressao.fetchRequest()
        do {
            let pressoes = try persistence.container.viewContext.fetch(request)
            return pressoes
        } catch {
            print("Erro ao buscar pressoes: \(error)")
            return [nil]
        }
    }

    func createPressao(valor: Double, createdAt: Date, id: UUID, idoso: Idoso) {
        //criando pressao
        let novaPressao = Pressao(context: persistence.container.viewContext)
        novaPressao.id = UUID()
        novaPressao.createdAt = Date()
        novaPressao.idoso = idoso
        novaPressao.valor = valor
        
        // Associando a ficha ao idoso criado
        novaPressao.idoso = idoso
    
        persistence.saveContext()  // Salve as alterações no contexto
    }
    
    func deletePressao(pressao: Pressao) {
        persistence.delete(item: pressao)
    }
    
    func deleteALLPRESSOES() {
        let request = Pressao.fetchRequest()
        do {
            let pressoes = try persistence.container.viewContext.fetch(request)
            for pressao in pressoes {
                deletePressao(pressao: pressao)
            }
        } catch {
            print("Erro ao deletar pressoes: \(error)")
        }
    }
    
    //CRUD Glicemia
    func getGlicemias() -> [Glicemia?] {
        let request = Glicemia.fetchRequest()
        do {
            let glicemias = try persistence.container.viewContext.fetch(request)
            return glicemias
        } catch {
            print("Erro ao buscar glicemias: \(error)")
            return [nil]
        }
    }

    func createGlicemia(valor: Double, createdAt: Date, id: UUID, idoso: Idoso) {
        //criando glicemia
        let novaGlicemia = Glicemia(context: persistence.container.viewContext)
        novaGlicemia.id = UUID()
        novaGlicemia.createdAt = Date()
        novaGlicemia.idoso = idoso
        novaGlicemia.valor = valor
        
        // Associando a glicemia ao idoso
        novaGlicemia.idoso = idoso
    
        persistence.saveContext()  // Salve as alterações no contexto
    }
    
    func deleteGlicemia(glicemia: Glicemia) {
        persistence.delete(item: glicemia)
    }
    
    func deleteALLGLICEMIAS() {
        let request = Glicemia.fetchRequest()
        do {
            let glicemias = try persistence.container.viewContext.fetch(request)
            for glicemia in glicemias {
                deleteGlicemia(glicemia: glicemia)
            }
        } catch {
            print("Erro ao deletar glicemias: \(error)")
        }
    }
    
    //CRUD Peso
    func getPesos() -> [Peso?] {
        let request = Peso.fetchRequest()
        do {
            let pesos = try persistence.container.viewContext.fetch(request)
            return pesos
        } catch {
            print("Erro ao buscar pesos: \(error)")
            return [nil]
        }
    }

    func createPeso(valor: Double, createdAt: Date, id: UUID, idoso: Idoso) {
        //criando peso
        let novoPeso = Peso(context: persistence.container.viewContext)
        novoPeso.id = UUID()
        novoPeso.createdAt = Date()
        novoPeso.idoso = idoso
        novoPeso.valor = valor
        
        // Associando o peso ao idoso
        novoPeso.idoso = idoso
    
        persistence.saveContext()  // Salve as alterações no contexto
    }
    
    func deletePeso(peso: Peso) {
        persistence.delete(item: peso)
    }
    
    func deleteALLPESOS() {
        let request = Peso.fetchRequest()
        do {
            let pesos = try persistence.container.viewContext.fetch(request)
            for peso in pesos {
                deletePeso(peso: peso)
            }
        } catch {
            print("Erro ao deletar pesos: \(error)")
        }
    }
    
    //CRUD Humor
    func getHumores() -> [Humor?] {
        let request = Humor.fetchRequest()
        do {
            let humores = try persistence.container.viewContext.fetch(request)
            return humores
        } catch {
            print("Erro ao buscar humores: \(error)")
            return [nil]
        }
    }

    func createHumor(valor: String, descricao: String, createdAt: Date, id: UUID, idoso: Idoso) {
        //criando humor
        let novoHumor = Humor(context: persistence.container.viewContext)
        novoHumor.id = UUID()
        novoHumor.createdAt = Date()
        novoHumor.idoso = idoso
        novoHumor.valor = valor
        novoHumor.descricao = descricao
        
        // Associando o humor ao idoso
        novoHumor.idoso = idoso
    
        persistence.saveContext()  // Salve as alterações no contexto
    }
    
    func deleteHumor(humor: Humor) {
        persistence.delete(item: humor)
    }
    
    func deleteALLHUMORES() {
        let request = Humor.fetchRequest()
        do {
            let humores = try persistence.container.viewContext.fetch(request)
            for humor in humores {
                deleteHumor(humor: humor)
            }
        } catch {
            print("Erro ao deletar humores: \(error)")
        }
    }
    
    //CRUD Dores
    func getDores() -> [Dores?] {
        let request = Dores.fetchRequest()
        do {
            let dores = try persistence.container.viewContext.fetch(request)
            return dores
        } catch {
            print("Erro ao buscar dores: \(error)")
            return [nil]
        }
    }

    func createDor(valor: String, descricao: String, createdAt: Date, id: UUID, idoso: Idoso) {
        //criando dor
        let novaDor = Dores(context: persistence.container.viewContext)
        novaDor.id = UUID()
        novaDor.createdAt = Date()
        novaDor.idoso = idoso
        novaDor.valor = valor
        novaDor.descricao = descricao
        
        // Associando o dor ao idoso
        novaDor.idoso = idoso
    
        persistence.saveContext()  // Salve as alterações no contexto
    }
    
    func deleteDores(dor: Dores) {
        persistence.delete(item: dor)
    }
    
    func deleteALLDORES() {
        let request = Dores.fetchRequest()
        do {
            let dores = try persistence.container.viewContext.fetch(request)
            for dor in dores {
                deleteDores(dor: dor)
            }
        } catch {
            print("Erro ao deletar dores: \(error)")
        }
    }
    
    //CRUD Lucidez
    func getLucidez() -> [Lucidez?] {
        let request = Lucidez.fetchRequest()
        do {
            let lucidez = try persistence.container.viewContext.fetch(request)
            return lucidez
        } catch {
            print("Erro ao buscar lucidez: \(error)")
            return [nil]
        }
    }

    func createLucidez(valor: String, descricao: String, createdAt: Date, id: UUID, idoso: Idoso) {
        //criando lucidez
        let novaLucidez = Lucidez(context: persistence.container.viewContext)
        novaLucidez.id = UUID()
        novaLucidez.createdAt = Date()
        novaLucidez.idoso = idoso
        novaLucidez.valor = valor
        novaLucidez.descricao = descricao
        
        // Associando o lucidez ao idoso
        novaLucidez.idoso = idoso
    
        persistence.saveContext()  // Salve as alterações no contexto
    }
    
    func deleteLucidez(lucidez: Lucidez) {
        persistence.delete(item: lucidez)
    }
    
    func deleteALLLUCIDEZ() {
        let request = Lucidez.fetchRequest()
        do {
            let lucidezes = try persistence.container.viewContext.fetch(request)
            for lucidez in lucidezes {
                deleteLucidez(lucidez: lucidez)
            }
        } catch {
            print("Erro ao deletar lucidez: \(error)")
        }
    }
    
    
}
