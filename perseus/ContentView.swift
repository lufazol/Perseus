//
//  ContentView.swift
//  perseus
//
//  Created by Luan Fazolin on 22/08/23.
//

import SwiftUI
import LocalAuthentication

struct ContentView: View {
    
    @State private var isUnlocked: Bool = false
    
    var body: some View {
        // sets tab bar and associated views
        VStack{
            if isUnlocked{
                TabView {
                    NavigationView {
                        BoletinsView()
                            .navigationTitle("Boletins")
                    }
                    .tabItem {
                        Image(systemName: "list.clipboard")
                        Text("Boletins")
                    }

                    NavigationView {
                        MedicamentosView()
                            .navigationTitle("Medicamentos")
                    }
                    .tabItem {
                        Image(systemName: "pills")
                        Text("Medicamentos")
                    }

                    NavigationView {
                        DadosView()
                            .navigationTitle("Dados")
                    }
                    .tabItem {
                        Image(systemName: "person.text.rectangle")
                        Text("Dados")
                    }
                }
            } else {
                Text("locked")
            }
        }.onAppear(perform: authenticate)
    }

    func authenticate() {
        let context = LAContext()
        var error: NSError?

        // Check whether biometric authentication is possible
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            // It's possible, so go ahead and use it
            let reason = "Precisamos de sua autorização para prosseguir"

            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, authenticationError in
                // Authentication has now completed
                DispatchQueue.main.async {
                    if success {
                        // Authenticated successfully
                        isUnlocked = true
                    } else {
                        // There was a problem with biometrics, let's try passcode
                        context.evaluatePolicy(.deviceOwnerAuthentication, localizedReason: reason) { success, authenticationError in
                            if success {
                                // Authenticated with passcode
                                isUnlocked = true
                            } else {
                                // Failed authentication with passcode as well
                                isUnlocked = false
                            }
                        }
                    }
                }
            }
        } else {
            // No biometrics, let's try passcode
            let reason = "Precisamos de sua autorização para prosseguir"
            context.evaluatePolicy(.deviceOwnerAuthentication, localizedReason: reason) { success, authenticationError in
                if success {
                    // Authenticated with passcode
                    isUnlocked = true
                } else {
                    // Failed authentication with passcode as well
                    isUnlocked = false
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
