//
//  PerfilViewController.swift
//  JorgeM
//
//  Created by user213342 on 12/3/22.
//

import UIKit

class PerfilViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func RegresarLogin(_ sender: Any) {
        self.showAlertView(errorMessage: "¿Estas Seguro de que quieres cerrar la sesión?") {
            self.navigationController?.popToRootViewController(animated: true)
        }
       
    }
    
    @IBAction func regresar(_ sender: Any) {
        //        let alert = UIAlertController(title: "error", message: "mensaje", preferredStyle: .alert)
        //        present(alert, animated: true)
        navigationController?.popViewController(animated: true)
    }
    
    func showAlertView(errorMessage : String, handlerAction :(()->Void)?) {
        let alert : UIAlertController = UIAlertController(title: "Alerta", message: errorMessage, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Aceptar", style: .destructive, handler: {(action) in  handlerAction?()
        }))
        alert.addAction(UIAlertAction(title: "Cancelar", style: .cancel))
        self.present(alert, animated: true, completion: nil)
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
