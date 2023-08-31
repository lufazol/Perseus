//
//  AdicaoMedicamentoView.swift
//  perseus
//
//  Created by Lucas Finzzeto Pavarini on 30/08/23.
//

import SwiftUI

struct AdicaoMedicamentoView: View {
    
    @State var drugName: String = ""
    @State var dosagem: String = ""
    @State var quantidade: String = ""
    @State var tempodedose: String = ""
    @State var observacoes: String = ""
    @State var imagem: String = ""
    
    
    var body: some View {
        VStack{
            Form{
                
                Section{
                    TextField("Nome do Medicamente", text: $drugName)
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
                Section{
                    TextField("Imagem", text: $imagem, axis: .vertical)
                        .autocorrectionDisabled()
                        .lineLimit(7, reservesSpace: true)
                    
                Section{
                    
                }
                
                }
            }
        }.navigationBarTitle("Medicamentos")
            //.animation(nil, value: editMode?.wrappedValue)
            .toolbar{
                
                EditButton()}
    }
}
struct AdicaoMedicamentoView_Previews: PreviewProvider {
    static var previews: some View {
        AdicaoMedicamentoView()
    }
}
