//
//  DetalheBoletimView.swift
//  perseus
//
//  Created by Luan Fazolin on 29/08/23.
//

import SwiftUI

struct DetalheBoletimView: View {
    var boletimSelecionado: String

    @State private var showingSheet = false
    @State private var selecao: String = ""

    @ObservedObject var boletimService = BoletimService()
    @State var temperaturas: [Temperatura]? = nil
    @State var pressoes: [Pressao]? = nil
    @State var glicemias: [Glicemia]? = nil
    @State var pesos: [Peso]? = nil
    @State var humores: [Humor]? = nil
    @State var dores: [Dores]? = nil
    @State var lucidezes: [Lucidez]? = nil


    var body: some View {
        VStack {
            if let listaTemperaturas = temperaturas {
                List(listaTemperaturas) { temperatura in
                    Section {
                        HStack {
                            Text(String(temperatura.valor) + " °C")
                            Spacer()
                            Text(temperatura.createdAt!.formatted(.dateTime.hour().minute()))
                        }
                    } header: {
                        Text(temperatura.createdAt!.formatted(.dateTime.day().month(.wide).year().weekday(.wide)))
                    }
                }
            }

            
            if let listaPressoes = pressoes {
                List(listaPressoes) { pressao in
                    Section {
                        HStack {
                            Text(String(pressao.valor) + " mmHg")
                            Spacer()
                            Text(pressao.createdAt!.formatted(.dateTime.hour().minute()))
                        }
                    } header: {
                        Text(pressao.createdAt!.formatted(.dateTime.day().month(.wide).year().weekday(.wide)))
                    }
                }
            }

            
            if let listaGlicemias = glicemias {
                List(listaGlicemias) { glicemia in
                    Section {
                        HStack {
                            Text(String(glicemia.valor) + " mg/dl")
                            Spacer()
                            Text(glicemia.createdAt!.formatted(.dateTime.hour().minute()))
                        }
                    } header: {
                        Text(glicemia.createdAt!.formatted(.dateTime.day().month(.wide).year().weekday(.wide)))
                    }
                }
            }
            
            if let listaPesos = pesos {
                List(listaPesos) { peso in
                    Section {
                        HStack {
                            Text(String(peso.valor) + " kg")
                            Spacer()
                            Text(peso.createdAt!.formatted(.dateTime.hour().minute()))
                        }
                    } header: {
                        Text(peso.createdAt!.formatted(.dateTime.day().month(.wide).year().weekday(.wide)))
                    }
                }
            }
            
            if let listaHumores = humores {
                List(listaHumores) { humor in
                    Section {
                        HStack {
                            Text(humor.valor!)
                            Spacer()
                            Text(humor.createdAt!.formatted(.dateTime.hour().minute()))
                        }
                    } header: {
                        Text(humor.createdAt!.formatted(.dateTime.day().month(.wide).year().weekday(.wide)))
                    }
                }
            }
            
            if let listaDores = dores {
                List(listaDores) { dor in
                    Section {
                        HStack {
                            Text(dor.valor!)
                            Spacer()
                            Text(dor.createdAt!.formatted(.dateTime.hour().minute()))
                        }
                    } header: {
                        Text(dor.createdAt!.formatted(.dateTime.day().month(.wide).year().weekday(.wide)))
                    }
                }
            }
            
            if let listaLucidezes = lucidezes {
                List(listaLucidezes) { lucidez in
                    Section {
                        HStack {
                            Text(lucidez.valor!)
                            Spacer()
                            Text(lucidez.createdAt!.formatted(.dateTime.hour().minute()))
                        }
                    } header: {
                        Text(lucidez.createdAt!.formatted(.dateTime.day().month(.wide).year().weekday(.wide)))
                    }
                }
            }
        }
        .onAppear {
            boletimService.getTemperaturas()
            boletimService.getPressoes()
            boletimService.getGlicemias()
            boletimService.getPesos()
            boletimService.getHumores()
            boletimService.getDores()
            boletimService.getLucidez()

            /*
            temperaturas = boletimService.temperaturas
            pressoes = boletimService.pressoes
            glicemias = boletimService.glicemias
            pesos = boletimService.pesos
            humores = boletimService.humores
            dores = boletimService.dores
            lucidezes = boletimService.lucidezes
            */
            switch boletimSelecionado {
            case "temperatura":
                selecao = "temperatura"
                temperaturas = boletimService.temperaturas ?? nil
            case "pressao":
                selecao = "pressao"
                pressoes = boletimService.pressoes ?? nil
            case "glicemia":
                selecao = "glicemia"
                glicemias = boletimService.glicemias ?? nil
            case "peso":
                selecao = "peso"
                pesos = boletimService.pesos ?? nil
            case "humor":
                selecao = "humor"
                humores = boletimService.humores ?? nil
            case "dor":
                selecao = "dor"
                dores = boletimService.dores ?? nil
            case "lucidez":
                selecao = "lucidez"
                lucidezes = boletimService.lucidezes ?? nil
            default:
                selecao = ""
            }
        }
        .navigationBarItems(trailing:
            Button(action: {
            showingSheet.toggle()
            }) {
                Image(systemName: "plus")
            }
            .sheet(isPresented: $showingSheet, onDismiss: {
                boletimService.getTemperaturas()
                boletimService.getPressoes()
                boletimService.getGlicemias()
                boletimService.getPesos()
                boletimService.getHumores()
                boletimService.getDores()
                boletimService.getLucidez()
                switch boletimSelecionado {
                case "temperatura":
                    selecao = "temperatura"
                    temperaturas = boletimService.temperaturas ?? nil
                case "pressao":
                    selecao = "pressao"
                    pressoes = boletimService.pressoes ?? nil
                case "glicemia":
                    selecao = "glicemia"
                    glicemias = boletimService.glicemias ?? nil
                case "peso":
                    selecao = "peso"
                    pesos = boletimService.pesos ?? nil
                case "humor":
                    selecao = "humor"
                    humores = boletimService.humores ?? nil
                case "dor":
                    selecao = "dor"
                    dores = boletimService.dores ?? nil
                case "lucidez":
                    selecao = "lucidez"
                    lucidezes = boletimService.lucidezes ?? nil
                default:
                    selecao = ""
                }
            }) {
                NavigationView {
                    AddBoletimView(selecao: selecao)
                }
            }
        )
    }
}

struct DetalheBoletimView_Previews: PreviewProvider {
    static var previews: some View {
        DetalheBoletimView(boletimSelecionado: "Valor")
    }
}
