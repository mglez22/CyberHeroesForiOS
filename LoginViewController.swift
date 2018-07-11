//
//  ViewController.swift
//  CyberHeroe
//
//  Created by Mario on 19/03/2018.
//  Copyright © 2018 Mario. All rights reserved.
//

import UIKit
import CoreData

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    //Variables
    var users:[User] = []
    var historicos:[Historico] = []
    var historicosC1:[HistoricoC1] = []
    var historicosC2:[HistoricoC2] = []
    var historicosC3:[HistoricoC3] = []
    var historicosC4:[HistoricoC4] = []
    var historicosC5:[HistoricoC5] = []

    
    @IBAction func showRegistroVc(_ sender: Any) {
        let viewController =  self.storyboard?.instantiateViewController(withIdentifier: "RegisterViewController") as! RegisterViewController
        self.show(viewController, sender:registrarse )
    }
    
    @IBOutlet weak var registrarse: UIButton!
    
   
    @IBOutlet weak var labelC: UILabel!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var userTextField: UITextField!
    @IBOutlet weak var labelU: UILabel!
    @IBOutlet weak var botonLogin: UIButton!
    
    var userLogedName: String!
    var userLogedPass: String!
    var userLogedAge: String!
    var userLogedSex: String!
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.fetchData()
        botonLogin.layer.cornerRadius = 10
        botonLogin.isEnabled = false
        botonLogin.alpha = 0.3
        userTextField.delegate = self
        passwordTextField.delegate = self
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func inputChanged1(_ sender: Any) {
        inputChanged()
    }
    
    @IBAction func inputChanged2(_ sender: Any) {
        inputChanged()
    }

    //Logeo
    @IBAction func login(_ sender: Any) {
        if getUserData(name: userTextField.text!,userPass: passwordTextField.text!){
            let viewController =  self.storyboard?.instantiateViewController(withIdentifier: "PresentacionViewController") as! PresentacionViewController
            viewController.userName = userLogedName
            viewController.userAge = userLogedAge
            viewController.userSex = userLogedSex
            self.show(viewController, sender:botonLogin )
        }
        else{
            showAlert()
        }
    }
    func fetchData(){
          let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        do{
            users = try context.fetch(User.fetchRequest())
            historicos = try context.fetch(Historico.fetchRequest())
            historicosC1 = try context.fetch(HistoricoC1.fetchRequest())
            historicosC2 = try context.fetch(HistoricoC2.fetchRequest())
            historicosC3 = try context.fetch(HistoricoC3.fetchRequest())
            historicosC4 = try context.fetch(HistoricoC4.fetchRequest())
            historicosC5 = try context.fetch(HistoricoC5.fetchRequest())

        }catch{
            print(error)
        }
    }
    
    func getUserData(name:String!,userPass:String!)->Bool{
       
       for usuario in users{
        
           if let userName = usuario.value(forKey: "name") as? String
            ,let userPassword = usuario.value(forKey: "pass") as? String{
            
            if name==userName && userPassword==userPass{
                userLogedAge = usuario.value(forKey: "age") as! String
                userLogedSex = usuario.value(forKey: "sex") as! String
                userLogedName = userName
                userLogedPass = userPassword
                Categorias.usuario = users.index(of: usuario)!
                asignaHistorico(usuario)
                return true
            }
            }
            
        }
        return false
    }
    
    private func inputChanged() {
        
        if (userTextField.text != "" && passwordTextField.text != ""){
            botonLogin.isEnabled = true
             botonLogin.alpha = 1
        }
    }
    
    func showAlert(){
        let alert = UIAlertController(title: "Login Fallido",message:"Intentalo de Nuevo",preferredStyle: .alert)
        alert.addAction(UIAlertAction(title:NSLocalizedString("OK", comment: "Default action"),style: .`default`,handler: {_ in}))
        self.present(alert,animated: true,completion: nil)
        userTextField.text = ""
        passwordTextField.text = ""
        self.fetchData()
        botonLogin.isEnabled = false
        botonLogin.alpha = 0.3
    }
    
    private func asignaHistorico(_ user : User){
       
       user.historico = historicos[Categorias.usuario]
       user.historicoc1 = historicosC1[Categorias.usuario]
       user.historicoc2 = historicosC2[Categorias.usuario]
       user.historicoc3 = historicosC3[Categorias.usuario]
       user.historicoc4 = historicosC4[Categorias.usuario]
       user.historicoc5 = historicosC5[Categorias.usuario]
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

