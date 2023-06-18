import SwiftUI

struct CardView: View {
    var selectedStudents: [String]
    let subtitles = ["Passivo", "Agressivo", "Vítima", "Neutro", "Neutro"]
    let loremArray = ["Na escola, um aluno é constantemente excluído pelos colegas. Eles o isolam, fazem piadas e o ignoram.",
                      "Durante uma atividade em grupo, um dos alunos começa a insultar e humilhar verbalmente outro colega, de forma agressiva e ofensiva.",
                      "Um aluno novo, de outra etnia, é alvo de discriminação por parte de alguns colegas."]
    @State var number = 0
    
    @State var displayedPhrase: String = ""
    @State var displaySub: String = ""
    @State var clickCount = 0
    
    func getRandomPhrase() -> String {
        return loremArray.randomElement() ?? ""
    }
    
    var body: some View {
        VStack {
            Spacer()
            
            Text(displayedPhrase)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.black)
                .padding()
            
            List(selectedStudents.indices, id: \.self) { index in
                VStack(alignment: .leading) {
                    Text(selectedStudents[index])
                        .font(.headline)
                    Text(subtitles[index])
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
            }
            .listStyle(.plain)
            
            if clickCount < 3 {
                Button(action: {
                    displayedPhrase = getRandomPhrase()
                    clickCount += 1
                }) {
                    Text("Próximo")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(15)
                }
            } else {
                NavigationLink(destination: AnotherView(selectedStudents: selectedStudents, subtitles: subtitles)) {
                    Text("Ver detalhes")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.green)
                        .cornerRadius(15)
                }
            }
            
            Spacer()
        }
        .frame(width: 350, height: 500)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 10)
        .padding()
        .onAppear {
            displayedPhrase = getRandomPhrase()
        }
    }
}

struct OptionSelection {
    var selectedBody: String
    var selectedCasa: String
    var selectedRock: String
}

struct AnotherView: View {
    var selectedStudents: [String]
    var subtitles: [String]
    let optionsBody: [String] = ["Esquerda", "Direita", "De Costa", "De Frente"]
    let optionCasa = ["0", "1", "2", "3"]
    let optionRock = ["Sim", "Não"]
    
    @State private var selectedOptions: [OptionSelection] = []
    
    var body: some View {
        VStack {
            Text("Detalhes dos estudantes:")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.black)
                .padding()
            
            List{
                ForEach(selectedStudents.indices, id: \.self) { index in
                    VStack(spacing: 10) {
                        Text(selectedStudents[index])
                            .font(.title3)
                            .fontWeight(.bold)
                        Text(subtitles[index])
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                    if index < selectedOptions.count {
                        
                        Text("Em que posição seu corpo terminou?")
                        Picker("Selecione uma opção", selection: $selectedOptions[index].selectedBody) {
                            ForEach(optionsBody, id: \.self) { option in
                                Text(option)
                            }
                        }
                        .pickerStyle(.segmented)
                        .padding()
                        
                        Text("Em qual posição do tabuleiro ele(a) ficou? ")
                        Picker("Selecione uma opção", selection: $selectedOptions[index].selectedCasa) {
                            ForEach(optionCasa, id: \.self) { option in
                                Text(option)
                            }
                        }
                        .pickerStyle(.segmented)
                        .padding()
                        
                        Text("O aluno(a) terminou com a pedra? ")
                        Picker("Selecione uma opção", selection: $selectedOptions[index].selectedRock) {
                            ForEach(optionRock, id: \.self) { option in
                                Text(option)
                            }
                        }
                        .pickerStyle(.segmented)
                        .padding()
                    }
                }
            }.listStyle(.plain)
            HStack{
                Button(action: {
                    // Ação para salvar as opções selecionadas
                    print("Opções selecionadas:", selectedOptions)
                }) {
                    Text("Salvar")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                .padding()
                HStack{
                    NavigationLink(destination: ContenteAR()) {
                        Text("ARView")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.blue)
                            .cornerRadius(10)
                    }
                }
            }
            
            Spacer()
        }
        .onAppear {
            // Inicialize as opções selecionadas para cada linha
            selectedOptions = Array(repeating: OptionSelection(selectedBody: optionsBody[0], selectedCasa: optionCasa[0], selectedRock: optionRock[0]), count: selectedStudents.count)
        }
    }
}


//struct ContentView: View {
//    var body: some View {
//        let selectedStudents = ["Aluno 1", "Aluno 2", "Aluno 3", "Aluno 4", "Aluno 5"]
//        CardView(selectedStudents: selectedStudents)
//    }
//}
//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
