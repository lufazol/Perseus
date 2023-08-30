//
//  MedicamentoService.swift
//  perseus
//
//  Created by Vitor Monzillo on 30/08/23.
//

import Foundation

class MedicamentoService: ObservableObject {
    @Published var medicamentos: [Medicamento]?
    
    let persistence = PersistenceController.shared

    init() {
    }
    //CRUD Medicamento
    
    func getMedicamentos() -> [Medicamento?] {
        let request = Medicamento.fetchRequest()
        do {
            let medicamentos = try persistence.container.viewContext.fetch(request)
            return medicamentos
        } catch {
            print("Erro ao buscar medicamentos: \(error)")
            return [nil]
        }
    }

    func createMedicamento(nome: String, dosagem: String, quantidade: String, ultimaVez: Date, intervalo: Int64, observacoes: String, imagem: Data, idoso: Idoso) {
        
        //criando medicamento
        let novoMed = Medicamento(context: persistence.container.viewContext)
        novoMed.nome = nome
        novoMed.dosagem = dosagem
        novoMed.quantidade = quantidade
        novoMed.ultimaVez = ultimaVez
        novoMed.intervalo = intervalo
        novoMed.observacoes = observacoes
        novoMed.imagem = imagem
        novoMed.id = UUID()
        novoMed.createdAt = Date()
        
        // Associando a ficha ao idoso criado
        novoMed.idoso = idoso
    
        persistence.saveContext()  // Salve as alterações no contexto
    }

    func updateMedicamento(medicamento: Medicamento, nome: String, dosagem: String, quantidade: String, ultimaVez: Date, intervalo: Int64, observacoes: String, imagem: Data) {
        medicamento.nome = nome
        medicamento.dosagem = dosagem
        medicamento.quantidade = quantidade
        medicamento.ultimaVez = ultimaVez
        medicamento.intervalo = intervalo
        medicamento.observacoes = observacoes
        medicamento.imagem = imagem
        
        persistence.saveContext()
    }
    
    func deleteMedicamento(medicamento: Medicamento) {
        persistence.delete(item: medicamento)
    }
    
    func deleteALLMEDICAMENTOS() {
        let request = Medicamento.fetchRequest()
        do {
            let medicamentos = try persistence.container.viewContext.fetch(request)
            for medicamento in medicamentos {
                deleteMedicamento(medicamento: medicamento)
            }
        } catch {
            print("Erro ao buscar medicamentos para deleção: \(error)")
        }
    }
}
