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

    @ObservedObject
    private var elder: Elder = GlobalElder.shared.mockedElder

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
                        HStack {
                            Spacer()
                            VStack {
                                if let data = elder.foto, let uiimage = UIImage(data: data) {
                                    Image(uiImage: uiimage)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 200, height: 180)
                                        .clipShape(Circle())
                                } else {
                                    Image("noprofile")
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 200, height: 180)
                                        .clipShape(Circle())
                                }
                                
                                PhotosPicker(
                                    selection: $selectedItems,
                                    maxSelectionCount: 1,
                                    matching: .images
                                ) {
                                    Text("Adicionar foto")
                                }
                                .onChange(of: selectedItems) { newValue in
                                    guard let item = selectedItems.first else {
                                        return
                                    }
                                    item.loadTransferable(type: Data.self) { result in
                                        switch result {
                                        case .success(let data):
                                            if let data = data {
                                                elder.foto = data
                                            } else {
                                                print("Data is nil")
                                            }
                                        case .failure(let failure):
                                            fatalError("\(failure)")
                                        }
                                    }
                                }
                            }
                            Spacer()
                        }
                        .listRowBackground(Color.clear)
                    }
                    
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
                //Add func
                }
            )
            .navigationBarTitle("Contato", displayMode: .inline)
            .navigationBarItems(leading: Button("Cancelar") {
                dismiss()
                }
            )
        }
    }
}

struct AddContatosView_Previews: PreviewProvider {
    static var previews: some View {
        AddContatosView()
    }
}
