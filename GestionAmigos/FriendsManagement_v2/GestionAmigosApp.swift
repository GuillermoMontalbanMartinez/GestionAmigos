//
//  GestionAmigosApp.swift
//  GestionAmigos
//
//  Created by Aula11 on 23/9/21.
//

import SwiftUI

@main
struct GestionAmigosApp: App {
    @StateObject private var amigoVM = AmigoViewModel()
    var body: some Scene {
        WindowGroup {
            VistaMain().environmentObject(amigoVM)
        }
    }
}
