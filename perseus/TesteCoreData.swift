//
//  TesteCoreData.swift
//  perseus
//
//  Created by Vitor Monzillo on 25/08/23.
//

import SwiftUI

struct TesteCoreData: View {
    @State private var nome = ""
    @State private var sexo = ""
    @State private var nascimento = Date()
    @State private var peso = ""
    @State private var tipoSanguineo = ""
    @State private var doencas = ""
    @State private var cirurgias = ""
    @State private var alergias = ""
    @State private var createdFichaUUID: UUID? = nil
    @State private var image: UIImage?
    
    @ObservedObject var fichaService = FichaService()
    
    var body: some View {
        VStack {
            TextField("Nome", text: $nome)
            TextField("Sexo", text: $sexo)
            DatePicker("Nascimento", selection: $nascimento)
            TextField("Peso", text: $peso)
            TextField("Tipo Sanguíneo", text: $tipoSanguineo)
            TextField("Doenças", text: $doencas)
            TextField("Cirurgias", text: $cirurgias)
            TextField("Alergias", text: $alergias)
            // Picker de imagem
            
            Button("Criar Ficha") {
                if let ficha = fichaService.getDadosDaFicha() {
                    fichaService.updateFicha(ficha: ficha, nome: nome, sexo: sexo, nascimento: nascimento, peso: Int64(peso) ?? 0, tipoSanguineo: tipoSanguineo, doencas: doencas, cirurgias: cirurgias, alergias: alergias, image: (image?.jpegData(compressionQuality: 1.0)!)!)
                } else {
                    let newFichaUUID = UUID()
                    fichaService.createFicha(
                        nome: nome,
                        sexo: sexo,
                        nascimento: nascimento,
                        peso: Int64(peso) ?? 0,
                        tipoSanguineo: tipoSanguineo,
                        doencas: doencas,
                        cirurgias: cirurgias,
                        alergias: alergias,
                        id: newFichaUUID,
                        createdAt: Date(),
                        image: (image?.jpegData(compressionQuality: 1.0)!)!
                    )
                    createdFichaUUID = newFichaUUID
                }
            }
            
            Button("Buscar Ficha") {
                if let ficha = fichaService.getDadosDaFicha() {
                    print("Ficha encontrada:")
                    print(ficha.nome!)
                } else {
                    print("Ficha não encontrada")
                }
            }

        }
        .padding()
    }
}



struct TesteCoreData_Previews: PreviewProvider {
    static var previews: some View {
        TesteCoreData()
    }
}
