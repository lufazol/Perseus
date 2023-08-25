//
//  perseusApp.swift
//  perseus
//
//  Created by Luan Fazolin on 22/08/23.
//

import SwiftUI

@main
struct perseusApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            OnboardingAView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .environment(\.locale, Locale(identifier: "pt_BR"))        }
    }
}
