//
//  ListCell.swift
//  edTechHack
//
//  Created by Sarah dos Santos Silva on 26/05/23.
//

import SwiftUI

struct Cell: View{
    
    @State var checkmark: Bool = false
    @State var nome: String
    @State private var selectColor = false
    @State private var color: Color?

    
    var body: some View {
        VStack{
            HStack{
                VStack{
                    Text(nome)
                        .font(.title3)
                    Text("Titulo")
                        .font(.subheadline)
                }
                .padding()
                Spacer()
                VStack{
                    HStack(spacing: 50){
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
                                if !checkmark {
                                    Image(systemName: "square")
                                        .font(.body)
                                        .foregroundColor(Color.red)
                                        .onTapGesture {
                                            checkmark.toggle()
                                        }
                                }
                                else{
                                    Image(systemName: "checkmark.square")
                                        .font(.body)
                                        .foregroundColor(Color.green)
                                        .onTapGesture {
                                            checkmark.toggle()
                                        }
                                }
                            }
                    }
                    Spacer()
                    
                }
            }
        }
    }
    
    struct ListCell: View {
        @State var students: [String]
        
        var body: some View {
            VStack {
                Text("Alunos:")
                    .font(.title)
                List{
                    ForEach(students, id: \.self) { student in
                        Cell(nome: student)
                    }
                }.listStyle(.grouped)
            }
        }
    }
    
    
//    struct ListCell_Previews: PreviewProvider {
//        static var previews: some View {
//            Cell()
//        }
//    }
