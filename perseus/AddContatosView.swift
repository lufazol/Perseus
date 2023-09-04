//
//  AddContatosView.swift
//  perseus
//
//  Created by Cassiano C Salgado on 01/09/23.
//

import SwiftUI
import PhotosUI

struct AddContatosView: View {
    @Environment(\.dismiss) var dismiss
    
    @State var selectedItems: [PhotosPickerItem] = []

    @ObservedObject var fichaService = FichaService()
    @ObservedObject var contatoService = ContatoService()

    @State private var name: String = ""
    @State private var surname: String = ""
    @State private var phoneNumber: String = ""
    @State private var kinship: String = ""
    @State private var address: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Section {
                        TextField("Nome", text: $name)
                    }
                    
                    Section {
                        TextField("Sobrenome", text: $surname)
                    }
                    
                    Section {
                        TextField("Telefone", text: $phoneNumber)
                    }
                    
                    Section {
                        TextField("Parentesco", text: $kinship)
                    }
                    
                    Section {
                        TextField("Endereço", text: $address)
                    }
                }
            }
            .navigationBarItems(trailing: Button("Salvar") {
                contatoService.createContato(nome: name, sobrenome: surname, telefone: phoneNumber, parentesco: kinship, endereco: address, imagem: Data(), idoso: (fichaService.ficha?.idoso)!)
                contatoService.getContatos()
                dismiss()
                contatoService.getContatos()
            })
            .navigationBarTitle("Contato", displayMode: .inline)
            .navigationBarItems(leading: Button("Cancelar") {
                dismiss()
                contatoService.getContatos()
                }
            )
            .onAppear{
                contatoService.getContatos()
                fichaService.getDadosDaFicha()
            }
        }
    }
}
