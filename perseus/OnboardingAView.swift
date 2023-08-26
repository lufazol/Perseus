//
//  PersonalInfoOnboardView.swift
//  perseus
//
//  Created by Guilherme Ferreira Lenzolari on 23/08/23.
//
import SwiftUI
import Foundation

struct OnboardingAView: View {
    
    
    @State var name: String = ""
    @State var dateWasSelected = false
    @State var birthDate = Date.now
    @State var gender: String = ""
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
                                
                                Circle()
                                    .padding(.top, 24)
                                    .frame(width: UIScreen.main.bounds.width * 0.36)
                            }
                        }
                    }.listRowBackground(Color.clear)
                    
                    Section {
                        TextField("Nome do Idoso", text: $name)
                    }
                    
                    Section{
                        DatePicker(selection: $birthDate, in: ...Date.now, displayedComponents: .date) {
                            Text("Data de Nascimento")
                        }
                    }
                    
                    Section{
                        Picker("Sexo", selection: $gender) {
                            //Text("").tag("")
                            ForEach(genders, id: \.self){
                                Text($0)
                            }
                        }
                    }
                    
                    Section{
                        NavigationLink("Próximo", destination: OnboardingBView())
                            .background(Color(hex: 0x261C8C))
                            .listRowBackground(Color(hex: 0x261C8C))
                            .foregroundColor(Color.white)
                            .frame(maxWidth: .infinity, alignment: .center)
                    }
                         
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
