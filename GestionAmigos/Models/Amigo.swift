//
//  Amigo.swift
//  GestionAmigos
//
//  Created by Aula11 on 7/10/21.
//

import Foundation
import SwiftUI

struct Amigo:Identifiable {
    var id = UUID().uuidString
    var nombre: String
    var telefono: String = "000000000"
    var email: String = "nuevo@gmailing.com"
    var about: String = "Tu opinión"
    var imagenID: String
    var imagen: Image  {
        Image(imagenID)
    }
    var latitud: Double = 0.0
    var longitud: Double = 0.0
    var favorito: Bool = false
    var mensajes: [Mensaje] = []
}

