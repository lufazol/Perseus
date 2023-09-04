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
    
    @State private var nome = ""
    @State private var sexo = ""
    @State private var nascimento = Date()
    @State private var peso = ""
    @State private var tipoSanguineo = ""
    @State private var doencas = ""
    @State private var cirurgias = ""
    @State private var image: Data?
    
    @EnvironmentObject var fichaService: FichaService
   // @State var ficha: Ficha?
    
    func image(for data:Data?) -> UIImage? {
        if let data = data {
            return UIImage(data: data)
        } else {
            return UIImage(named: "noprofile")
        }
    }
    
    var body: some View {
        VStack {
            Form {
                Section {
                    HStack {
                        Spacer()
                        VStack {
                            if let uiimage = image(for: fichaService.ficha?.idoso?.image) {
                                Image(uiImage: uiimage)
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
                                ) {}
                                    .onChange(of: selectedItems) { newValue in
                                        guard let item = selectedItems.first else {
                                            return
                                        }
                                        item.loadTransferable(type: Data.self) { result in
                                            switch result {
                                            case .success(let data):
                                                if let data = data {
                                                    image = data
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
                            TextField(fichaService.ficha?.nome ?? "nome", text: $nome)
                                .labelsHidden()
                                .multilineTextAlignment(.trailing)
                                .foregroundColor(.accentColor)
                        } else {
                            Text(fichaService.ficha?.nome ?? "")
                        }
                    }
                }

                Section {
                    HStack {
                        Text("Nascimento")
                        Spacer()
                        if editMode?.wrappedValue.isEditing == true {
                            DatePicker("nascimento", selection: $nascimento, displayedComponents: .date)
                                .labelsHidden()
                        } else {
                            Text(fichaService.ficha?.nascimento?.formatted(.dateTime.day().month().year()) ?? "")
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
                            Text(fichaService.ficha?.sexo ?? "")
                        }
                    }
                }

                Section {
                    HStack {
                        Text("Peso (kg)")
                        Spacer()
                        if editMode?.wrappedValue.isEditing == true {
                            Picker("", selection: $peso) {
                                ForEach(weightArray, id: \.self){ item in
                                    Text(item)
                                }
                            }
                        } else {
                            Text("\(String(fichaService.ficha?.peso ?? 0))")
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
                            Text(fichaService.ficha?.tipoSanguineo ?? "")
                        }
                    }
                }

                Section {
                    HStack {
                        if editMode?.wrappedValue.isEditing == true {
                            TextField("Adicione as cirurgias", text: $cirurgias, axis: .vertical)
                                .foregroundColor(.accentColor)
                        } else {
                            Text(fichaService.ficha?.cirurgias ?? "Nenhuma cirurgia adicionada")
                        }
                    }
                } header: {
                    Text("Cirurgias")
                }

                Section {
                    HStack {
                        if editMode?.wrappedValue.isEditing == true {
                            TextField("Adicione as doenças", text: $doencas, axis: .vertical)
                                .foregroundColor(.accentColor)
                        } else {
                            Text(fichaService.ficha?.doencas ?? "Nenhuma doença adicionada")
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
        .onChange(of: editMode?.wrappedValue.isEditing, perform: { isEditing in
            if !isEditing! {
                fichaService.updateFicha(ficha: fichaService.ficha!, nome: nome, sexo: sexo, nascimento: nascimento, peso: Int64(peso) ?? 200, tipoSanguineo: tipoSanguineo, doencas: doencas, cirurgias: cirurgias, alergias: "dado não inputado", image: image ?? Data() )
            }
            fichaService.getDadosDaFicha()
        })
        .onAppear {
            fichaService.getDadosDaFicha()
            nome = fichaService.ficha?.nome ?? ""
            sexo = fichaService.ficha?.sexo ?? ""
            nascimento = fichaService.ficha?.nascimento ?? Date()
            peso = "\(String(fichaService.ficha?.peso ?? 0))"
            tipoSanguineo = fichaService.ficha?.tipoSanguineo ?? ""
            doencas = fichaService.ficha?.doencas ?? ""
            cirurgias = fichaService.ficha?.cirurgias ?? ""
            image = fichaService.ficha?.idoso?.image
        }
    }
    
}


struct FichaView_Previews: PreviewProvider {
    static var previews: some View {
        FichaView()
    }
}
