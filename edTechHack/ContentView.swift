//
//  ContentView.swift
//  edTechHack
//
//  Created by Marcelo Araujo on 25/05/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var classes = [Class]()
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
