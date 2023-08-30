//
//  AddBoletimView.swift
//  perseus
//
//  Created by Luan Fazolin on 30/08/23.
//

import SwiftUI

struct AddBoletimView: View {
    @Environment(\.dismiss) var dismiss
    @State private var register: String = ""

    var body: some View {
        VStack {
            Form {
                Section {
                    TextField(
                        "Digite o registro aqui",
                        text: $register
                    )
                    .disableAutocorrection(true)
                }
            }

        }
        .padding(.top, -16)
        .navigationBarTitle("Adicionar pressão", displayMode: .inline)
        .toolbar{
            ToolbarItem(placement: .navigationBarTrailing) {
                Button("Salvar") {
                }
            }
            ToolbarItem(placement: .navigationBarLeading) {
                Button("Cancelar") {
                    dismiss()
                }
            }
        }
    }
}

struct AddBoletimView_Previews: PreviewProvider {
    static var previews: some View {
        AddBoletimView()
    }
}
