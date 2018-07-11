//
//  PresentacionViewController.swift
//  CyberHeroe
//
//  Created by Mario on 15/04/2018.
//  Copyright © 2018 Mario. All rights reserved.
//

import UIKit

class PresentacionViewController: UIViewController {
    
    //Variables
    var userName : String = ""
    var userAge : String = ""
    var userSex : String = ""

    
//Creacion de Controllers, y comienzod del juego
    @IBAction func comenzarJuego(_ sender: Any) {
        let tabBarController = UITabBarController()
        let resultado =  self.storyboard?.instantiateViewController(withIdentifier: "GraficosViewController") as! GraficosViewController
        let category =  self.storyboard?.instantiateViewController(withIdentifier: "CategoryViewController") as! CategoryViewController
        let navigationController = UINavigationController(rootViewController:category)
        let controllers = [navigationController,resultado]
        
        category.userAge = userAge
        category.userSex = userSex
        resultado.userAge = userAge
        resultado.userSex = userSex
        
        tabBarController.viewControllers = controllers
        navigationController.tabBarItem.image = UIImage(named:"icon_menu")
        resultado.tabBarItem.image = UIImage(named:"icon_medal")
        resultado.tabBarItem.title = "Resultados"
        navigationController.tabBarItem.title = "Inicio"

        tabBarController.tabBar.barTintColor = UIColor.white
        tabBarController.tabBar.tintColor = UIColor.red
        self.show(tabBarController, sender: botonComenzar)
    }

    @IBOutlet var botonComenzar: UIView!
    @IBOutlet weak var textoBienvenida: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        botonComenzar.layer.cornerRadius = 10
        textoBienvenida.text = "¡ Bienvenido a CYBERHEROES " + userName + " ! \n \n ¿Listo para demostrar que eres todo un experto en el uso seguro de internet? \n \n Responde a todas nuestras categorías de preguntas correctamente, y... \n \n ¡CONVIERTE EN NUESTRO CYBERHEROE !"
        textoBienvenida.layer.cornerRadius = 10
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
