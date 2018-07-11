//
//  CategoryViewController.swift
//  CyberHeroe
//
//  Created by Mario on 18/04/2018.
//  Copyright © 2018 Mario. All rights reserved.
//

import UIKit

class CategoryViewController: UIViewController {
    
    //Variables
    @IBOutlet weak var iconoPhone: UIImageView!
    @IBOutlet weak var iconoSocial: UIImageView!
    @IBOutlet weak var iconoPhising: UIImageView!
    @IBOutlet weak var iconoInternet: UIImageView!
    @IBOutlet weak var iconoCredencial: UIImageView!
    var timer = Timer()
    var segundos = 1.5
    var nPulsaciones = 0
    var categoria : Int = 0
    var pregunta : Int = 0
    var userAge : String = ""
    var userSex : String = ""
    
    @IBOutlet weak var botonContestar: UIButton!

    
    override func viewDidLoad() {
        super.viewDidLoad()
    self.navigationController?.setNavigationBarHidden(true, animated: true)
        self.tabBarController?.selectedIndex = 0
        botonContestar.layer.cornerRadius = 10
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillAppear(_ animated: Bool){
        super.viewWillAppear(animated)
        nPulsaciones = 0
        if Categorias.Categoria1.Finalizada == "True"{
            iconoCredencial.alpha = 0.3
        }else{
            iconoCredencial.alpha = 1
        }
        if Categorias.Categoria2.Finalizada == "True"{
            iconoPhising.alpha = 0.3
        }else{
            iconoPhising.alpha = 1
        }
        if Categorias.Categoria3.Finalizada == "True"{
            iconoSocial.alpha = 0.3
        }else{
            iconoSocial.alpha = 1
        }
        if Categorias.Categoria4.Finalizada == "True"{
            iconoPhone.alpha = 0.3
        }else{
            iconoPhone.alpha = 1
        }
        if Categorias.Categoria5.Finalizada == "True"{
            iconoInternet.alpha = 0.3
        }else{
            iconoInternet.alpha = 1
        }
        
    }
    
//Categoria Aleatoria


    @IBAction func contestarPulsado(_ sender: Any) {
        if nPulsaciones<1{
            nPulsaciones += 1
            if categoriasPendientes(){
                preguntaAleatoria()
                runTimer()
                
            }
            else{
                let viewController =  self.storyboard?.instantiateViewController(withIdentifier: "FinViewController") as! FinViewController
                
                viewController.userAge = userAge
                viewController.userSex = userSex
                
                self.navigationController?.pushViewController(viewController, animated: true)
                
            }
            
        }else{}
    }
    
    func mostrarPregunta(){
        let viewController =  self.storyboard?.instantiateViewController(withIdentifier: "PreguntaViewController") as! PreguntaViewController
        
        viewController.nPregunta = pregunta
        viewController.nCategoria = categoria
        self.navigationController?.pushViewController(viewController, animated: true)
     
    }

    func preguntaAleatoria() {
        let indice: UInt32 = arc4random_uniform(_:5)
        switch indice {
        case 0:
            if Categorias.Categoria1.Finalizada == "False"{
                iconoCredencial.transform = CGAffineTransform(scaleX: 0, y: 0)
                UIView.animate(withDuration: 2, delay: 0, usingSpringWithDamping: 0.4, initialSpringVelocity: 0.2, animations: {
                    self.iconoCredencial.transform = CGAffineTransform.identity
                }, completion: nil)
                categoria = 0
                let indiceP: UInt32 = arc4random_uniform(_:6)
                pregunta = Int(indiceP)
            }
            else {
                preguntaAleatoria()
            }
        case 1:
            if Categorias.Categoria2.Finalizada == "False"{
                iconoPhising.transform =  CGAffineTransform(scaleX: 0, y: 0)
                UIView.animate(withDuration: 2, delay: 0, usingSpringWithDamping: 0.4, initialSpringVelocity: 0.2, animations: {
                    self.iconoPhising.transform = CGAffineTransform.identity
                }, completion: nil)
                categoria = 1
                let indiceP: UInt32 = arc4random_uniform(_:6)
                pregunta = Int(indiceP)
            }
            else{
                preguntaAleatoria()
            }
        case 2:
            if Categorias.Categoria3.Finalizada == "False"{
                iconoSocial.transform = CGAffineTransform(scaleX: 0, y: 0)
                UIView.animate(withDuration: 2, delay: 0, usingSpringWithDamping: 0.4, initialSpringVelocity: 0.2, animations: {
                    self.iconoSocial.transform = CGAffineTransform.identity
                }, completion: nil)
                categoria = 2
                let indiceP: UInt32 = arc4random_uniform(_:6)
                pregunta = Int(indiceP)
            }
            else {
                preguntaAleatoria()
            }
        case 3:
            if Categorias.Categoria4.Finalizada == "False"{
                iconoPhone.transform =  CGAffineTransform(scaleX: 0, y: 0)
                UIView.animate(withDuration: 2, delay: 0, usingSpringWithDamping: 0.4, initialSpringVelocity: 0.2, animations: {
                    self.iconoPhone.transform = CGAffineTransform.identity
                }, completion: nil)
                categoria = 3
                let indiceP: UInt32 = arc4random_uniform(_:6)
                pregunta = Int(indiceP)
            }
            else{
                preguntaAleatoria()
            }
        case 4:
            if Categorias.Categoria5.Finalizada == "False"{
                iconoInternet.transform =  CGAffineTransform(scaleX: 0, y: 0)
                UIView.animate(withDuration: 2, delay: 0, usingSpringWithDamping: 0.4, initialSpringVelocity: 0.2, animations: {
                    self.iconoInternet.transform = CGAffineTransform.identity
                }, completion: nil)
                categoria = 4
                let indiceP: UInt32 = arc4random_uniform(_:6)
                pregunta = Int(indiceP)
            }
            else{
                preguntaAleatoria()
            }
        default:
            return
        }
    }
    
    func categoriasPendientes() -> Bool{
        let cat1 = Categorias.Categoria1.Finalizada
        let cat2 = Categorias.Categoria2.Finalizada
        let cat3 = Categorias.Categoria3.Finalizada
        let cat4 = Categorias.Categoria4.Finalizada
        let cat5 = Categorias.Categoria5.Finalizada
        
        return cat1 == "False" || cat2 == "False" || cat3 == "False" || cat4 == "False" || cat5 == "False"
    }
    
    @objc func updateTimer(){
        segundos -= 0.5
        if segundos == 0 {
            timer.invalidate()
            segundos = 1.5
            mostrarPregunta()
        }
    }
    
    func runTimer() {
        timer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
}
