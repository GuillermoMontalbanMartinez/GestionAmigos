//
//  ListaAmigos.swift
//  GestionAmigos
//
//  Created by Aula11 on 7/10/21.
//

import SwiftUI

struct BusquedaView: View {
    @Binding var text: String
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .resizable()
                .frame(width: 45, height: 45, alignment: .center)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.white, lineWidth: 2))
                .shadow(color: .white, radius: 50).foregroundColor(text.isEmpty ? Color(UIColor.gray).opacity(0.4) : Color(UIColor.gray).opacity(0.9))
            
            TextField("Buscar ...", text: $text)
            
            Button() {
                text = ""
            }label: {
                Image(systemName: "x.circle")
                    .resizable()
                    .frame(width: 45, height: 45, alignment: .center)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 2))
                    .shadow(color: .white, radius: 50)
            }.opacity(text.isEmpty ? 0.0 : 1.0)
        }
    }
}


struct VistaListaAmigos: View {
    @EnvironmentObject var amigoVM: AmigoViewModel
    @State var soloFavoritos = false
    @State var query:String = ""
    @State var enEdicion:Bool = false
    
    var body: some View {
            NavigationView {
                VStack {
                    BusquedaView(text:$query)
                    List() {
                        Toggle(isOn: $soloFavoritos) {
                            Text("Mostrar solo los favoritos")
                        }
                        
                        ForEach(0..<amigoVM.datos.count) { amigo in
                            if !soloFavoritos || amigoVM.datos[amigo].favorito {
                                if query.isEmpty {
                                    NavigationLink(destination: VistaDetalle(index: amigo, amigo: amigoVM.datos[amigo])) {
                                        VistaFilaAmigos(amigoCurrent: amigoVM.datos[amigo])}
                                } else {
                                    if amigoVM.datos[amigo].nombre.lowercased().contains(query.lowercased()) {
                                        NavigationLink(destination: VistaDetalle(index: amigo, amigo: amigoVM.datos[amigo])) {
                                                VistaFilaAmigos(amigoCurrent: amigoVM.datos[amigo])}
                                    }
                                }
                            }
                            
                        }.onDelete {indexSet in
                            amigoVM.datos.remove(atOffsets: indexSet)
                        }
                    }.navigationTitle("Amigos")
                        .navigationBarItems(leading: Button() {
                            enEdicion.toggle()
                        } label: {
                            Text(enEdicion ? "Cancelar" : "Editar")
                                .font(.title)
                                .foregroundColor(Color.blue)
                                .shadow(color: Color(red: 0.28, green: 0.855, blue: 0.92), radius: 9)
                            
                        }, trailing: Button() {
                            amigoVM.datos.append(Amigo(nombre: "nuevoAmigo", imagenID: "Person"))
                        } label:  {
                            Image(systemName: "plus.circle")
                                .font(.title)
                                .foregroundColor(Color.red)
                                .shadow(color: Color.pink, radius: 9)
                        })
                        .environment(\.editMode, .constant(enEdicion ? EditMode.active : EditMode.inactive))
                }
                
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

struct VistaListaAmigos_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
