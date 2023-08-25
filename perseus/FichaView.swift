//
//  FichaView.swift
//  perseus
//
//  Created by Luan Fazolin on 24/08/23.
//

import SwiftUI

struct FichaView: View {
    
    // set lists used on pickers
    let tiposSanguineos = ["A+", "A-", "B+", "B-", "AB+", "AB-", "O+", "O-"]
    let sexos = ["Masculino", "Feminino", "Outro", "Não declarar"]

    @Environment(\.editMode) private var editMode
    
    
    // States are commented so that they might be used when core data is implemented
    /*
    @State private var nome = GlobalElder.shared.mockedElder.nome
    @State private var dataDeNascimento = GlobalElder.shared.mockedElder.dataDeNascimento
    @State private var sexo = GlobalElder.shared.mockedElder.sexo
    @State private var peso = GlobalElder.shared.mockedElder.peso
    @State private var tipoSanguineo = GlobalElder.shared.mockedElder.tipoSanguineo
    @State private var cirurgias = GlobalElder.shared.mockedElder.cirurgias
    @State private var doencas = GlobalElder.shared.mockedElder.doencas
    */
    
    @ObservedObject
    private var elder: Elder = GlobalElder.shared.mockedElder

    var body: some View {
        VStack {
            Form {
                Section {
                    HStack {
                        Spacer()
                        VStack {
                           Image("amelia")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 200, height: 180)
                                .clipShape(Circle())
                                
                        }
                        Spacer()
                    }
                }
                .listRowBackground(Color.clear)
                
                Section {
                    HStack {
                        Text("Nome do idoso")
                        Spacer()
                        if editMode?.wrappedValue.isEditing == true {
                            TextField("", text: $elder.nome)
                                .labelsHidden()
                                .multilineTextAlignment(.trailing)
                                .foregroundColor(.accentColor)
                        } else {
                            Text(elder.nome)
                        }
                    }
                }

                Section {
                    HStack {
                        Text("Nascimento")
                        Spacer()
                        if editMode?.wrappedValue.isEditing == true {
                            DatePicker("nascimento", selection: $elder.dataDeNascimento, displayedComponents: .date)
                                .labelsHidden()
                        } else {
                            Text(elder.dataDeNascimento.formatted(.dateTime.day().month().year()))
                        }
                    }
                }

                Section {
                    HStack {
                        Text("Sexo")
                        Spacer()
                        if editMode?.wrappedValue.isEditing == true {
                            Picker("", selection: $elder.sexo) {
                                ForEach(sexos, id: \.self) { item in
                                    Text(item)
                                }
                            }
                        } else {
                            Text(elder.sexo)
                        }
                    }
                }

                Section {
                    HStack {
                        Text("Peso")
                        Spacer()
                        if editMode?.wrappedValue.isEditing == true {
                            Picker("", selection: $elder.peso) {
                                ForEach(0..<500) {
                                    Text("\($0) kg")
                                }
                            }
                        } else {
                            Text("\(String(elder.peso)) kg")
                        }
                    }
                }

                Section {
                    HStack {
                        Text("Tipo sanguíneo")
                        Spacer()
                        if editMode?.wrappedValue.isEditing == true {
                            Picker("", selection: $elder.tipoSanguineo) {
                                ForEach(tiposSanguineos, id: \.self) { item in
                                    Text(item)
                                }
                            }
                        } else {
                            Text(elder.tipoSanguineo)
                        }
                    }
                }

                Section {
                    HStack {
                        if editMode?.wrappedValue.isEditing == true {
                            TextField("", text: $elder.cirurgias, axis: .vertical)
                                .foregroundColor(.accentColor)
                        } else {
                            Text(elder.cirurgias)
                        }
                    }
                } header: {
                    Text("Cirurgias")
                }

                Section {
                    HStack {
                        if editMode?.wrappedValue.isEditing == true {
                            TextField("", text: $elder.doencas, axis: .vertical)
                                .foregroundColor(.accentColor)
                        } else {
                            Text(elder.doencas)
                        }
                    }
                } header: {
                    Text("Doenças")
                }
            }
        }
        .navigationBarTitle("Ficha médica")
        .animation(nil, value: editMode?.wrappedValue)
        .toolbar {
            EditButton()
        }
    }
}

struct FichaView_Previews: PreviewProvider {
    static var previews: some View {
        FichaView()
    }
}
