//
//  VistaMain.swift
//  GestionAmigos
//
//  Created by Aula11 on 14/10/21.
//

import SwiftUI

struct VistaMain: View {
    @EnvironmentObject var amigoVM: AmigoViewModel
    @State var seleccion: Int = 0
    var body: some View {
        TabView(selection: $seleccion) {
            VistaIdentificacion()
                .tabItem {
                    Image(systemName: "signature")
                    Text("Identificación")
                }.tag(0)
            VistaListaAmigos().environmentObject(amigoVM)
                .tabItem {
                    Image(systemName: "bell")
                    Text("Lista de amigos")
                }.tag(1)
            VistaChat().environmentObject(amigoVM)
                .tabItem {
                    Image(systemName: "person.3")
                    Text("Chat")
                }.tag(2)
        }
    }
}

struct VistaMain_Previews: PreviewProvider {
    static var previews: some View {
        VistaMain()
    }
}
