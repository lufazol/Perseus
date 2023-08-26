//
//  IntroPageModel.swift
//  perseus
//
//  Created by Luan Fazolin on 26/08/23.
//

import Foundation

struct IntroPage: Identifiable, Equatable {
    let id = UUID()
    var name: String
    var description: String
    var imageUrl: String
    var tag: Int
    
    static var samplePage = IntroPage(name: "Prazer, Raimundo!", description: "Controle e organize boletins, medicamentos e informações médicas na palma de sua mão.", imageUrl: "intro1", tag: 0)
    
    static var introPages: [IntroPage] = [
        IntroPage(name: "Prazer, Raimundo!", description: "Controle e organize boletins, medicamentos e informações médicas na palma de sua mão.", imageUrl: "intro1", tag: 0),
        IntroPage(name: "Prazer, Raimundo!", description: "Menos tempo procurando e anotando em diferentes lugares. Mais segurança e tranquilidade ao cuidar de quem precisa de você.", imageUrl: "intro2", tag: 1)
    ]
}
