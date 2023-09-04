//
//  AdicaoMedicamentoView.swift
//  perseus
//
//  Created by Lucas Finzzeto Pavarini on 30/08/23.
//

import SwiftUI

struct AdicaoMedicamentoView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.editMode) private var editMode
    
    @ObservedObject var medicamentoService = MedicamentoService()
    @ObservedObject var fichaService = FichaService()
    
    @State var drugName: String = ""
    @State var dosagem: String = ""
    @State var quantidade: String = ""
    @State var tempodedose: String = ""
    @State var observacoes: String = ""
//    @State var imagem: String = ""
    
    
    var body: some View {
        VStack{
            Form{
                
                Section{
                    TextField("Nome do Medicamento", text: $drugName)
                        .autocorrectionDisabled()
                }
                Section{
                    TextField("Dosagem", text: $dosagem)
                        .autocorrectionDisabled()
                }
                Section{
                    TextField("Quantidade", text: $quantidade)
                        .autocorrectionDisabled()
                }
                Section{
                    TextField("Tempo entre doses", text: $tempodedose)
                        .autocorrectionDisabled()
                }
                Section{
                    TextField("Observações", text: $observacoes, axis: .vertical)
                        .autocorrectionDisabled()
                        .lineLimit(5, reservesSpace: true)
                }
                
//                Section{
//                    //                    if let data = elder.foto, let uiimage = UIImage(data: data) {
//                    //                        Image(uiImage: uiimage)
//                    //                            .resizable()
//                    //                            .scaledToFill()
//                    //                            .frame(width: 200, height: 180)
//                    //                            .clipShape(Circle())
//                    //                    } else {
//                    Image("paracetamol")
//                        .resizable()
//                        .scaledToFit()
//                        .frame(width: 200, height: 180)
//                }
            }
            
        }
        .navigationBarTitle("Medicamentos", displayMode: .inline)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading:
                                Button("Cancelar", action: {
            self.presentationMode.wrappedValue.dismiss()
            
        }))
        .navigationBarItems(trailing:
                                Button("Salvar", action: {
            medicamentoService.createMedicamento(nome: drugName, dosagem: dosagem, quantidade: quantidade, ultimaVez: Date(), intervalo: tempodedose , observacoes: observacoes, idoso: (fichaService.ficha?.idoso)!)
            self.presentationMode.wrappedValue.dismiss()
        }))
        .onAppear{
            fichaService.getDadosDaFicha()
            medicamentoService.getMedicamentos()
        }
        
    }
}
struct AdicaoMedicamentoView_Previews: PreviewProvider {
    static var previews: some View {
        AdicaoMedicamentoView()
    }
}
