//
//  JMUsuarioBL.swift
//  JorgeM
//
//  Created by user213342 on 11/7/22.
//

import UIKit

class JMUsuarioBL: NSObject {
    class func agregarUsuario(usuario: JMUsuariosBE, completion: () -> Void, errorCompletion:(_ errorMessage:String)-> Void) {
        
        if usuario.nombre == ""{
            errorCompletion("falta nombre")
        } else if usuario.apellido == "" {
            errorCompletion("falta apellido")
        } else if usuario.correo == "" {
            errorCompletion("falta correo")
        } else if usuario.contrase == "" {
            errorCompletion("falta contraseña")
        } else if usuario.celular == "" {
            errorCompletion("falta numero de celular")
        } else {
            JMUsuariosDA.save(usuario: usuario)
            	completion()
        }
        
        //agregar al usuario
        
        
    }

    
    class func getData() -> [Usuario]? {
        JMUsuariosDA.getData()
    }
}
