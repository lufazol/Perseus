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
    var fichaService = FichaService()

    var hasFicha: Bool {
        fichaService.getDadosDaFicha()
        return fichaService.ficha != nil
    }

    var body: some Scene {
        WindowGroup {
            if hasFicha {
                ContentView()
                    .environment(\.locale, Locale(identifier: "pt_BR"))
                    .colorScheme(.light)
                    .environmentObject(GlobalElder.shared.mockedElder)
                    .environmentObject(FichaService())
            } else {
                OnboardingAView()
                    .environment(\.locale, Locale(identifier: "pt_BR"))
                    .colorScheme(.light)
                    .environmentObject(GlobalElder.shared.mockedElder)
                    .environmentObject(FichaService())
            }
        }
    }
}
