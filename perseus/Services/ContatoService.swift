//
//  ContatoService.swift
//  perseus
//
//  Created by Vitor Monzillo on 30/08/23.
//

import Foundation

class ContatoService: ObservableObject {
    @Published var contatos: [Contato]?
    
    let persistence = PersistenceController.shared

    init() {
    }
    //CRUD Contato
    
    func getContatos() {
        let request = Contato.fetchRequest()
        do {
            let contatos = try persistence.container.viewContext.fetch(request)
            self.contatos = contatos
        } catch {
            print("Erro ao buscar contatos: \(error)")
            self.contatos = []
        }
    }

    func createContato(nome: String, sobrenome: String, telefone: String, parentesco: String, endereco: String, imagem: Data, idoso: Idoso) {
        
        //criando contato
        let novoContato = Contato(context: persistence.container.viewContext)
        novoContato.nome = nome
        novoContato.sobrenome = sobrenome
        novoContato.telefone = telefone
        novoContato.parentesco = parentesco
        novoContato.endereco = endereco
        novoContato.imagem = imagem
        novoContato.id = UUID()
        novoContato.createdAt = Date()
        
        // Associando a ficha ao idoso criado
        novoContato.idoso = idoso
    
        persistence.saveContext()  // Salve as alterações no contexto
    }

    func updateContato(contato: Contato, nome: String, sobrenome: String, telefone: String, parentesco: String, endereco: String, imagem: Data) {
        contato.nome = nome
        contato.sobrenome = sobrenome
        contato.telefone = telefone
        contato.parentesco = parentesco
        contato.endereco = endereco
        contato.imagem = imagem
        
        persistence.saveContext()
    }
    
    func deleteContato(contato: Contato) {
        persistence.delete(item: contato)
        persistence.saveContext()
    }
    
    func deleteALLCONTATOS() {
        let request = Contato.fetchRequest()
        do {
            let contatos = try persistence.container.viewContext.fetch(request)
            for contato in contatos {
                deleteContato(contato: contato)
            }
        } catch {
            print("Erro ao buscar contatos para deleção: \(error)")
        }
    }
}
