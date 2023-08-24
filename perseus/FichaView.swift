//
//  FichaView.swift
//  perseus
//
//  Created by Luan Fazolin on 24/08/23.
//

import SwiftUI

struct FichaView: View {
    var body: some View {
        VStack {
            Form {
                Section {
                    HStack {
                        Spacer()
                        VStack {
                            Circle()
                                .frame(
                                    width: UIScreen.main.bounds.width * 0.3,
                                    height: UIScreen.main.bounds.height * 0.1
                                )
                        }
                        Spacer()
                    }
                }
                .listRowBackground(Color.clear)
                
                Section {
                    HStack {
                        Text("Nome do idoso")
                        Spacer()
                        Text("Amélia")
                    }
                }

                Section {
                    HStack {
                        Text("Data de nascimento")
                        Spacer()
                        Text("03/05/1940")
                    }
                }

                Section {
                    HStack {
                        Text("Sexo")
                        Spacer()
                        Text("Feminino")
                    }
                }

                Section {
                    HStack {
                        Text("Tipo sanguíneo")
                        Spacer()
                        Text("Potente D+")
                    }
                }

                Section {
                    HStack {
                        Text("tuc tuc de metal no coração, & muitas outras")
                    }
                } header: {
                    Text("Cirurgias")
                }

                Section {
                    HStack {
                        Text("Todas as doenças")
                    }
                } header: {
                    Text("Doenças")
                }
            }
        }
        .navigationBarTitle("Dados")
        .navigationBarItems(
            trailing: Button(
                action: {
                    // Action when the button is tapped
                }) {
                    Text("Editar")
                }
        )
    }
}

struct FichaView_Previews: PreviewProvider {
    static var previews: some View {
        FichaView()
    }
}
