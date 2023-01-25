//
//  JMLoginBL.swift
//  JorgeM
//
//  Created by user213342 on 11/10/22.
//

import UIKit

class JMLoginBL: NSObject{
    class func InsertLogin(usuario: JMLoginBE){}
    class func Insertlogin(user: JMLoginBE, completion: () -> Void, errorCompletion:(_ errorMessage:String)-> Void) {
    
        if user.user == ""{
            errorCompletion("falta nombre")
        }else if user.password == ""{
            errorCompletion("falta contraseña")
        }
        else{}
        
        
        //agregar al usuario
    }
}

