//
//  edTechHackApp.swift
//  edTechHack
//
//  Created by Marcelo Araujo on 25/05/23.
//

import SwiftUI

@main
struct edTechHackApp: App {
    var body: some Scene {
        WindowGroup {
//            ContentView()
            LoginView()
                .preferredColorScheme(.light)
        }
    }
}
