//
//  JMPasswBL.swift
//  JorgeM
//
//  Created by user213342 on 11/10/22.
//

import UIKit

class JMPasswBL: NSObject {
   // class func InsertPassw(correo: String?, password1: String?, password2: String?) -> Bool {
       // if correo?.count == 0{
        //    print("falta correo")
        //    return false
       // }
       // if password1?.count == 0 {
        //    print("falta contraseña nuevo")
        //    return false
       // }
       // if password2?.count == 0 {
       //     print("falta contraseña de repeticion")
       //     return false
       // }
      //  print("inicia")
       // return true
        
        //agregar al usuario
    //}
    class func InsertPassw(pass: JMPasswBE, completion: () -> Void, errorCompletion:(_ errorMessage:String)-> Void) {
        
    if pass.correo == ""{
        errorCompletion("falta correo")
    } else if pass.password1 == "" {
        errorCompletion("falta pass1")
    } else if pass.password2 == "" {
        errorCompletion("falta pass2")
    } else {
            completion()
    }
    
    //agregar al usuario
    
    
}
    class func getData() -> [Usuario]? {
        JMUsuariosDA.getData()
    }
}
    
    
