//
//  AddClassView.swift
//  edTechHack
//
//  Created by Marcelo Araujo on 25/05/23.
//

import SwiftUI

struct AddClassView: View {
    @Environment(\.presentationMode) var presentationMode
        @Binding var classes: [Class]
        @State private var className: String = ""
        @State private var students: [String] = []
        @State private var newStudentName: String = ""
        
        var body: some View {
            NavigationView {
                Form {
                    Section(header: Text("Informações da Turma")) {
                        TextField("Nome da turma", text: $className)
                    }
                    
                    Section(header: Text("Estudantes")) {
                        ForEach(students, id: \.self) { studentName in
                            Text(studentName)
                        }
                        
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
                .navigationBarTitle("Cadastrar turma")
                .navigationBarItems(trailing: Button(action: {
                    if !className.isEmpty && !students.isEmpty {
                        classes.append(Class(name: className, students: students))
                        presentationMode.wrappedValue.dismiss()
                    }
                }) {
                    Text("Salvar")
                        .foregroundColor(.blue)
                        .font(.headline)
                })
            }
        }
}

//struct AddClassView_Previews: PreviewProvider {
//    static var previews: some View {
//        AddClassView()
//    }
//}
