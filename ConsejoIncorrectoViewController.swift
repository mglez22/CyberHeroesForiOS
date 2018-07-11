//
//  ConsejoIncorrectoViewController.swift
//  CyberHeroe
//
//  Created by Mario on 29/04/2018.
//  Copyright © 2018 Mario. All rights reserved.
//

import UIKit

class ConsejoIncorrectoViewController: UIViewController {

    var pregunta :String!
    var consejo : String!
    
    @IBOutlet weak var botonSiguiente: UIButton!
   
    @IBOutlet weak var mensajeConsejo: UITextView!
    @IBOutlet weak var incorrectoTexto: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        self.navigationItem.hidesBackButton = true
        botonSiguiente.layer.cornerRadius = 10
        mensajeConsejo.layer.cornerRadius = 10
        incorrectoTexto.layer.masksToBounds = true
        incorrectoTexto.layer.cornerRadius = 10
        mensajeConsejo.text = consejo!
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func botonSiguientePulsado(_ sender: Any) {
    self.navigationController?.popToRootViewController(animated: true)
     
    }
}
