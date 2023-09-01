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
    @ObservedObject var fichaService = FichaService()

    var hasFicha: Bool {
        return fichaService.getDadosDaFicha() != nil
    }

    var body: some Scene {
        WindowGroup {
            if hasFicha {
                ContentView()
                    .environment(\.locale, Locale(identifier: "pt_BR"))
                    .colorScheme(.light)
                    .environmentObject(GlobalElder.shared.mockedElder)
            } else {
                OnboardingAView()
                    .environment(\.locale, Locale(identifier: "pt_BR"))
                    .colorScheme(.light)
                    .environmentObject(GlobalElder.shared.mockedElder)
            }
        }
    }
}
