//
//  PasswordViewController.swift
//  JorgeM
//
//  Created by user213342 on 11/5/22.
//

import UIKit

protocol NewpassViewControllerDelegate{
    func InsertPassw(pass: JMPasswBE)
}

class PasswordViewController: UIViewController,UITextFieldDelegate {

    /*@IBOutlet weak var txtnombre: UITextField!
    
    @IBOutlet weak var txtapellido: UITextField!
    
    @IBOutlet weak var txtcorreo: UITextField!
    

    @IBOutlet weak var txtpassword1: UITextField!
    
    @IBOutlet weak var txtphone: UITextField!*/
    
    
    @IBOutlet weak var txtcorreo: UITextField!
    
    @IBOutlet weak var txtpassnew: UITextField!
    
    @IBOutlet weak var txtpassnew2: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var btnPassword: UIButton!
    
    var activeField: UITextField!
    
    var delegate : NewpassViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func irLogin2(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func irLoginAC(_ sender: Any) {
        
    }
    @IBAction func actionChangePassword(_ sender: Any) {
        //if JMPasswBL.InsertPassw(correo: txtcorreo.text, password1: txtpassnew.text, password2: txtpassnew2.text){
        //} else {
        let passwo = JMPasswBE(correo: txtcorreo.text ?? "", password1:  txtpassnew.text ?? "", password2:txtpassnew2.text ?? "")
                
        JMPasswBL.InsertPassw(pass: passwo) {
            self.delegate?.InsertPassw(pass: passwo)
            self.dismiss(animated: true, completion: nil)
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
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.registerForKeyboardNotifications()
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.deregisterFromKeyboardNotifications()
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
        if textField == self.txtcorreo{
            return self.txtpassnew.becomeFirstResponder()
        } else if textField == self.txtpassnew{
            return self.txtpassnew2.becomeFirstResponder()
            
        }
        else {
            
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


