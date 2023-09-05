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
    
    @State private var selecaoPeso = "70.0"
    @State private var selecaoGlicemia = "70"
    @State private var selecaoPressao = "120.80"
    @State private var selecaoTemperatura = "37.5"


    @State private var selecaoHumor = "Neutro"
    let humores = ["Péssimo", "Ruim", "Neutro", "Bom", "Ótimo"]

    @State private var selecaoLucidez = "Neutro"
    let lucidezes = ["Muito confuso", "Pouco confuso", "Neutro", "Lúcido", "Muito lúcido"]

    @State private var selecaoDor = "Sem dor"
    let dores = ["Muita dor", "Dor moderada", "Pouca dor", "Sem dor"]

    var arrayTemperatura: [String] {
        var array: [String] = []
        var currentValue: Double = 35.0
        while currentValue <= 45.0 {
            array.append(String(format: "%.1f", currentValue))
            currentValue += 0.1
        }
        return array
    }

    var arrayPressao: [String] {
        var array: [String] = []
        var currentValue: Double = 90.60
        while currentValue <= 200.90 {
            array.append(String(format: "%.2f", currentValue))
            currentValue += 0.10
        }
        return array
    }

    var arrayGlicemia: [String] {
        var array: [String] = []
        var currentValue: Int64 = 40
        while currentValue <= 200 {
            array.append(String(currentValue))
            currentValue += 1
        }
        return array
    }
    
    var arrayPeso: [String] {
        var array: [String] = []
        var currentValue: Double = 35.0
        while currentValue <= 500.0 {
            array.append(String(currentValue))
            currentValue += 0.5
        }
        return array
    }

    var selecao: String
    var titulo: String

    var body: some View {
        VStack {
            Form {
                Section {
                    if selecao == "temperatura" {
                        Picker("Em °C", selection: $selecaoTemperatura) {
                            ForEach(arrayTemperatura, id: \.self){ item in
                                Text(item)
                            }
                        }
                    }
                    else if selecao == "pressao" {
                        Picker("Em mmHg", selection: $selecaoPressao) {
                            ForEach(arrayPressao, id: \.self){ item in
                                Text(item)
                            }
                        }
                    }
                    else if selecao == "glicemia" {
                        Picker("Em mg/dl", selection: $selecaoGlicemia) {
                            ForEach(arrayGlicemia, id: \.self){ item in
                                Text(item)
                            }
                        }
                    }
                    else if selecao == "peso" {
                        Picker("Em kg", selection: $selecaoPeso) {
                            ForEach(arrayPeso, id: \.self){ item in
                                Text(item)
                            }
                        }
                    }
                    else if selecao == "dor" {
                        Picker("Em nível de dor", selection: $selecaoDor) {
                            ForEach(dores, id: \.self){ item in
                                Text(item)
                            }
                        }
                    }
                    else if selecao == "lucidez" {
                        Picker("Em nível de lucidez", selection: $selecaoLucidez) {
                            ForEach(lucidezes, id: \.self){ item in
                                Text(item)
                            }
                        }
                    }
                    else if selecao == "humor" {
                        Picker("Em nível de humor", selection: $selecaoHumor) {
                            ForEach(humores, id: \.self){ item in
                                Text(item)
                            }
                        }
                    }
                }
            }

        }
        .onAppear{
            fichaService.getDadosDaFicha()
        }
        .padding(.top, -16)
        .navigationBarTitle("Adicionar \(titulo)", displayMode: .inline)
        .toolbar{
            ToolbarItem(placement: .navigationBarTrailing) {
                Button("Salvar") {
                    if selecao == "temperatura" {
                        if let novoValor = Double(selecaoTemperatura) {
                            boletimService.createTemperatura(valor: novoValor, idoso: (fichaService.ficha?.idoso)!)
                        }
                        else {
                            boletimService.createTemperatura(valor: 37.5, idoso: (fichaService.ficha?.idoso)!)
                        }
                    }
                    else if selecao == "pressao" {
                        if let novoValor = Double(selecaoPressao) {
                            boletimService.createPressao(valor: novoValor, idoso: (fichaService.ficha?.idoso)!)
                        }
                        else {
                            boletimService.createPressao(valor: 80.0, idoso: (fichaService.ficha?.idoso)!)
                        }
                    }
                    else if selecao == "glicemia" {
                        if let novoValor = Double(selecaoGlicemia) {
                            boletimService.createGlicemia(valor: Double(novoValor), idoso: (fichaService.ficha?.idoso)!)
                        }
                        else {
                            boletimService.createGlicemia(valor: 37.5, idoso: (fichaService.ficha?.idoso)!)
                        }

                    }
                    else if selecao == "dor" {
                        if selecaoDor != "" {
                            boletimService.createDor(valor: selecaoDor, descricao: "", idoso: (fichaService.ficha?.idoso)!)
                        }
                        else {
                            boletimService.createDor(valor: "Muita dor", descricao: "", idoso: (fichaService.ficha?.idoso)!)
                        }
                    }
                    else if selecao == "lucidez" {
                        if selecaoLucidez != "" {
                            boletimService.createLucidez(valor: selecaoLucidez, descricao: "", idoso: (fichaService.ficha?.idoso)!)
                        }
                        else {
                            boletimService.createLucidez(valor: "Lúcido", descricao: "", idoso: (fichaService.ficha?.idoso)!)
                        }
                    }
                    else if selecao == "humor" {
                        if selecaoHumor != "" {
                            boletimService.createHumor(valor: selecaoHumor, descricao: "", idoso: (fichaService.ficha?.idoso)!)
                        }
                        else {
                            boletimService.createHumor(valor: "Neutro", descricao: "", idoso: (fichaService.ficha?.idoso)!)
                        }
                    }
                    else if selecao == "peso" {
                        if let novoValor = Double(selecaoPeso) {
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
        AddBoletimView( selecao: "teste", titulo: "teste")
    }
}
