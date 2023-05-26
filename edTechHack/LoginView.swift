//
//  LoginView.swift
//  edTechHack
//
//  Created by Marcelo Araujo on 25/05/23.
//

import SwiftUI

struct LoginView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var isLogged: Bool = false
    
    var body: some View {
        NavigationView {
            VStack {
                Image("logoLogin")
                    .resizable()
                    .frame(width: 200, height: 200)
                
                Text("Login")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding()
                
                TextField("Nome de usuário", text: $username)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(8)
                    .padding(.horizontal)
                
                SecureField("Senha", text: $password)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(8)
                    .padding(.horizontal)
                
                
                
                
                Button(action: {
                    if username == "" && password == "" {
                        isLogged = true
                    }
                }) {
                    Text("Login")
                        .foregroundColor(.white)
                        .font(.headline)
                        .padding()
                        .frame(width: 200, height: 50)
                        .background(Color.blue)
                        .cornerRadius(8)
                }
                .padding()
                
                NavigationLink(destination: ClassesListView(), isActive: $isLogged) {
//                    ClassesListView()
                }
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
