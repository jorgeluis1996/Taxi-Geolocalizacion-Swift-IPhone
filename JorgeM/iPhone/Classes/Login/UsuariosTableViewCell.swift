//
//  UsuariosTableViewCell.swift
//  JorgeM
//
//  Created by user213342 on 11/7/22.
//

import UIKit

class UsuariosTableViewCell: UITableViewCell {

    @IBOutlet weak var lblnombre: UILabel!
    
    @IBOutlet weak var lblapellido: UILabel!
    
    @IBOutlet weak var lblcorreo: UILabel!
    
    @IBOutlet weak var lblcontraseña: UILabel!
    
    @IBOutlet weak var lblcelular: UILabel!
    
    func loadData(usuario:Usuario){
        self.lblnombre.text = usuario.nombre
        self.lblapellido.text = usuario.apellido
        self.lblcorreo.text = usuario.correo
        self.lblcontraseña.text = usuario.contrase
        self.lblcelular.text = usuario.celular
    }

}
