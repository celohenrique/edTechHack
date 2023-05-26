//
//  ClassDetailView.swift
//  edTechHack
//
//  Created by Marcelo Araujo on 25/05/23.
//

import SwiftUI

struct ClassDetailView: View {
    @State private var className: String
    @State private var students: [String]
    @State private var newStudentName: String = ""
        
        init(classItem: Class) {
            self._className = State(initialValue: classItem.name)
            self._students = State(initialValue: classItem.students)
        }
        
        var body: some View {
            Form {
                Section(header: Text("Informações da Turma")) {
                    TextField("Nome da turma", text: $className)
                }
                
                Section(header: Text("Estudantes")) {
                    ForEach(students, id: \.self) { studentName in
                        Text(studentName)
                    }
                    .onDelete(perform: removeStudent)
                    
                    HStack {
                        TextField("Novo estudante", text: $newStudentName)
                        Button(action: {
                            if !newStudentName.isEmpty {
                                students.append(newStudentName)
                                newStudentName = ""
                            }
                        }) {
                            Image(systemName: "plus.circle.fill")
                        }
                    }
                }
            }
            .navigationBarTitle(className)
        }
        
        private func removeStudent(at offsets: IndexSet) {
            students.remove(atOffsets: offsets)
        }
    }


struct Class: Identifiable {
    var id = UUID()
    var name: String
    var students: [String]
}
