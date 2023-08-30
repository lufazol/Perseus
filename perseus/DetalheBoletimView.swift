//
//  DetalheBoletimView.swift
//  perseus
//
//  Created by Luan Fazolin on 29/08/23.
//

import SwiftUI

struct DetalheBoletimView: View {
    var boletins: [DadoBoletim] = DadoBoletim.sampleDados
    @State private var showingSheet = false


    var body: some View {
        VStack {
            List {
                Image("grafico")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 340, height: 220)
                    .listRowBackground(Color.clear)
                ForEach(boletins) { boletin in
                    Section {
                        ForEach(boletin.dados, id: \.self) { dado in
                            Text(dado)
                        }
                    } header: {
                        Text(boletin.data.formatted(.dateTime.day().month(.wide).year().weekday(.wide)))
                    }
                }
            }
        }
        .navigationBarItems(trailing:
            Button(action: {
            showingSheet.toggle()
            }) {
                Image(systemName: "plus")
            }
            .sheet(isPresented: $showingSheet) {
                NavigationView {
                    AddBoletimView()
                }
            }
        )
    }
}

struct DetalheBoletimView_Previews: PreviewProvider {
    static var previews: some View {
        DetalheBoletimView()
    }
}
