//
//  ListCell.swift
//  edTechHack
//
//  Created by Sarah dos Santos Silva on 26/05/23.
//

import SwiftUI

struct Cell: View {
    @State private var isSelected = false
    let nome: String
    let onCheckmarkTapped: (Bool) -> Void
    @State private var selectColor = false
    @State private var color: Color?
    
    var body: some View {
        VStack {
            HStack {
                VStack {
                    Text(nome)
                        .font(.headline)
                }
                .padding()
                
                Spacer()
                
                VStack {
                    HStack(spacing: 50) {
                        Image(systemName: "largecircle.fill.circle")
                            .font(.body)
                            .foregroundColor(color)
                            
    
                            .onTapGesture {
                                selectColor.toggle()
                            }
                            .sheet(isPresented: $selectColor) {
                                SheetColor(onColorSelected: { selectedColor in
                                    self.color = selectedColor
                                })
                            }
                        if isSelected {
                            Image(systemName: "checkmark.square")
                                .font(.body)
                                .foregroundColor(Color.green)
                        } else {
                            Image(systemName: "square")
                                .font(.body)
                                .foregroundColor(Color.red)
                        }
                    }
                    .onTapGesture {
                        isSelected.toggle()
                        onCheckmarkTapped(isSelected)
                    }
                }
            }
        }
    }
}

struct ListCell: View {
    @State var students: [String]
    @State var selectedStudents: [String] = []
    
    var body: some View {
        VStack {
            Text("Alunos:")
                .font(.title)
            
            List {
                ForEach(students, id: \.self) { student in
                    Cell(nome: student) { isSelected in
                        if isSelected {
                            selectedStudents.append(student)
                        } else {
                            if let index = selectedStudents.firstIndex(of: student) {
                                selectedStudents.remove(at: index)
                            }
                        }
                    }.padding()
                }
            }
            .listStyle(.grouped)
            
            NavigationLink(destination: CardView(selectedStudents: selectedStudents)) {
                Text("Start game")
                    .foregroundColor(.white)
                    .font(.headline)
                    .padding()
                    .frame(width: 200, height: 50)
                    .background(Color.blue)
                    .cornerRadius(8)
            }
        }
    }
}

//struct NextView: View {
//    var selectedStudents: [String]
//    
//    var body: some View {
//        VStack {
//            Text("Selected Students:")
//                .font(.title)
//            List(selectedStudents, id: \.self) { student in
//                Text(student)
//            }
//        }
//    }
//}

    
    
//    struct ListCell_Previews: PreviewProvider {
//        static var previews: some View {
//            Cell()
//        }
//    }

