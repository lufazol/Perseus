//
//  FichaService.swift
//  perseus
//
//  Created by Vitor Monzillo on 24/08/23.
//

import Foundation

class FichaService: ObservableObject {
    // save fetched notes for view loading
    @Published var dadosFicha: Ficha
    
    let dataService = PersistenceController.shared

    //states
    @Published var showAlert: Bool = false
    @Published var noteTitle: String = ""
    @Published var noteBody: String = ""
    @Published var noteIsFav: Bool = false

    init() {
        getAllDadosDaFicha()
    }

    func getAllDadosDaFicha() {
        dadosFicha = dataService.read()
    }

    func createFicha() {
        dataService.create(title: noteTitle, body: noteBody, isFavorite: noteIsFav)
        getAllDadosDaFicha()
    }

    func deleteNote(ficha: Ficha) {
        dataService.delete(item: ficha)
        getAllDadosDaFicha()
    }

    func clearStates() {
        showAlert = false
        noteTitle = ""
        noteBody = ""
        noteIsFav = false
    }
}
