//
//  OnboardingBView.swift
//  perseus
//
//  Created by Guilherme Ferreira Lenzolari on 24/08/23.
//

import SwiftUI

struct OnboardingBView: View {
    
    @State var blood: String = ""
    @State var weight: String = ""
    @State var surgery: String = ""
    @State var illnesses: String = ""
    
    var bloodType = ["A+","A-","B+","B-","AB+","AB-","O+","O-"]
    var currentValue: Float = 0.0
    var weightArray:[String] = []

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
                    Picker("Tipo sanguíneo", selection: $blood) {
                        //Text("").tag("")
                        ForEach(bloodType, id: \.self){
                            Text($0)
                        }
                    }
                }
                       
                Section{
                    Picker("Peso (kg)", selection: $weight) {
                        ForEach(weightArray, id: \.self){
                            Text($0)
                        }
                    }
                }
                
                Section {
                    TextField("Cirurgias", text: $surgery)
                } footer: {
                    Text("Escreva aqui as cirurgias que a pessoa passou.")
                }
                
                Section {
                    TextField("Doenças", text: $illnesses)
                } footer: {
                    Text("Escreva aqui as doenças que a pessoa teve.")
                }
                

                Section {
                    Button(action: {
                    }) {
                        HStack {
                            Spacer()
                            Text("Finalizar")
                                .foregroundColor(.white)
                            Spacer()
                        }
                    }
                    
                    .cornerRadius(10)
                }.background(Color(hex: 0x261C8C))
                    .listRowBackground(Color(hex: 0x261C8C))
            }
        }
    }
    
}

struct OnboardingBView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingBView()
    }
}
