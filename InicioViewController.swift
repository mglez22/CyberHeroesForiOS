//
//  InicioViewController.swift
//  CyberHeroe
//
//  Created by Mario on 14/04/2018.
//  Copyright © 2018 Mario. All rights reserved.
//

import UIKit

class InicioViewController: UIViewController {
    
   @IBAction func showLoginVc(_ sender: Any) {
        let viewController =  self.storyboard?.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        self.show(viewController, sender:botonLogin )
    }
    @IBOutlet weak var botonRegistro: UIButton!
    @IBOutlet weak var botonLogin: UIButton!
    
       
    @IBAction func showRegistroVc(_ sender: Any) {
        let viewController =  self.storyboard?.instantiateViewController(withIdentifier: "RegisterViewController") as! RegisterViewController
        self.show(viewController, sender:botonRegistro )
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        botonRegistro.layer.cornerRadius = 10
        botonLogin.layer.cornerRadius = 10
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
