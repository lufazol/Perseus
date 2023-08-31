//
//  GlobalData.swift
//  perseus
//
//  Created by Luan Fazolin on 25/08/23.
//

import Foundation
import UIKit


struct DadoBoletim: Identifiable, Equatable {
    let id = UUID()
    var data: Date
    var dados: [String]
    var tag: Int
    
    static var sampleDado = DadoBoletim(data: Date.now, dados: ["120 x 80 mmHg", "124 x 83 mmHg", "113 x 72 mmHg"], tag: 0)
    
    static var sampleDados: [DadoBoletim] = [
        DadoBoletim(data: Date.now, dados: ["120 x 80 mmHg", "124 x 83 mmHg", "113 x 72 mmHg"], tag: 0),
        DadoBoletim(data: Date.now, dados: ["125 x 80 mmHg", "129 x 83 mmHg", "111 x 70 mmHg"], tag: 1),
        DadoBoletim(data: Date.now, dados: ["112 x 70 mmHg", "110 x 83 mmHg", "312 x 190 mmHg"], tag: 2)
    ]
}


class Elder: ObservableObject {
    @Published var nome: String
    @Published var dataDeNascimento: Date
    @Published var sexo: String
    @Published var peso: String
    @Published var tipoSanguineo: String
    @Published var cirurgias: String
    @Published var doencas: String
    @Published var foto: Data?


    init(nome: String, dataDeNascimento: Date, sexo: String, peso: String, tipoSanguineo: String, cirurgias: String, doencas: String, foto: Data?) {
        self.nome = nome
        self.dataDeNascimento = dataDeNascimento
        self.sexo = sexo
        self.peso = peso
        self.tipoSanguineo = tipoSanguineo
        self.cirurgias = cirurgias
        self.doencas = doencas
        self.foto = foto
    }
}

class GlobalElder {
    
    static var shared: GlobalElder = GlobalElder()
    
    private init() {}
    
    var mockedElder: Elder = Elder(
        nome: "",
        dataDeNascimento: Calendar.current.date(from: DateComponents(year: 1950, month: 8, day: 31))!,
        sexo: "Feminino",
        peso: "80.0",
        tipoSanguineo: "A+",
        cirurgias: "",
        doencas: "",
        foto: nil)
}
