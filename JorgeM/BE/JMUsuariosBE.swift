//
//  JMUsuariosBE.swift
//  JorgeM
//
//  Created by user213342 on 11/7/22.
//

import UIKit

class JMUsuariosBE: NSObject {
    
    var nombre: String
    var apellido: String
    var correo: String
    var contrase: String
    var celular: String
    
    init(nombre: String, apellido: String, correo: String, contrase: String, celular: String){
        self.nombre = nombre
        self.apellido = apellido
        self.correo = correo
        self.contrase = contrase
        self.celular = celular
    }
}
