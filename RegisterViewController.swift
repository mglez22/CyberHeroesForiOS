//
//  RegisterViewController.swift
//  CyberHeroe
//
//  Created by Mario on 13/04/2018.
//  Copyright © 2018 Mario. All rights reserved.
//

import UIKit
import CoreData

class RegisterViewController: UIViewController, UITextFieldDelegate {
    
    //Variables
    @IBOutlet weak var botonLogin: UIButton!
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var userPass: UITextField!
    @IBOutlet weak var userSex: UITextField!
    @IBOutlet weak var userAge: UITextField!
    @IBOutlet weak var botonRegistrar: UIButton!
    
    var managedContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        botonRegistrar.isEnabled = false
        botonRegistrar.alpha = 0.3
        botonRegistrar.layer.cornerRadius = 10
        userAge.delegate = self
        userPass.delegate = self
        userSex.delegate = self
        userName.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //Botones de registro o login
    
    @IBAction func input1Changed(_ sender: Any) {
        inputChanged()
    }
    
    @IBAction func inputChanged2(_ sender: Any) {
        inputChanged()
    }
   
    @IBAction func inptuChanged3(_ sender: Any) {
        inputChanged()
    }
    
    @IBAction func inputChanged4(_ sender: Any) {
        inputChanged()
    }
    
    @IBAction func register(_ sender: Any) {
       saveUser()
    }
    
    @IBAction func showLoginVc(_ sender: Any) {
      
        let viewController =  self.storyboard?.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        self.show(viewController, sender:botonLogin )
        
    }
    
    private func inputChanged() {
        
        if (userSex.text != "" && userAge.text != "" && userName.text != "" && userPass.text != ""){
            botonRegistrar.isEnabled = true
            botonRegistrar.alpha = 1
        }
    }
    
    func  saveUser(){
        
        let user = NSEntityDescription.insertNewObject(forEntityName: "User", into: managedContext)
         let historico = NSEntityDescription.insertNewObject(forEntityName: "Historico", into: managedContext)
        let historicoC1 = NSEntityDescription.insertNewObject(forEntityName: "HistoricoC1", into: managedContext)
        let historicoC2 = NSEntityDescription.insertNewObject(forEntityName: "HistoricoC2", into: managedContext)
        let historicoC3 = NSEntityDescription.insertNewObject(forEntityName: "HistoricoC3", into: managedContext)
        let historicoC4 = NSEntityDescription.insertNewObject(forEntityName: "HistoricoC4", into: managedContext)
        let historicoC5 = NSEntityDescription.insertNewObject(forEntityName: "HistoricoC5", into: managedContext)
        
        user.setValue(userName.text!, forKey: "name")
        user.setValue(userPass.text!, forKey: "pass")
        user.setValue(userAge.text!, forKey: "age")
        user.setValue(userSex.text!, forKey: "sex")
        
        historico.setValue("0", forKey: "ultima")
        historico.setValue("0", forKey: "hace2")
        historico.setValue("0", forKey: "hace3")
        historico.setValue("0", forKey: "hace4")
        historico.setValue("0", forKey: "hace5")
        
        historicoC1.setValue("0", forKey: "ultima")
        historicoC1.setValue("0", forKey: "hace2")
        historicoC1.setValue("0", forKey: "hace3")
        historicoC1.setValue("0", forKey: "hace4")
        historicoC1.setValue("0", forKey: "hace5")
        
        historicoC2.setValue("0", forKey: "ultima")
        historicoC2.setValue("0", forKey: "hace2")
        historicoC2.setValue("0", forKey: "hace3")
        historicoC2.setValue("0", forKey: "hace4")
        historicoC2.setValue("0", forKey: "hace5")
        
        historicoC3.setValue("0", forKey: "ultima")
        historicoC3.setValue("0", forKey: "hace2")
        historicoC3.setValue("0", forKey: "hace3")
        historicoC3.setValue("0", forKey: "hace4")
        historicoC3.setValue("0", forKey: "hace5")
        
        historicoC4.setValue("0", forKey: "ultima")
        historicoC4.setValue("0", forKey: "hace2")
        historicoC4.setValue("0", forKey: "hace3")
        historicoC4.setValue("0", forKey: "hace4")
        historicoC4.setValue("0", forKey: "hace5")
        
        historicoC5.setValue("0", forKey: "ultima")
        historicoC5.setValue("0", forKey: "hace2")
        historicoC5.setValue("0", forKey: "hace3")
        historicoC5.setValue("0", forKey: "hace4")
        historicoC5.setValue("0", forKey: "hace5")
        
        do{
            try managedContext.save()
            showVC()
        }catch  let error as NSError{
            print("no ha sido posible guardar"+"\(error)")
        }
    }
    
    func showVC() {
        let viewController =  self.storyboard?.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        self.show(viewController, sender:botonRegistrar )
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

