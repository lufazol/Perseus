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
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
