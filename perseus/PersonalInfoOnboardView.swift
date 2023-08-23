//
//  PersonalInfoOnboardView.swift
//  perseus
//
//  Created by Guilherme Ferreira Lenzolari on 23/08/23.
//
import SwiftUI
import Foundation

struct PersonalInfoOnboardingView: View {
    
    @State var name: String = ""
    
    var body: some View {
        VStack{
            
            Text("Para começar a utilizar, por favor adicione os dados da pessoa que você está cuidando.")
                .foregroundColor(Color.gray)
                .padding(.top, 58)
                .padding(.horizontal, 16)
            
            Circle()
                .padding(.top, 24)
                .frame(width: UIScreen.main.bounds.width * 0.36)
            
            Form {
                Section {
                    TextField("teste", text: $name)
                }
            }
            
            Spacer()

            
        }

    }
}


struct PersonalInfoOnboardingVie_Previews: PreviewProvider {
    static var previews: some View {
        PersonalInfoOnboardingView()
    }
}
