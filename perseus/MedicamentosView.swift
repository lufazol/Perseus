import SwiftUI

struct Medicamento: Identifiable {
    var id: Int
    let nome: String
    let dosagem: String
    let tempo: String
}

var medList = [
    Medicamento(id: 0, nome: "Paracetamol", dosagem: "50mg", tempo: "2 comprimidos a cada 2 horas"),
    Medicamento(id: 1, nome: "Ibuprofeno", dosagem: "100mg", tempo: "1 comprimidos a cada 8 horas")
]

struct MedicamentosView: View {
    var body: some View {
        List(medList) { medicamento in
            NavigationLink(destination: FichaView()) {
                HStack {
                    ZStack {
                        Rectangle()
                            .frame(width: 120, height: 120)
                            .cornerRadius(10)
                            .foregroundColor(Color(hex: 0xF2F2F7))
                        
                        Image("paracetamol")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 100)
                    }
                    
                    VStack(alignment: .leading) {
                        Text(medicamento.nome)
                            .font(.title2)
                            .fontWeight(.bold)
                            .multilineTextAlignment(.leading)
                        
                        Text(medicamento.dosagem)
                            .font(.headline)
                            .fontWeight(.bold)
                            .foregroundColor(Color.gray)
                            .multilineTextAlignment(.leading)
                        
                        Text(medicamento.tempo)
                            .font(.subheadline)
                            .multilineTextAlignment(.leading)
                            .lineLimit(2)
                    }
                    .padding(.all)
                }
            }
            .navigationBarItems(trailing:
                    NavigationLink(destination: AdicaoMedicamentoView()) {
                
                    Image(systemName: "plus")
                }
            )
        }
    }
}

struct MedicamentosView_Previews: PreviewProvider {
    static var previews: some View {
        MedicamentosView()
    }
}

