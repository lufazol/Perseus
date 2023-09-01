//
//  EdicaoMedicamentoView.swift
//  perseus
//
//  Created by Lucas Finzzeto Pavarini on 01/09/23.
//

import SwiftUI

struct EdicaoMedicamentoView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.editMode) private var editMode
    
    @State var medicamento: String = ""
    @State var dosagem: String = ""
    @State var quantidade: String = ""
    @State var tempodedose: String = ""
    @State var observacoes: String = ""
    @State var imagem: String = ""
    
    
    var body: some View {
        VStack{
            Form{
                
                Section{
                    HStack {
                        if editMode?.wrappedValue.isEditing == true {
                            TextField("Nome do Medicamento", text: $medicamento, axis: .vertical)
                                .foregroundColor(.accentColor)
                                .autocorrectionDisabled()
                        } else {
                            if medicamento.isEmpty {
                                Text("Nome do Medicamento")
                                    .foregroundColor(Color.gray)
                            } else {
                                Text(medicamento)
                            }
                        }
                    }
                }
                Section{
                    
                    HStack {
                        if editMode?.wrappedValue.isEditing == true {
                            TextField("Dosagem", text: $dosagem, axis: .vertical)
                                .foregroundColor(.accentColor)
                                .autocorrectionDisabled()
                        } else {
                            if dosagem.isEmpty {
                                Text("Dosagem")
                                    .foregroundColor(Color.gray)
                            } else {
                                Text(dosagem)
                            }
                        }
                    }
                }
                Section{
                    HStack {
                        if editMode?.wrappedValue.isEditing == true {
                            TextField("Quantidade", text: $quantidade, axis: .vertical)
                                .foregroundColor(.accentColor)
                                .autocorrectionDisabled()
                        } else {
                            if quantidade.isEmpty {
                                Text("Quantidade")
                                    .foregroundColor(Color.gray)
                            } else {
                                Text(quantidade)
                            }
                        }
                    }
                    
                }
                Section{
                    HStack {
                        if editMode?.wrappedValue.isEditing == true {
                            TextField("Tempo entre doses", text: $tempodedose, axis: .vertical)
                                .foregroundColor(.accentColor)
                                .autocorrectionDisabled()
                        } else {
                            if tempodedose.isEmpty {
                                Text("Tempo entre doses")
                                    .foregroundColor(Color.gray)
                            } else {
                                Text(tempodedose)
                            }
                        }
                    }
                    
                }
                Section{
                    HStack {
                        if editMode?.wrappedValue.isEditing == true {
                            TextField("Observações", text: $observacoes, axis: .vertical)
                                .foregroundColor(.accentColor)
                                .autocorrectionDisabled()
                                //.lineLimit(5, reservesSpace: true)
                        } else {
                            if observacoes.isEmpty {
                                Text("Observações")
                                    .foregroundColor(Color.gray)
                                    //.lineLimit(5, reservesSpace: true)
                            } else {
                                Text(observacoes)
                            }
                        }
                    }
                    
                }
                
                
                Section{
                    //                    if let data = elder.foto, let uiimage = UIImage(data: data) {
                    //                        Image(uiImage: uiimage)
                    //                            .resizable()
                    //                            .scaledToFill()
                    //                            .frame(width: 200, height: 180)
                    //                            .clipShape(Circle())
                    //                    } else {
                    Image("paracetamol")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 180)
                }
            }
            
        }.onChange(of: editMode!.wrappedValue, perform: { value in
            if !(value.isEditing) {
                //TODO: Alterar infos editadas no Core Data
            }
        })
        .navigationBarTitle("Medicamentos", displayMode: .inline)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading:
                                Button("Cancelar", action: {
            self.presentationMode.wrappedValue.dismiss()
            
        }))
        .navigationBarTitle("Medicamentos")
        .animation(nil, value: editMode?.wrappedValue)
        .toolbar {
            EditButton()
        }
        
    }
    
}


struct EdicaoMedicamentoView_Previews: PreviewProvider {
    static var previews: some View {
        EdicaoMedicamentoView()
    }
}
