//
//  SwiftUIView.swift
//  perseus
//
//  Created by Cassiano C Salgado on 30/08/23.
//

import SwiftUI

struct ContatosList: View {
    @State private var showingSheet = false
    
    @ObservedObject var contatoService = ContatoService()
    @State var contatoSelecionado: Contato?
    
    var body: some View {
        List(contatoService.contatos ?? []) { contato in
            NavigationLink(destination: FichaView()) {
                HStack {
                    Text(contato.nome ?? "Sem nome adicionado")
                }
            }
        }
        .onAppear {
            contatoService.getContatos()
        }
        .navigationTitle("Contatos")
        .navigationBarItems(trailing: Button {
            showingSheet.toggle()
        } label: {
            Image(systemName: "plus")
            
        })
        .sheet(isPresented: $showingSheet) {
            AddContatosView()
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        ContatosList()
            .preferredColorScheme(.light)
    }
}
