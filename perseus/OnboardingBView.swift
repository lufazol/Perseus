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
    @EnvironmentObject var dadosOnboarding: DadosOnboarding
    @EnvironmentObject var fichaService: FichaService

    @State var blood: String = "A+"
    @State var weight: String = "60"
    @State var surgery: String = ""
    @State var illnesses: String = ""

    
    var bloodType = ["A+","A-","B+","B-","AB+","AB-","O+","O-"]
    var currentValue: Int64 = 0
    var weightArray:[String] = []
    
    @State var goToBoletimView = false

    //loop for weight values
    init() {
        while currentValue <= 500 {
            weightArray.append(String(currentValue))
            currentValue += 1
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
                        Picker("", selection: $blood) {
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
                        Picker("", selection: $weight) {
                            ForEach(weightArray, id: \.self){ item in
                                Text(item)
                            }
                        }
                    }
                }
                
                Section {
                    TextField("Cirurgias", text: $surgery, axis:.vertical)
                } footer: {
                    Text("Escreva aqui as cirurgias pelas quais a pessoa passou.")
                }
                
                Section {
                    TextField("Doenças", text: $illnesses, axis: .vertical)
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
                
                    NavigationLink("Finalizar", destination: ContentView())
                        .background(Color(hex: 0x261C8C))
                        .listRowBackground(Color(hex: 0x261C8C))
                        .foregroundColor(Color.white)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .simultaneousGesture(TapGesture().onEnded{
                            fichaService.createFicha(
                                nome: dadosOnboarding.name,
                                sexo: dadosOnboarding.gender,
                                nascimento: dadosOnboarding.birthDate,
                                peso: Int64(weight)!,
                                tipoSanguineo: blood,
                                doencas: illnesses,
                                cirurgias: surgery,
                                alergias: "",
                                id: UUID(),
                                createdAt: Date.now,
                                image: dadosOnboarding.photo!)
                        })
                }
            }
        }
    }

struct OnboardingBView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingBView()
    }
}
