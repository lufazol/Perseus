//
//  PersonalInfoOnboardView.swift
//  perseus
//
//  Created by Guilherme Ferreira Lenzolari on 23/08/23.
//
import SwiftUI
import Foundation

struct OnboardingAView: View {
    @ObservedObject
    private var elder: Elder = GlobalElder.shared.mockedElder


    /*
    @State var name: String = ""
    @State var dateWasSelected = false
    @State var birthDate = Date.now
    @State var gender: String = "Masculino"
    */

    var genders = ["Masculino", "Feminino", "Outro"]

    @State var goToOnboardingBView = false
    
    var body: some View {
        NavigationView{
            VStack{
                Form {
                    Section{
                        HStack{
                            VStack{
                                Text("Para começar a utilizar, por favor adicione os dados da pessoa que você está cuidando.")
                                    .foregroundColor(Color.gray)
                                    .padding(.horizontal, -16)
                                
                                Image("amelia")
                                     .resizable()
                                     .scaledToFill()
                                     .frame(width: UIScreen.main.bounds.width * 0.36)
                                     .clipShape(Circle())
                                     .padding(.bottom, -20)
                            }
                        }
                    }.listRowBackground(Color.clear)
                    
                    Section {
                        TextField("Nome do Idoso", text: $elder.nome)
                            .autocorrectionDisabled()
                    } footer: {
                        Text("*Campo obrigatório")
                    }

                    Section{
                        HStack {
                            Text("Nascimento")
                            Spacer()
                            DatePicker("nascimento", selection: $elder.dataDeNascimento, in: ...Date.now, displayedComponents: .date)
                                .labelsHidden()
                        }
                    }
                    
                    Section{
                        HStack {
                            Text("Sexo")
                            Spacer()
                            Picker("", selection: $elder.sexo) {
                                //Text("").tag("")
                                ForEach(genders, id: \.self){ item in
                                    Text(item)
                                }
                            }
                        }
                    }
                    
                    Section{
                        Text("Ao prosseguir você concorda com nossos termo de Politica de Privacidade.")
                            .foregroundColor(Color.gray)
                            .padding(.horizontal, -16)
                            .padding(.top, -8)
                        
                    }.listRowBackground(Color.clear)
                    
                    Section{
                        ZStack{
                            
                            NavigationLink("", destination: OnboardingBView(), isActive: $goToOnboardingBView)
                            
                            Button {
                                goToOnboardingBView = true
                            } label: {
                                HStack {
                                    Spacer()
                                    Text("Proximo")
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
}


struct PersonalInfoOnboardingVie_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingAView()
    }
}
