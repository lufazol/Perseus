//
//  GlobalData.swift
//  perseus
//
//  Created by Luan Fazolin on 25/08/23.
//

import Foundation
import UIKit

class Elder: ObservableObject {
    @Published var nome: String
    @Published var dataDeNascimento: Date
    @Published var sexo: String
    @Published var peso: Int
    @Published var tipoSanguineo: String
    @Published var cirurgias: String
    @Published var doencas: String


    init(nome: String, dataDeNascimento: Date, sexo: String, peso: Int, tipoSanguineo: String, cirurgias: String, doencas: String) {
        self.nome = nome
        self.dataDeNascimento = dataDeNascimento
        self.sexo = sexo
        self.peso = peso
        self.tipoSanguineo = tipoSanguineo
        self.cirurgias = cirurgias
        self.doencas = doencas
    }
}

class GlobalElder {
    
    static var shared: GlobalElder = GlobalElder()
    
    private init() {}
    
    var mockedElder: Elder = Elder(
        nome: "Amélia Mocker",
        dataDeNascimento: Calendar.current.date(from: DateComponents(year: 1950, month: 8, day: 31))!,
        sexo: "Feminino",
        peso: 86,
        tipoSanguineo: "O+",
        cirurgias: "Colostomia, cesárea, abdominoplastia e blefaropastia.",
        doencas: "Diabetes, hipertensão, osteoporose, infecção urinária com frequência.")
}
