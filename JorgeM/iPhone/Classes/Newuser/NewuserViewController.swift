//
//  NewuserViewController.swift
//  JorgeM
//
//  Created by user213342 on 11/2/22.
//

import UIKit

protocol NewuserViewControllerDelegate{
    func agregarUsuario(usuario: JMUsuariosBE)
}

class NewuserViewController: UIViewController, UITextFieldDelegate	 {

    
    
    @IBOutlet weak var txtnombre: UITextField!
    
    @IBOutlet weak var txtapellido: UITextField!
    
    @IBOutlet weak var txtcorreo: UITextField!
    
	
    @IBOutlet weak var txtpassword1: UITextField!
    
    @IBOutlet weak var txtphone: UITextField!
    
    @IBOutlet weak var tableView: UITableView!
    
    
    var activeField: UITextField!
    
    var number : Int = 51
     //crear
    var delegate : NewuserViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.txtphone.text = "\(number)"
        addDoneButtonOnKeyboard()
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.registerForKeyboardNotifications()
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.deregisterFromKeyboardNotifications()
    }
    
    @IBAction func irLogin(_ sender: Any) {dismiss(animated: true, completion: nil)
    }
    //boton crear cuenta
    @IBAction func actionCrearCuenta(_ sender: Any) {
        let usuario = JMUsuariosBE(nombre: txtnombre.text ?? "", apellido: txtapellido.text ?? "", correo: txtcorreo.text ?? "", contrase: txtpassword1.text ?? "", celular: txtphone.text ?? "")
                
        JMUsuarioBL.agregarUsuario(usuario: usuario) {
            self.delegate?.agregarUsuario(usuario: usuario)
            self.navigationController?.popViewController(animated: true)
        } errorCompletion: { errorMessage in
            let alert = UIAlertController(title: "Alerta", message: errorMessage, preferredStyle: .alert)
            let acceptButton = UIAlertAction(title: "Aceptar", style: .destructive) { _ in
                    print("Presiono aceptar")
                }
            let cancelButton = UIAlertAction(title: "Cancelar", style: .cancel) { _ in
                    print("Presiono cancelar")
                }
            alert.addAction(acceptButton)
            alert.addAction(cancelButton)
            self.present(alert, animated: true)

        }
    }
    
    
    func addDoneButtonOnKeyboard(){
            let doneToolbar: UIToolbar = UIToolbar(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50))
            doneToolbar.barStyle = .default

            let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
            let done: UIBarButtonItem = UIBarButtonItem(title: "Aceptar", style: .done, target: self, action: #selector(self.doneButtonAction))

            let items = [flexSpace, done]
            doneToolbar.items = items
            doneToolbar.sizeToFit()

            txtphone.inputAccessoryView = doneToolbar
        }

        @objc func doneButtonAction(){
            txtphone.resignFirstResponder()
        }
    func registerForKeyboardNotifications(){
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWasShown(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillBeHidden(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    func deregisterFromKeyboardNotifications(){
        NotificationCenter.default.removeObserver(self, name:
            UIResponder.keyboardWillShowNotification,object: nil)
        NotificationCenter.default.removeObserver(self, name:
            UIResponder.keyboardWillHideNotification,object: nil)
    }
    
    @objc func keyboardWasShown(notification: NSNotification){
        
        self.tableView.isScrollEnabled=true
        let info = notification.userInfo!
        let keyboardSize = (info[UIResponder.keyboardFrameEndUserInfoKey] as?
                            NSValue)?.cgRectValue.size
        let contentInsets : UIEdgeInsets = UIEdgeInsets (top:0.0, left: 0.0, bottom: keyboardSize!.height, right:0.0)
        self.tableView.contentInset = contentInsets
        self.tableView.scrollIndicatorInsets = contentInsets
        
        var aRect : CGRect = self.view.frame
            aRect.size.height -= keyboardSize!.height
        if let activeField = self.activeField {
            if (!aRect.contains(activeField.frame.origin)){
                self.tableView.scrollRectToVisible(activeField.frame,  animated: true)
            }
        }
    }
    @objc func keyboardWillBeHidden(notification: NSNotification){
        
        
        let info = notification.userInfo!
        let keyboardSize = (info[UIResponder.keyboardFrameEndUserInfoKey] as?
                            NSValue)?.cgRectValue.size
        let contentInsets : UIEdgeInsets = UIEdgeInsets (top:0.0, left: 0.0, bottom: -keyboardSize!.height, right:0.0)
        self.tableView.contentInset = UIEdgeInsets.zero
        self.tableView.scrollIndicatorInsets = contentInsets
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == self.txtnombre{
            return self.txtapellido.becomeFirstResponder()
        } else if textField == self.txtapellido{
            return self.txtcorreo.becomeFirstResponder()
        } else if textField == self.txtcorreo{
            return self.txtpassword1.becomeFirstResponder()
        } else if textField == self.txtpassword1{
            return self.txtphone.becomeFirstResponder()
        } else {
            
            return textField.resignFirstResponder()
        }
        
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.activeField=textField
    }
    
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        self.activeField=nil
    }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */




