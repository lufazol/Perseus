//
//  SwiftUIView.swift
//  perseus
//
//  Created by Cassiano C Salgado on 30/08/23.
//

import SwiftUI

struct Contato: Identifiable {
  let id : Int
  let name : String
}

var contatoList = [
    Contato(id: 0,name: "João"),
    Contato(id: 1,name: "Pedro"),
    Contato(id: 2,name: "Dra. Sandra"),
    Contato(id: 3,name: "Elisa")
  ]

struct ContatosList: View {
    var body: some View {
        List(contatoList) { contato in
            NavigationLink(destination: FichaView()) {
                HStack {
                  Text(contato.name)
                }
            }
        }
        .navigationTitle("Contatos")
        .navigationBarItems(trailing:
            NavigationLink(destination: FichaView()) {
                Image(systemName: "plus")
            }
        )
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        ContatosList()
            .preferredColorScheme(.light)
    }
}
