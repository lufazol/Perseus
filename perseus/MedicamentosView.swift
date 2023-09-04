import SwiftUI

struct MedicamentosView: View {
    @ObservedObject var medicamentoService = MedicamentoService()
    @State var medicamentoSelecionado: Medicamento?
    
    var body: some View {
        List(medicamentoService.medicamentos ?? []) { medicamento in
            NavigationLink(destination: EdicaoMedicamentoView(medicamentoSelecionado: medicamento)) {
                HStack {                    
                    VStack(alignment: .leading) {
                        Text(medicamento.nome ?? "")
                            .font(.title2)
                            .fontWeight(.bold)
                            .multilineTextAlignment(.leading)
                        
                        Text(medicamento.dosagem ?? "")
                            .font(.headline)
                            .fontWeight(.bold)
                            .foregroundColor(Color.gray)
                            .multilineTextAlignment(.leading)
                        
                        Text(medicamento.intervalo ?? "")
                            .font(.subheadline)
                            .multilineTextAlignment(.leading)
                            .lineLimit(2)
                    }
                    .padding(.all)
                }
            }
        }
        .navigationBarItems(trailing:
                                NavigationLink(destination: AdicaoMedicamentoView()) {
            
            Image(systemName: "plus")
        }
        )
        .onAppear{
            medicamentoService.getMedicamentos()
            print("nova lista de medicamentos")
        }
    }
}

struct MedicamentosView_Previews: PreviewProvider {
    static var previews: some View {
        MedicamentosView()
    }
}

