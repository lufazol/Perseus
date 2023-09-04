//
//  BoletimService.swift
//  perseus
//
//  Created by Vitor Monzillo on 29/08/23.
//

import Foundation

class BoletimService: ObservableObject {
    @Published var temperaturas: [Temperatura]?
    @Published var pressoes: [Pressao]?
    @Published var glicemias: [Glicemia]?
    @Published var pesos: [Peso]?
    @Published var humores: [Humor]?
    @Published var dores: [Dores]?
    @Published var lucidezes: [Lucidez]?
    
    let persistence = PersistenceController.shared

    init() {
    }
    
    //CRUD Temperatura
    func getTemperaturas() {
        let request = Temperatura.fetchRequest()
        do {
            let temperaturas = try persistence.container.viewContext.fetch(request)
            self.temperaturas = temperaturas
        } catch {
            print("Erro ao buscar temperaturas: \(error)")
            self.temperaturas = []
        }
    }

    func createTemperatura(valor: Double, idoso: Idoso) {
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
        persistence.saveContext()
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
    func getPressoes() {
        let request = Pressao.fetchRequest()
        do {
            let pressoes = try persistence.container.viewContext.fetch(request)
            self.pressoes = pressoes
        } catch {
            print("Erro ao buscar pressoes: \(error)")
            self.pressoes = []
        }
    }

    func createPressao(valor: Double, idoso: Idoso) {
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
        persistence.saveContext()
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
    func getGlicemias() {
        let request = Glicemia.fetchRequest()
        do {
            let glicemias = try persistence.container.viewContext.fetch(request)
            self.glicemias = glicemias
        } catch {
            print("Erro ao buscar glicemias: \(error)")
            self.glicemias = []
        }
    }

    func createGlicemia(valor: Double, idoso: Idoso) {
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
        persistence.saveContext()
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
    func getPesos() {
        let request = Peso.fetchRequest()
        do {
            let pesos = try persistence.container.viewContext.fetch(request)
            self.pesos = pesos
        } catch {
            print("Erro ao buscar pesos: \(error)")
            self.pesos = []
        }
    }

    func createPeso(valor: Double, idoso: Idoso) {
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
        persistence.saveContext()
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
    func getHumores(){
        let request = Humor.fetchRequest()
        do {
            let humores = try persistence.container.viewContext.fetch(request)
            self.humores = humores
        } catch {
            print("Erro ao buscar humores: \(error)")
            self.humores = []
        }
    }

    func createHumor(valor: String, descricao: String, idoso: Idoso) {
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
        persistence.saveContext()
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
    func getDores(){
        let request = Dores.fetchRequest()
        do {
            let dores = try persistence.container.viewContext.fetch(request)
            self.dores = dores
        } catch {
            print("Erro ao buscar dores: \(error)")
            self.dores = []
        }
    }

    func createDor(valor: String, descricao: String, idoso: Idoso) {
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
        persistence.saveContext()
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
    func getLucidez() {
        let request = Lucidez.fetchRequest()
        do {
            let lucidez = try persistence.container.viewContext.fetch(request)
            self.lucidezes = lucidez
        } catch {
            print("Erro ao buscar lucidez: \(error)")
            self.lucidezes = []
        }
    }

    func createLucidez(valor: String, descricao: String, idoso: Idoso) {
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
        persistence.saveContext()
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
