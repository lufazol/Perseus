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

@MainActor
struct DadosView: View {
    
    let altura = 1122.0
    let largura = 793.0

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

                Section {
                    NavigationLink(destination: ContatosList()) {
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
                    NavigationLink(destination: PrivacidadeView()) {
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
            ShareLink(item: render(), label: {Image(systemName: "square.and.arrow.up")})
        )
    }
    
    func render() -> URL {
        // 1: Render Hello World with some modifiers
        let renderer = ImageRenderer(content:
        ZStack(alignment: .top){
            Rectangle()
                .frame(width: largura, height: altura)
                .foregroundColor(Color(hex: 0xF2F2F7))
                VStack {
                    Spacer(minLength: 40)
                    if let data = elder.foto, let uiimage = UIImage(data: data) {
                        Image(uiImage: uiimage)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 320, height: 320)
                            .clipShape(Circle())
                    } else {
                        Image("noprofile")
                             .resizable()
                             .scaledToFill()
                             .frame(width: 320, height: 320)
                             .clipShape(Circle())
                    }
                
                    Spacer(minLength: 40)

                    HStack {
                        Spacer(minLength: 80)
                        Text("Nome do idoso:")
                            .font(.system(size: 31))
                        Spacer()
                        Text(elder.nome)
                            .font(.system(size: 31))
                        Spacer(minLength: 80)
                    }
                
                    Spacer(minLength: 40)

                    HStack {
                        Spacer(minLength: 80)
                        Text("Nascimento:")
                            .font(.system(size: 31))
                        Spacer()
                        Text(elder.dataDeNascimento.formatted(.dateTime.day().month().year()))
                            .font(.system(size: 31))
                        Spacer(minLength: 80)
                    }
                    
                    Spacer(minLength: 40)

                    HStack {
                        Spacer(minLength: 80)
                        Text("Sexo")
                            .font(.system(size: 31))
                        Spacer()
                        Text(elder.sexo)
                            .font(.system(size: 31))
                        Spacer(minLength: 80)
                    }
                    
                    Spacer(minLength: 40)
                    
                    HStack {
                        Text("Peso (kg)")
                        Spacer()
                        Text("\(String(elder.peso))")
                    }
//
//                    HStack {
//                        Text("Tipo sanguíneo")
//                        Text(elder.tipoSanguineo)
//                    }

//                    HStack {
//                        if elder.cirurgias.isEmpty {
//                            Text("Nenhuma cirurgia adicionada")
//                                .foregroundColor(Color.gray)
//                        } else {
//                            Text(elder.cirurgias)
//                        }
//                    }
//
//                    HStack {
//                        if elder.doencas.isEmpty {
//                            Text("Nenhuma doença adicionada")
//                                .foregroundColor(Color.gray)
//                        } else {
//                            Text(elder.doencas)
//                        }
//                    }
                }
            }
        )
        
        // 2: Save it to our documents directory
        let url = URL.documentsDirectory.appending(path: "ficha_medica.pdf")
        
        // 3: Start the rendering process
        renderer.render { size, context in
            // 4: Tell SwiftUI our PDF should be the same size as the views we're rendering
            var box = CGRect(x: 0, y: 0, width: size.width, height: size.height)
            
            // 5: Create the CGContext for our PDF pages
            guard let pdf = CGContext(url as CFURL, mediaBox: &box, nil) else {
                return
            }
            
            // 6: Start a new PDF page
            pdf.beginPDFPage(nil)
            
            // 7: Render the SwiftUI view data onto the page
            context(pdf)
            
            // 8: End the page and close the file
            pdf.endPDFPage()
            pdf.closePDF()
        }
        return url
    }
}


struct DadosView_Previews: PreviewProvider {
    static var previews: some View {
        DadosView()
    }
}
