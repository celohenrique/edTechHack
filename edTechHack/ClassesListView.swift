//
//  ClassesListView.swift
//  edTechHack
//
//  Created by Marcelo Araujo on 25/05/23.
//

import SwiftUI

struct ClassesListView: View {
    @State private var showAddClass: Bool = false
    @State private var isEditing: Bool = false
    @State private var classes: [Class] = [] // Lista de turmas
    
    var body: some View {

        VStack {
            if classes.isEmpty {
                Text("Olá, usuário")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding()
                
                Text("Onde vamos jogar hoje?")
                    .font(.headline)
                    .padding()
                
                Button(action: {
                    showAddClass.toggle()
                }) {
                    Text("Cadastrar turma")
                        .foregroundColor(.white)
                        .font(.headline)
                        .padding()
                        .frame(width: 200, height: 50)
                        .background(Color.blue)
                        .cornerRadius(8)
                }
                .padding()
            } else {
                Text("Olá, usuário")
                Text("Onde vamos jogar hoje?")
                
                List {
                    ForEach(classes.indices, id: \.self) { index in
                        if isEditing {
                            NavigationLink(destination: ClassDetailView(classItem: classes[index])) {
                                Text(classes[index].name)
                            }
                        } else {
                            Text(classes[index].name)
                      
                        }
                    }
                    .onDelete(perform: delete)
                }
                .listStyle(GroupedListStyle())
                .environment(\.editMode, .constant(isEditing ? EditMode.inactive : EditMode.active)) // Enables swipe to delete
                
                Button(action: {
                    showAddClass.toggle()
                }) {
                    Text("Cadastrar turma")
                        .foregroundColor(.white)
                        .font(.headline)
                        .padding()
                        .frame(width: 200, height: 50)
                        .background(Color.blue)
                        .cornerRadius(8)
                }
            }
        }
        .toolbar {
            if !classes.isEmpty {
                Button(action: {
                    isEditing.toggle()
                }) {
                    Text(isEditing ? "Concluir" : "Editar")
                        .foregroundColor(.blue)
                        .font(.headline)
                }
            }
        }
        .sheet(isPresented: $showAddClass) {
            AddClassView(classes: $classes)
        }
    
}
    private func delete(at offsets: IndexSet) {
        classes.remove(atOffsets: offsets)
    }
        
}
    

struct ClassesListView_Previews: PreviewProvider {
    static var previews: some View {
        ClassesListView()
    }
}
