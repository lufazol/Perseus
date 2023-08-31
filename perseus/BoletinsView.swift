//
//  BoletinsView.swift
//  perseus
//
//  Created by Luan Fazolin on 22/08/23.
//

import SwiftUI

struct BoletinsView: View {
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
                    NavigationLink(destination: FichaView()) {
                        HStack {
                            Image(systemName: "medical.thermometer.fill")
                                .scaledToFit()
                                .foregroundColor(.white)
                                .background(
                                    Rectangle()
                                        .foregroundColor(Color(hex: 0x6CD4D9))
                                        .frame(width: rectangleWidth, height: rectangleHeight)
                                        .cornerRadius(8)
                                )
                                .padding(.trailing, 10)
                            Text("Temperatura")
                        }
                    }
                    NavigationLink(destination: FichaView()) {
                        HStack {
                            Image(systemName: "heart.text.square.fill")
                                .scaledToFit()
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
                    NavigationLink(destination: FichaView()) {
                        HStack {
                            Image(systemName: "syringe.fill")
                                .scaledToFit()
                                .foregroundColor(.white)
                                .background(
                                    Rectangle()
                                        .foregroundColor(Color(hex: 0x459599))
                                        .frame(width: rectangleWidth, height: rectangleHeight)
                                        .cornerRadius(8)
                                )
                                .padding(.trailing, 10)
                            Text("Glicemia")
                        }
                    }
                    NavigationLink(destination: FichaView()) {
                        HStack {
                            Image(systemName: "scalemass.fill")
                                .scaledToFit()
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
                    NavigationLink(destination: FichaView()) {
                        HStack {
                            Image(systemName: "bubbles.and.sparkles.fill")
                                .scaledToFit()
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
                    NavigationLink(destination: FichaView()) {
                        HStack {
                            Image(systemName: "bandage.fill")
                                .scaledToFit()
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
                    NavigationLink(destination: FichaView()) {
                        HStack {
                            Image("BrainIcon")
                                .imageScale(.small)
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
