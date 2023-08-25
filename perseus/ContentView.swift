//
//  ContentView.swift
//  perseus
//
//  Created by Luan Fazolin on 22/08/23.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    var body: some View {
        
        // sets tab bar and associated views
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
                TesteCoreData()
                    .navigationTitle("Dados")
            }
            .tabItem {
                Image(systemName: "person.text.rectangle")
                Text("Dados")
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()    }
}
