//
//  VistaFila.swift
//  GestionAmigos
//
//  Created by Aula11 on 7/10/21.
//

import SwiftUI

struct VistaFilaAmigos: View {
    var amigoCurrent:Amigo
    
    var body: some View {
        HStack {
            amigoCurrent.imagen
                .resizable()
                .frame(width: 40, height: 40)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.white, lineWidth: 2))
                .shadow(color: Color.red, radius: 1)
            VStack(alignment: .leading) {
                Text(amigoCurrent.nombre)
                    .font(.subheadline)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .foregroundColor(Color.green)
                Text(amigoCurrent.telefono)
                    .font(.caption2)
                    .fontWeight(.medium)
            }
            Spacer()
            Image(systemName: amigoCurrent.favorito ? "star.fill" : "start")
                .foregroundColor(amigoCurrent.favorito ? .yellow : .gray)
        }.background(Color.white)
    }
}

struct VistaFila_Previews: PreviewProvider {
    static var previews: some View {
        /*
        List {
            VistaFila(amigoCurrent: amigoVM().arrAmigos[0])
            VistaFila(amigoCurrent: amigoVM().arrAmigos[1])
            VistaFila(amigoCurrent: amigoVM().arrAmigos[2])
        }

        List(amigoVM().arrAmigos) {
            VistaFila(amigoCurrent: $0)
            
        }
        
 */
        List {
            ForEach(AmigoViewModel().datos) {
                VistaFilaAmigos(amigoCurrent: $0)
            }
        }
        
    }
}
