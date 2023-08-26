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
            PresentIntroView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .environment(\.locale, Locale(identifier: "pt_BR"))
                .environmentObject(GlobalElder.shared.mockedElder)
                /*
                .environmentObject(Elder(
                    nome: "Safira Mocker",
                    dataDeNascimento: Calendar.current.date(from: DateComponents(year: 1950, month: 8, day: 31))!,
                    sexo: "Feminino",
                    peso: 86,
                    tipoSanguineo: "O+",
                    cirurgias: "Colostomia, cesárea, abdominoplastia e blefaropastia.",
                    doencas: "Diabetes, hipertensão, osteoporose, infecção urinária com frequência."))
                 */
        }
    }
}
