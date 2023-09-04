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
    
    @ObservedObject var medicamentoService = MedicamentoService()
    
    var medicamentoSelecionado: Medicamento
    
    @State var nome: String = ""
    @State var dosagem: String = ""
    @State var quantidade: String = ""
    @State var tempodedose: String = ""
    @State var observacoes: String = ""
    
    
    var body: some View {
        VStack{
            Form{
                
                Section{
                    HStack {
                        if editMode?.wrappedValue.isEditing == true {
                            TextField("Nome do Medicamento", text: $nome, axis: .vertical)
                                .foregroundColor(.accentColor)
                                .autocorrectionDisabled()
                        } else {
                            if nome.isEmpty {
                                Text("Nome do Medicamento")
                                    .foregroundColor(Color.gray)
                            } else {
                                Text(nome)
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
                
                Section {
                    Button(action: {
                        medicamentoService.getMedicamentos()
                        medicamentoService.deleteMedicamento(medicamento: medicamentoSelecionado)
                    }) {
                        HStack {
                            Spacer()
                            Text("Apagar medicamento")
                                .foregroundColor(.red)
                            Spacer()
                        }

                    }
                    .background(Color.white)
                    .cornerRadius(10)
                }

            }
            
        }.onChange(of: editMode?.wrappedValue.isEditing, perform: { isEditing in
            if !isEditing! {
                medicamentoService.updateMedicamento(medicamento: medicamentoSelecionado, nome: nome, dosagem: dosagem, quantidade: quantidade, ultimaVez: Date(), intervalo: tempodedose, observacoes: observacoes)
            }
            medicamentoService.getMedicamentos()
        })
        .navigationBarTitle("Medicamentos", displayMode: .inline)
        .animation(nil, value: editMode?.wrappedValue)
        .toolbar {
            EditButton()
        }
        .onAppear{
            medicamentoService.getMedicamentos()
            nome = medicamentoSelecionado.nome ?? ""
            dosagem = medicamentoSelecionado.dosagem ?? ""
            tempodedose = medicamentoSelecionado.intervalo ?? ""
            observacoes = medicamentoSelecionado.observacoes ?? ""
            quantidade = medicamentoSelecionado.quantidade ?? ""
        }
        
    }
    
}


//struct EdicaoMedicamentoView_Previews: PreviewProvider {
//    static var previews: some View {
//        EdicaoMedicamentoView()
//    }
//}
