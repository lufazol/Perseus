//
//  PersonalInfoOnboardView.swift
//  perseus
//
//  Created by Guilherme Ferreira Lenzolari on 23/08/23.
//
import PhotosUI
import SwiftUI
import Foundation

class DadosOnboarding: ObservableObject {
    @Published var photo: Data?
    @Published var name: String = ""
    @Published var birthDate: Date = Date.now
    @Published var gender: String = "Masculino"
}


struct OnboardingAView: View {
    @State var selectedItems: [PhotosPickerItem] = []

    @StateObject var dadosOnboarding = DadosOnboarding()

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
                                    .padding(.bottom, 24)

                                if let data = dadosOnboarding.photo, let uiimage = UIImage(data: data) {
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
                                
                                PhotosPicker(
                                    selection: $selectedItems,
                                    maxSelectionCount: 1,
                                    matching: .images
                                ) {
                                    Text("Adicionar foto")
                                }
                                .onChange(of: selectedItems) { newValue in
                                    guard let item = selectedItems.first else {
                                        return
                                    }
                                    item.loadTransferable(type: Data.self) { result in
                                        switch result {
                                        case .success(let data):
                                            if let data = data {
                                                dadosOnboarding.photo = data
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
                    }.listRowBackground(Color.clear)
                    
                    Section {
                        TextField("Nome do Idoso", text: $dadosOnboarding.name)
                            .autocorrectionDisabled()
                    } footer: {
                        Text("*Campo obrigatório")
                    }

                    Section{
                        HStack {
                            Text("Nascimento")
                            Spacer()
                            DatePicker("nascimento", selection: $dadosOnboarding.birthDate, in: ...Date.now, displayedComponents: .date)
                                .labelsHidden()
                        }
                    }
                    
                    Section{
                        HStack {
                            Text("Sexo")
                            Spacer()
                            Picker("", selection: $dadosOnboarding.gender) {
                                //Text("").tag("")
                                ForEach(genders, id: \.self){ item in
                                    Text(item)
                                }
                            }
                        }
                    }
                    
                    Section{
                        NavigationLink(
                            "Próximo",
                            destination:
                                OnboardingBView()
                                .environmentObject(dadosOnboarding)
                        )
                            .background(Color(hex: 0x261C8C))
                            .listRowBackground(Color(hex: 0x261C8C))
                            .disabled(dadosOnboarding.name.isEmpty)
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
