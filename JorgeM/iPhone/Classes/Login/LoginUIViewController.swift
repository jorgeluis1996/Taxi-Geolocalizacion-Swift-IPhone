//
//  LoginUIViewController.swift
//  JorgeM
//
//  Created by user213342 on 11/2/22.
//

import UIKit

class LoginUIViewController: UIViewController, UITextFieldDelegate {

    
    @IBOutlet weak var txtuser: UITextField!
    @IBOutlet weak var txtpassword: UITextField!
    @IBOutlet weak var tblvUsuarios: UITableView!
    
    var arrayUsuarios : [Usuario]?
    
    @IBOutlet weak var btnLogin: UIButton!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //arrayUsuarios.append(JMUsuariosBE(nombre: "Jorge", apellido: "Muñiz", correo: "mjorgito29", contraseña: "tr3s", celular: "9455121"))

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool){
        super.viewWillAppear(animated)
        self.registerForKeyboardNotifications()
        self.getData()
    }
    
    
    private func getData(){
        self.arrayUsuarios = JMUsuarioBL.getData()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == self.txtuser{
            return self.txtpassword.becomeFirstResponder()
        }
        else {
            
            return textField.resignFirstResponder()
        }
        
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("textFieldDidBeginEditing")
    }
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBAction func actionLogin(_ sender: Any){
      //  if JMLoginBL.Insertlogin(usuario: txtuser.text,password: txtpassword.text){
      //  } else {
        let user = JMLoginBE(user: txtuser.text ?? "", password: txtpassword.text ?? "")
         
        JMLoginBL.Insertlogin(user: user) {
            
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
    var activeField: UITextField!
    //momentaneo
    //var arrayUsuarios = [JMUsuariosBE]()
        
    
    
    
    
    

        // Do any additional setup after loading the view.
    
    
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
        
        self.scrollView.isScrollEnabled=true
        let info = notification.userInfo!
        let keyboardSize = (info[UIResponder.keyboardFrameEndUserInfoKey] as?
                            NSValue)?.cgRectValue.size
        let contentInsets : UIEdgeInsets = UIEdgeInsets (top:0.0, left: 0.0, bottom: keyboardSize!.height, right:0.0)
        self.scrollView.contentInset = contentInsets
        self.scrollView.scrollIndicatorInsets = contentInsets
        
        var aRect : CGRect = self.view.frame
            aRect.size.height -= keyboardSize!.height
        if let activeField = self.activeField {
            if (!aRect.contains(activeField.frame.origin)){
                self.scrollView.scrollRectToVisible(activeField.frame,  animated: true)
            }
        }
    }
    @objc func keyboardWillBeHidden(notification: NSNotification){
        
        
        let info = notification.userInfo!
        let keyboardSize = (info[UIResponder.keyboardFrameEndUserInfoKey] as?
                            NSValue)?.cgRectValue.size
        let contentInsets : UIEdgeInsets = UIEdgeInsets (top:0.0, left: 0.0, bottom: -keyboardSize!.height, right:0.0)
        self.scrollView.contentInset = UIEdgeInsets.zero
        self.scrollView.scrollIndicatorInsets = contentInsets
        self.view.endEditing(true)
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let controller = segue.destination as? NewuserViewController{
            controller.delegate = self
        }
             // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    

}



extension LoginUIViewController: NewuserViewControllerDelegate{
    func agregarUsuario(usuario: JMUsuariosBE) {
        //self.arrayUsuarios.append(usuario)
        self.tblvUsuarios.reloadData()
    }
    
    
    
    
    
}
extension LoginUIViewController: UITableViewDataSource {


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayUsuarios?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "UsuariosTableViewCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! UsuariosTableViewCell
        cell.loadData(usuario: (arrayUsuarios?[indexPath.row])!)
        return cell
    }
}
