//
//  DadosView.swift
//  perseus
//
//  Created by Luan Fazolin on 22/08/23.
//

import PhotosUI
import SwiftUI

extension Color {
    init(hex: UInt, alpha: Double = 1.0) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xff) / 255,
            green: Double((hex >> 8) & 0xff) / 255,
            blue: Double(hex & 0xff) / 255,
            opacity: alpha
        )
    }
}

struct DadosView: View {

    @ObservedObject
    private var elder: Elder = GlobalElder.shared.mockedElder

    var body: some View {
        
        let rectangleWidth = CGFloat(32)
        let rectangleHeight = CGFloat(32)

        VStack {
            Form {
                Section {
                    HStack {
                        Spacer()
                        VStack {
                            if let data = elder.foto, let uiimage = UIImage(data: data) {
                                Image(uiImage: uiimage)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 200, height: 180)
                                    .clipShape(Circle())
                            } else {
                                Image("noprofile")
                                     .resizable()
                                     .scaledToFill()
                                     .frame(width: 200, height: 180)
                                     .clipShape(Circle())
                            }
                            Text(elder.nome)
                                .font(.largeTitle)
                        }
                        Spacer()
                    }
                }
                .listRowBackground(Color.clear)

                Section {
                    NavigationLink(destination: FichaView()) {
                        HStack {
                            Image(systemName: "doc.text.below.ecg.fill")
                                .imageScale(.large)
                                .foregroundColor(.white)
                                .background(
                                    Rectangle()
                                        .foregroundColor(Color(hex: 0x56BABF))
                                        .frame(width: rectangleWidth, height: rectangleHeight)
                                        .cornerRadius(10)
                                )
                                .padding(.trailing, 10)
                            Text("Ficha médica")
                            Spacer()
                        }
                    }
                }

                /*
                Section {
                    NavigationLink(destination: FichaView()) {
                        HStack {
                            Image(systemName: "person.line.dotted.person.fill")
                                .imageScale(.small)
                                .foregroundColor(.white)
                                .background(
                                    Rectangle()
                                        .foregroundColor(Color(hex: 0x459599))
                                        .frame(width: rectangleWidth, height: rectangleHeight)
                                        .cornerRadius(10)
                                )
                                .padding(.trailing, 10)
                            Text("Contatos")
                            Spacer()
                        }
                    }
                }
                */

                Section {
                    /*
                    NavigationLink(destination: FichaView()) {
                        HStack {
                            Image(systemName: "bell.badge.fill")
                                .imageScale(.large)
                                .foregroundColor(.white)
                                .background(
                                    Rectangle()
                                        .foregroundColor(Color(hex: 0x928AE5))
                                        .frame(width: rectangleWidth, height: rectangleHeight)
                                        .cornerRadius(10)
                                )
                                .padding(.trailing, 10)
                            Text("Notificações")
                            Spacer()
                        }
                    }
                    NavigationLink(destination: FichaView()) {
                        HStack {
                            Image(systemName: "globe.americas.fill")
                                .imageScale(.large)
                                .foregroundColor(.white)
                                .background(
                                    Rectangle()
                                        .foregroundColor(Color(hex: 0x766CD9))
                                        .frame(width: rectangleWidth, height: rectangleHeight)
                                        .cornerRadius(10)
                                )
                                .padding(.trailing, 10)
                            Text("Idiomas")
                            Spacer()
                        }
                    }
                    */
                    NavigationLink(destination: FichaView()) {
                        HStack {
                            Image(systemName: "hand.raised.fill")
                                .imageScale(.large)
                                .foregroundColor(.white)
                                .background(
                                    Rectangle()
                                        .foregroundColor(Color(hex: 0x574CBF))
                                        .frame(width: rectangleWidth, height: rectangleHeight)
                                        .cornerRadius(10)
                                )
                                .padding(.trailing, 10)
                            Text("Declaração de privacidade")
                            Spacer()
                        }
                    }
                }

                Section {
                    Button(action: {
                        // Action to perform when the button is tapped
                    }) {
                        HStack {
                            Spacer()
                            Text("Apagar conta")
                                .foregroundColor(.red)
                            Spacer()
                        }

                    }
                    .background(Color.white)
                    .cornerRadius(10)
                }
            }
        }
        .navigationBarItems(trailing:
            Button(action: {
                // Action when the button is tapped
            }) {
                Image(systemName: "square.and.arrow.up")
            }
        )
    }
}


struct DadosView_Previews: PreviewProvider {
    static var previews: some View {
        DadosView()
    }
}
