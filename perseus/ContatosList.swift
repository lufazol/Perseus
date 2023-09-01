//
//  SwiftUIView.swift
//  perseus
//
//  Created by Cassiano C Salgado on 30/08/23.
//

import SwiftUI

struct ContatoMock: Identifiable {
  let id : Int
  let name : String
}

var contatoList = [
    ContatoMock(id: 0,name: "João"),
    ContatoMock(id: 1,name: "Pedro"),
    ContatoMock(id: 2,name: "Dra. Sandra"),
    ContatoMock(id: 3,name: "Elisa")
  ]

struct ContatosList: View {
    @State private var showingSheet = false
    
    //    var body: some View {
    //        List(contatoList) { contato in
    //            Button {
    //                    showingSheet.toggle()
    //                } label: {
    //                    Text(contato.name)
    
    
    @ObservedObject var contatoService = ContatoService()
    
    var contatos: [Contato] {
        return self.contatoService.getContatos()
    }
    
    var body: some View {
        List(contatos) { contato in
            NavigationLink(destination: FichaView()) {
                HStack {
                    Text(contato.nome ?? "Sem nome adicionado")
                }
            }
            .navigationTitle("Contatos")
            .navigationBarItems(trailing: Button {
                showingSheet.toggle()
            } label: {
                Image(systemName: "plus")
                
            }
            )
            .sheet(isPresented: $showingSheet) {
                AddContatosView()
            }
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        ContatosList()
            .preferredColorScheme(.light)
    }
}
