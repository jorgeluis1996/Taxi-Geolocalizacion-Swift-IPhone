//
//  EditPerfilViewController.swift
//  JorgeM
//
//  Created by user213342 on 12/3/22.
//

import UIKit

class EditPerfilViewController: UIViewController, UITextFieldDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        addDoneButtonOnKeyboard()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func regresar(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func guardar(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
                
    
    @IBOutlet weak var txtnombre: UITableView!
    
    @IBOutlet weak var txtapellido: UITextField!
    
    @IBOutlet weak var txtnumero: UITextField!
    @IBOutlet weak var txtcorreo: UITextField!
    //    @IBOutlet weak var txtapellido: UITableView!
//    @IBOutlet weak var txtcorreo: UITableView!
//    @IBOutlet weak var txtnumero: UITableView!
    
    
    @IBOutlet weak var tableView: UITableView!
    var activeField: UITextField!
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.registerForKeyboardNotifications()
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.deregisterFromKeyboardNotifications()
    }
    
    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        self.txtnumero.text = "\(number)"
//        addDoneButtonOnKeyboard()
//        // Do any additional setup after loading the view.
//    }
    
    func addDoneButtonOnKeyboard(){
            let doneToolbar: UIToolbar = UIToolbar(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50))
            doneToolbar.barStyle = .default

            let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
            let done: UIBarButtonItem = UIBarButtonItem(title: "Aceptar", style: .done, target: self, action: #selector(self.doneButtonAction))

            let items = [flexSpace, done]
            doneToolbar.items = items
            doneToolbar.sizeToFit()

            txtnumero.inputAccessoryView = doneToolbar
        }

        @objc func doneButtonAction(){
            txtnumero.resignFirstResponder()
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
            return self.txtnumero.becomeFirstResponder()
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
