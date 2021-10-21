//
//  VistaIdentificacion.swift
//  GestionAmigos
//
//  Created by Aula11 on 14/10/21.
//

import SwiftUI

struct VistaIdentificacion: View {
    @AppStorage("userName") var userName: String?
    @State var cambiarNombre: Bool = false
    @State var currentUserName = ""
    var body: some View {
        VStack {
            Spacer()
            Image("LogoLPS")
                .resizable()
                .frame(width: 300, height: 200,alignment: .center)
                .clipShape(RoundedRectangle(cornerRadius: 50))
                .overlay(RoundedRectangle(cornerRadius: 50).stroke(Color.white, lineWidth: 4))
                .shadow(color: Color.gray, radius: 39)
                .padding()
            
            Spacer()
            HStack {
                Text("Hola \(currentUserName.isEmpty ? "desconocid@":currentUserName)")
                    .font(.title)
                    .foregroundColor(.black)
                Button() {
                    withAnimation {
                        cambiarNombre.toggle()
                    }
                } label: {
                    Image(systemName: "keyboard")
                        .foregroundColor(.red)
                }
                if cambiarNombre {
                    TextField("¿Cuál es tu nombre?", text: $currentUserName)
                        .onDisappear {userName = currentUserName}
                }
                
            }
            .onAppear {
                currentUserName = userName ?? ""
            }.onDisappear {
                userName = currentUserName
            }
            Spacer()
            Spacer()
        }.background(Color.white)
            .ignoresSafeArea()
    }
}

struct VistaIdentificacion_Previews: PreviewProvider {
    static var previews: some View {
        VistaIdentificacion()
    }
}
