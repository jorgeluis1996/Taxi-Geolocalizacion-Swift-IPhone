//
//  JMPasswBE.swift
//  JorgeM
//
//  Created by user213342 on 11/10/22.
//

import UIKit

class JMPasswBE: NSObject {
    var correo: String
    var password1: String
    var password2: String

    
    init(correo: String, password1: String, password2: String) {
        self.correo = correo
        self.password1 = password1
        self.password2 = password2
    }
}
