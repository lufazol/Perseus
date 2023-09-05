//
//  BoletinsView.swift
//  perseus
//
//  Created by Luan Fazolin on 22/08/23.
//

import SwiftUI

struct BoletinsView: View {

    @State var boletimSelecionado: String = ""
    var selecao: String = ""

    var body: some View {
        let rectangleWidth = CGFloat(32)
        let rectangleHeight = CGFloat(32)
        
        VStack {
            Form {
                Section{
                    HStack{
                        VStack{
                            Text("Como está se sentindo hoje?")
                            .foregroundColor(Color.gray)
                            .padding(.horizontal, -16)

                            }
                        }
                    }.listRowBackground(Color.clear)
                Section {
                    NavigationLink(destination: DetalheBoletimView(boletimSelecionado: "temperatura").navigationBarTitle("Temperatura")) {
                        HStack {
                            Image(systemName: "medical.thermometer.fill")
                                .imageScale(.medium)
                                .foregroundColor(.white)
                                .background(
                                    Rectangle()
                                        .foregroundColor(Color(hex: 0x6CD4D9))
                                        .frame(width: rectangleWidth, height: rectangleHeight)
                                        .cornerRadius(8)
                                )
                                .padding(.trailing, 5)
                            Text("Temperatura")
                        }
                    }
                    .onTapGesture {
                        boletimSelecionado = "temperatura"
                    }

                    NavigationLink(destination: DetalheBoletimView(boletimSelecionado: "pressao").navigationBarTitle("Pressão")) {
                        HStack {
                            Image(systemName: "heart.text.square.fill")
                                .imageScale(.medium)
                                .foregroundColor(.white)
                                .background(
                                    Rectangle()
                                        .foregroundColor(Color(hex: 0x56BABF))
                                        .frame(width: rectangleWidth, height: rectangleHeight)
                                        .cornerRadius(8)
                                )
                                .padding(.trailing, 10)
                            Text("Pressão")
                        }
                    }
                    .onTapGesture {
                        boletimSelecionado = "pressao"
                    }


                    NavigationLink(destination: DetalheBoletimView(boletimSelecionado: "glicemia").navigationBarTitle("Glicemia")) {
                        HStack {
                            Image(systemName: "syringe.fill")
                                .imageScale(.medium)
                                .foregroundColor(.white)
                                .background(
                                    Rectangle()
                                        .foregroundColor(Color(hex: 0x459599))
                                        .frame(width: rectangleWidth, height: rectangleHeight)
                                        .cornerRadius(8)
                                )
                                .padding(.trailing, 5)
                            Text("Glicemia")
                        }
                    }
                    .onTapGesture {
                        boletimSelecionado = "glicemia"
                    }


                    NavigationLink(destination: DetalheBoletimView(boletimSelecionado: "peso").navigationBarTitle("Peso")) {
                        HStack {
                            Image(systemName: "scalemass.fill")
                                .imageScale(.medium)
                                .foregroundColor(.white)
                                .background(
                                    Rectangle()
                                        .foregroundColor(Color(hex: 0x337C80))
                                        .frame(width: rectangleWidth, height: rectangleHeight)
                                        .cornerRadius(8)
                                )
                                .padding(.trailing, 10)
                            Text("Peso")
                        }
                    }
                    .onTapGesture {
                        boletimSelecionado = "peso"
                    }


                    NavigationLink(destination: DetalheBoletimView(boletimSelecionado: "humor").navigationBarTitle("Humor")) {
                        HStack {
                            Image(systemName: "bubbles.and.sparkles.fill")
                                .imageScale(.medium)
                                .foregroundColor(.white)
                                .background(
                                    Rectangle()
                                        .foregroundColor(Color(hex: 0x928AE5))
                                        .frame(width: rectangleWidth, height: rectangleHeight)
                                        .cornerRadius(8)
                                )
                                .padding(.trailing, 10)
                            Text("Humor")
                        }
                    }
                    .onTapGesture {
                        boletimSelecionado = "humor"
                    }

                    NavigationLink(destination: DetalheBoletimView(boletimSelecionado: "dor").navigationBarTitle("Dor")) {
                        HStack {
                            Image(systemName: "bandage.fill")
                                .imageScale(.medium)
                                .foregroundColor(.white)
                                .background(
                                    Rectangle()
                                        .foregroundColor(Color(hex: 0x766CD9))
                                        .frame(width: rectangleWidth, height: rectangleHeight)
                                        .cornerRadius(8)
                                )
                                .padding(.trailing, 10)
                            Text("Dor")
                        }
                    }
                    .onTapGesture {
                        boletimSelecionado = "dor"
                    }


                    NavigationLink(destination: DetalheBoletimView(boletimSelecionado: "lucidez").navigationBarTitle("Lucidez")) {
                        HStack {
                            Image("BrainIcon")
                                .imageScale(.medium)
                                .foregroundColor(.white)
                                .background(
                                    Rectangle()
                                        .foregroundColor(Color(hex: 0x574CBF))
                                        .frame(width: rectangleWidth, height: rectangleHeight)
                                        .cornerRadius(8)
                                )
                                .padding(.trailing, 10)
                                .padding(.leading, -3)
                            Text("Lucidez")
                        }
                    }
                    .onTapGesture {
                        boletimSelecionado = "lucidez"
                    }
                } 
            }
        }
        .navigationTitle("Boletim")

    }
}

struct BoletinsView_Previews: PreviewProvider {
    static var previews: some View {
        BoletinsView()
    }
}
