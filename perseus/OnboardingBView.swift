//
//  OnboardingBView.swift
//  perseus
//
//  Created by Guilherme Ferreira Lenzolari on 24/08/23.
//

import SwiftUI

struct OnboardingBView: View {
    
    @ObservedObject
    private var elder: Elder = GlobalElder.shared.mockedElder
    
    var bloodType = ["A+","A-","B+","B-","AB+","AB-","O+","O-"]
    var currentValue: Float = 0.0
    var weightArray:[String] = []
    
    @State var goToBoletimView = false

    //loop for weight values
    init() {
        while currentValue <= 500.0 {
            weightArray.append(String(format: "%.1f", currentValue))
            currentValue += 0.5
        }
    }

    var body: some View {
        VStack{
            Form {
                Section{
                    HStack{
                        VStack{
                            Text("Para começar a utilizar, por favor adicione os dados da pessoa que você está cuidando.")
                            .foregroundColor(Color.gray)
                            .padding(.horizontal, -16)

                            }
                        }
                    }.listRowBackground(Color.clear)

                Section{
                    HStack {
                        Text("Tipo sanguíneo")
                        Spacer()
                        Picker("", selection: $elder.tipoSanguineo) {
                            //Text("").tag("")
                            ForEach(bloodType, id: \.self){ item in
                                Text(item)
                            }
                        }
                    }
                }
                       
                Section{
                    HStack {
                        Text("Peso (kg)")
                        Spacer()
                        Picker("", selection: $elder.peso) {
                            ForEach(weightArray, id: \.self){ item in
                                Text(item)
                            }
                        }
                    }
                }
                
                Section {
                    TextField("Cirurgias", text: $elder.cirurgias, axis:.vertical)
                } footer: {
                    Text("Escreva aqui as cirurgias pelas quais a pessoa passou.")
                }
                
                Section {
                    TextField("Doenças", text: $elder.doencas, axis: .vertical)
                } footer: {
                    Text("Escreva aqui as doenças que a pessoa teve.")
                }
                
                Section{
                    ZStack{
                        
                        NavigationLink("", destination: ContentView()).opacity(0)
                        
                        Button {
                            goToBoletimView = true
                        } label: {
                            HStack {
                                Spacer()
                                Text("Começar a usar")
                                Spacer()
                            }.foregroundColor(Color.white)
                        }
                        .disabled(elder.nome.isEmpty)
                    }
                }.listRowBackground(Color(hex: 0x261C8C))
                
            }
        }
    }
}

struct OnboardingBView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingBView()
    }
}
