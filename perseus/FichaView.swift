//
//  FichaView.swift
//  perseus
//
//  Created by Luan Fazolin on 24/08/23.
//
import PhotosUI
import SwiftUI

struct FichaView: View {
    @State var selectedItems: [PhotosPickerItem] = []
    @State var isExitingUpdated: Bool = false

    // set lists used on pickers
    let tiposSanguineos = ["A+", "A-", "B+", "B-", "AB+", "AB-", "O+", "O-"]
    let sexos = ["Masculino", "Feminino", "Outro", "Não declarar"]
    var currentValue: Float = 0.0
    var weightArray: [String] {
        var array: [String] = []
        var currentValue: Int64 = 0
        
        while currentValue <= 500 {
            array.append(String(currentValue))
            currentValue += 1
        }
        
        return array
    }

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
                            
                            if editMode?.wrappedValue.isEditing == true {
                                PhotosPicker(
                                    selection: $selectedItems,
                                    maxSelectionCount: 1,
                                    matching: .images
                                ) {
                                    if elder.foto == nil {
                                        Text("Adicionar foto")
                                    } else {
                                        Text("Trocar foto")
                                    }
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
                        Text("Peso (kg)")
                        Spacer()
                        if editMode?.wrappedValue.isEditing == true {
                            Picker("", selection: $elder.peso) {
                                ForEach(weightArray, id: \.self){ item in
                                    Text(item)
                                }
                            }
                        } else {
                            Text("\(String(elder.peso))")
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
                            TextField("Adicione as cirurgias", text: $elder.cirurgias, axis: .vertical)
                                .foregroundColor(.accentColor)
                        } else {
                            if elder.cirurgias.isEmpty {
                                Text("Nenhuma cirurgia adicionada")
                                    .foregroundColor(Color.gray)
                            } else {
                                Text(elder.cirurgias)
                            }
                        }
                    }
                } header: {
                    Text("Cirurgias")
                }

                Section {
                    HStack {
                        if editMode?.wrappedValue.isEditing == true {
                            TextField("Adicione as doenças", text: $elder.doencas, axis: .vertical)
                                .foregroundColor(.accentColor)
                        } else {
                            if elder.doencas.isEmpty {
                                Text("Nenhuma doença adicionada")
                                    .foregroundColor(Color.gray)
                            } else {
                                Text(elder.doencas)
                            }
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
        .onChange(of: editMode!.wrappedValue, perform: { value in
          if !(value.isEditing) {
             // funcao para salvar
          }
        })
    }
    
}


struct FichaView_Previews: PreviewProvider {
    static var previews: some View {
        FichaView()
    }
}
