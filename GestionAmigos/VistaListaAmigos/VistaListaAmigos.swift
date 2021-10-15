//
//  ListaAmigos.swift
//  GestionAmigos
//
//  Created by Aula11 on 7/10/21.
//

import SwiftUI


struct VistaListaAmigos: View {
    @EnvironmentObject var amigoVM: AmigoViewModel
    @State var soloFavoritos = false

    
    var body: some View {
            NavigationView {
                List() {
                    Toggle(isOn: $soloFavoritos) {
                        Text("Mostrar solo los favoritos")
                    }
                    
                    ForEach(0..<amigoVM.arrAmigos.count) { amigo in
                        if !soloFavoritos || amigoVM.arrAmigos[amigo].favorito {
                            NavigationLink(destination: VistaDetalle(index: amigo)) {
                                VistaFilaAmigos(amigoCurrent: amigoVM.arrAmigos[amigo])
                            }
                        }
                    }
                }.navigationTitle("Amigos")
            }
    }
}

/*
struct ListaVistaAmigos_Previews: PreviewProvider {
    static var previews: some View {
        VistaListaAmigos(about: .constant("hola"))
            .environmentObject(AmigoViewModel())
    }
}
*/
/*
struct VistaListaAmigos_Previews: PreviewProvider {
    static var previews: some View {
        VistaListaAmigos().environmentObject(AmigoViewModel())
    }
}
*/
