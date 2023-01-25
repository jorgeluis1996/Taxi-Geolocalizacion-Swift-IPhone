//
//  JMUsuariosDA.swift
//  JorgeM
//
//  Created by user213342 on 11/7/22.
//

import UIKit
import CoreData

class JMUsuariosDA: NSObject {
    
    class func save(usuario: JMUsuariosBE){
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let managedContext = appDelegate.persistentContainer.viewContext
        
        guard let entity = NSEntityDescription.insertNewObject(forEntityName: "Usuario", into: managedContext) as? Usuario  else { return }
        
        entity.nombre = usuario.nombre
        entity.apellido = usuario.apellido
        entity.correo = usuario.correo
        entity.contrase = usuario.contrase
        entity.celular = usuario.celular
        
        appDelegate.saveContext()
    }
    class func getData () -> [Usuario]? {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest : NSFetchRequest<Usuario> = Usuario.fetchRequest()
        do {
            return try managedContext.fetch(fetchRequest)
        }catch {
            print("No se pudo acceder a la BD")
            return nil
        }
    }
}
