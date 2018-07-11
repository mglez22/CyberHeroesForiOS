//
//  ConsejoViewController.swift
//  CyberHeroe
//
//  Created by Mario on 24/04/2018.
//  Copyright © 2018 Mario. All rights reserved.
//

import UIKit

class ConsejoCorrectoViewController: UIViewController {
    var consejo :  String!
   
    @IBOutlet weak var mensajeConsejo: UITextView!
    @IBAction func botonSiguientePulsado(_ sender: Any) {
   self.navigationController?.popToRootViewController(animated: true)
    }
    @IBOutlet weak var siguienteBoton: UIButton!
    
    @IBOutlet weak var textoCorrecto: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        self.navigationItem.hidesBackButton = true
        
        mensajeConsejo.layer.cornerRadius = 10
        textoCorrecto.layer.masksToBounds = true
        textoCorrecto.layer.cornerRadius = 10
        siguienteBoton.layer.cornerRadius = 10
        mensajeConsejo.text = consejo!
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
