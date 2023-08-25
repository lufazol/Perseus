//
//  FichaView.swift
//  perseus
//
//  Created by Luan Fazolin on 24/08/23.
//

import SwiftUI

struct FichaView: View {
    
    let tiposSanguineos = ["A+", "A-", "B+", "B-", "AB+", "AB-", "O+", "O-"]
    let sexos = ["Masculino", "Feminino", "Outro", "Não declarar"]

    @Environment(\.editMode) private var editMode
    @State private var nome = "Amélia"
    @State private var dataDeNascimento = Calendar.current.date(from: DateComponents(year: 1950, month: 8, day: 31))!
    @State private var sexo = "Feminino"
    @State private var peso = 84
    @State private var tipoSanguineo = "O+"
    @State private var cirurgias = "Colostomia, cesárea, abdominoplastia e blefaropastia."
    @State private var doencas = "Diabetes, hipertensão, osteoporose, infecção urinária com frequência."


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
                            TextField("", text: $nome)
                                .labelsHidden()
                                .multilineTextAlignment(.trailing)
                                .foregroundColor(.accentColor)
                        } else {
                            Text(nome)
                        }
                    }
                }

                Section {
                    HStack {
                        Text("Nascimento")
                        Spacer()
                        if editMode?.wrappedValue.isEditing == true {
                            DatePicker("nascimento", selection: $dataDeNascimento, displayedComponents: .date)
                                .labelsHidden()
                        } else {
                            Text(dataDeNascimento.formatted(.dateTime.day().month().year()))
                        }
                    }
                }

                Section {
                    HStack {
                        Text("Sexo")
                        Spacer()
                        if editMode?.wrappedValue.isEditing == true {
                            Picker("", selection: $sexo) {
                                ForEach(sexos, id: \.self) { item in
                                    Text(item)
                                }
                            }
                        } else {
                            Text(sexo)
                        }
                    }
                }

                Section {
                    HStack {
                        Text("Peso")
                        Spacer()
                        if editMode?.wrappedValue.isEditing == true {
                            Picker("", selection: $peso) {
                                ForEach(0..<500) {
                                    Text("\($0) kg")
                                }
                            }
                        } else {
                            Text("\(String(peso)) kg")
                        }
                    }
                }

                Section {
                    HStack {
                        Text("Tipo sanguíneo")
                        Spacer()
                        if editMode?.wrappedValue.isEditing == true {
                            Picker("", selection: $tipoSanguineo) {
                                ForEach(tiposSanguineos, id: \.self) { item in
                                    Text(item)
                                }
                            }
                        } else {
                            Text(tipoSanguineo)
                        }
                    }
                }

                Section {
                    HStack {
                        if editMode?.wrappedValue.isEditing == true {
                            TextField("", text: $cirurgias, axis: .vertical)
                                .foregroundColor(.accentColor)
                        } else {
                            Text(cirurgias)
                        }
                    }
                } header: {
                    Text("Cirurgias")
                }

                Section {
                    HStack {
                        if editMode?.wrappedValue.isEditing == true {
                            TextField("", text: $doencas, axis: .vertical)
                                .foregroundColor(.accentColor)
                        } else {
                            Text(doencas)
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
