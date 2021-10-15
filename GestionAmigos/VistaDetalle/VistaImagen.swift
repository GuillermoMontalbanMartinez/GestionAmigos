//
//  VistaImagen.swift
//  GestionAmigos
//
//  Created by Aula11 on 23/9/21.
//

import SwiftUI

struct VistaImagen: View {
    var imagenId:String
    let colors: [Color] = [.gray, .red, .orange, .yellow, .green, .blue, .purple, .pink]
    @State private var fgColor: Color = .green
    var body: some View {
        Image(imagenId)
            .resizable()
            .frame(width: 150, height: 150, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.white,lineWidth: 2))
            .shadow(color: fgColor, radius: 9)
            .ignoresSafeArea().onTapGesture (count: 1, perform: {
                fgColor = colors.randomElement()!
            })
    }
}

/*
struct VistaImagen_Previews: PreviewProvider {
    static var previews: some View {
        VistaImagen()
    }
}
*/

