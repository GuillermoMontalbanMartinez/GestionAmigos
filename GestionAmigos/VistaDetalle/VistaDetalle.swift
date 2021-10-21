//
//  VistaDetalle.swift
//  GestionAmigos
//
//  Created by Aula11 on 23/9/21.
//

import SwiftUI

struct VistaDetalle: View {
    @EnvironmentObject private var amigoVM: AmigoViewModel
    // var index: Int
    var amigo: Amigo
    
    var body: some View {
        ScrollView {
            VistaMapa(latitud: amigo.latitud, longitud: amigo.longitud).frame(width: 400, height: 250, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/).ignoresSafeArea()
            VistaImagen(imagenId: amigo.imagenID)
                .offset(x: 40,y: 10)
                .padding(-110)
            // VistaDatos(index: index, aboutMe: amigoVM.datos[index].about).padding(50)
            VistaDatos(aboutMe: amigo.about, amigo: amigo).padding(50)
        }
        .navigationTitle(amigo.nombre)
        .background(Color(red: 0.0, green: 188.0 / 255.0, blue: 1.0))
        .ignoresSafeArea()
        .navigationBarTitleDisplayMode(.inline)
    }
}

/*
struct VistaDetalle_Previews: PreviewProvider {
    static var previews: some View {
        VistaDetalle().environmentObject(amigoVM())
            
    }
}
*/


