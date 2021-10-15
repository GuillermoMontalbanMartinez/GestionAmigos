//
//  amigoVM.swift
//  GestionAmigos
//
//  Created by Aula11 on 7/10/21.
//

import Foundation

final class AmigoViewModel: ObservableObject {
    @Published var arrAmigos: [Amigo] =  [
        Amigo(nombre: "Steve Wozniak", telefono: "60728596888", email: "wozniak@apple.com", about: "Steve Wozniak es un fundador e inventor del primero ordenador personal del mundo", imagenID: "wozniak", latitud: 37.442955908106285, longitud: -122.15955458955288, favorito: true),
        Amigo(nombre: "Steve jobs", telefono: "60728596887", email: "sjobs@apple.com", about: "Steve jobs fundador y CEO de apple computer y Next, y CEO de pixar", imagenID: "jobs", latitud: 37.33125060136892, longitud: -122.00712401500229, favorito: false),
        Amigo(nombre: "Jonathan Ive", telefono: "6078596889", email: "jive@apple.com", about: "Jonathan Ive es diseñador de apple y jefe de diseño de apple Computer", imagenID: "ive", latitud: 37.3357548116387, longitud: -122.01210219454461, favorito: false)
    ]
}

 
