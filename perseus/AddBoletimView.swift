//
//  AddBoletimView.swift
//  perseus
//
//  Created by Luan Fazolin on 30/08/23.
//

import SwiftUI

struct AddBoletimView: View {
    @Environment(\.dismiss) var dismiss
    @State private var register: String = ""

    @ObservedObject var boletimService = BoletimService()
    @ObservedObject var fichaService = FichaService()


    var selecao: String

    var body: some View {
        VStack {
            Form {
                Section {
                    TextField(
                        "Digite o registro aqui",
                        text: $register
                    )
                    .disableAutocorrection(true)
                }
            }

        }
        .onAppear{
            fichaService.getDadosDaFicha()
        }
        .padding(.top, -16)
        .navigationBarTitle("Adicionar \(selecao)", displayMode: .inline)
        .toolbar{
            ToolbarItem(placement: .navigationBarTrailing) {
                Button("Salvar") {
                    if selecao == "temperatura" {
                        if let novoValor = Double(register) {
                            boletimService.createTemperatura(valor: novoValor, idoso: (fichaService.ficha?.idoso)!)
                        }
                        else {
                            boletimService.createTemperatura(valor: 37.5, idoso: (fichaService.ficha?.idoso)!)
                        }
                    }
                    else if selecao == "pressao" {
                        if let novoValor = Double(register) {
                            boletimService.createPressao(valor: novoValor, idoso: (fichaService.ficha?.idoso)!)
                        }
                        else {
                            boletimService.createPressao(valor: 80.0, idoso: (fichaService.ficha?.idoso)!)
                        }
                    }
                    else if selecao == "glicemia" {
                        if let novoValor = Double(register) {
                            boletimService.createGlicemia(valor: novoValor, idoso: (fichaService.ficha?.idoso)!)
                        }
                        else {
                            boletimService.createGlicemia(valor: 37.5, idoso: (fichaService.ficha?.idoso)!)
                        }

                    }
                    else if selecao == "dor" {
                        if register != "" {
                            boletimService.createDor(valor: register, descricao: "", idoso: (fichaService.ficha?.idoso)!)
                        }
                        else {
                            boletimService.createDor(valor: "Muita dor", descricao: "", idoso: (fichaService.ficha?.idoso)!)
                        }
                    }
                    else if selecao == "lucidez" {
                        if register != "" {
                            boletimService.createLucidez(valor: register, descricao: "", idoso: (fichaService.ficha?.idoso)!)
                        }
                        else {
                            boletimService.createLucidez(valor: "Lúcido", descricao: "", idoso: (fichaService.ficha?.idoso)!)
                        }
                    }
                    else if selecao == "humor" {
                        if register != "" {
                            boletimService.createHumor(valor: register, descricao: "", idoso: (fichaService.ficha?.idoso)!)
                        }
                        else {
                            boletimService.createHumor(valor: "Neutro", descricao: "", idoso: (fichaService.ficha?.idoso)!)
                        }
                    }
                    else if selecao == "peso" {
                        if let novoValor = Double(register) {
                            boletimService.createPeso(valor: novoValor, idoso: (fichaService.ficha?.idoso)!)
                        }
                        else {
                            boletimService.createPeso(valor: 80.0, idoso: (fichaService.ficha?.idoso)!)
                        }
                    }
                    dismiss()
                }
            }
            ToolbarItem(placement: .navigationBarLeading) {
                Button("Cancelar") {
                    dismiss()
                }
            }
        }
    }
}

struct AddBoletimView_Previews: PreviewProvider {
    static var previews: some View {
        AddBoletimView( selecao: "teste")
    }
}
