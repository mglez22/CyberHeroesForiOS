//
//  FinViewController.swift
//  CyberHeroe
//
//  Created by Mario on 27/04/2018.
//  Copyright © 2018 Mario. All rights reserved.
//

import UIKit
import Firebase
import CoreData

class FinViewController: UIViewController {
    
    var users:[User] = []
    var historicos:[Historico] = []
    var historicosC1:[HistoricoC1] = []
    var historicosC2:[HistoricoC2] = []
    var historicosC3:[HistoricoC3] = []
    var historicosC4:[HistoricoC4] = []
    var historicosC5:[HistoricoC5] = []
    
    var rootRef:DatabaseReference!
    var handle: DatabaseHandle!
    var datosEnviados = false
    
    var managedContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    var userAge : String = ""
    var userSex : String = ""
    
    @IBAction func volverAInicio(_ sender: Any) {
        if !datosEnviados{
            enviarDatos()
            datosEnviados = true
        }
        
        Categorias.Categoria1.Finalizada = "False"
        Categorias.Categoria2.Finalizada = "False"
        Categorias.Categoria3.Finalizada = "False"
        Categorias.Categoria4.Finalizada = "False"
        Categorias.Categoria5.Finalizada = "False"
        Categorias.numeroIntentos = 0
        Categorias.Categoria1.numeroIntentos = 0
        Categorias.Categoria2.numeroIntentos = 0
        Categorias.Categoria3.numeroIntentos = 0
        Categorias.Categoria4.numeroIntentos = 0
        Categorias.Categoria5.numeroIntentos = 0

    self.navigationController?.popToRootViewController(animated: true)

    }
    @IBOutlet weak var botonInicio: UIButton!
    @IBAction func verResultados(_ sender: Any) {
        if !datosEnviados {
            enviarDatos()
            datosEnviados = true

        }
        self.tabBarController?.hidesBottomBarWhenPushed = false
        let gvc = self.tabBarController?.viewControllers![1] as! GraficosViewController
        gvc.userAge = userAge
        gvc.userSex = userSex
        self.tabBarController?.selectedViewController = gvc


    }
    @IBOutlet weak var botonResultados: UIButton!
    @IBOutlet weak var mensajeEnhorabuena: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
        actualizaHistorico()
        rootRef = Database.database().reference()
        botonInicio.layer.cornerRadius = 10
        botonResultados.layer.cornerRadius = 10

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func enviarDatos(){
        var intentos = ["","","","","",""]
        let id = self.rootRef.childByAutoId()
        id.child("edad").setValue(userAge)
        id.child("sexo").setValue(userSex)
        intentos[0] = "\(Categorias.numeroIntentos)"
        intentos[1] = "\(Categorias.Categoria1.numeroIntentos)"
        intentos[2] = "\(Categorias.Categoria2.numeroIntentos)"
        intentos[3] = "\(Categorias.Categoria3.numeroIntentos)"
        intentos[4] = "\(Categorias.Categoria4.numeroIntentos)"
        intentos[5] = "\(Categorias.Categoria5.numeroIntentos)"
        id.child("intentos").setValue(intentos)
        id.child("plataforma").setValue("iOS")
        
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
    
    
    func  actualizaHistorico(){
        print("Antes",historicos[Categorias.usuario].value(forKey: "ultima" as! String))
        //Guardamos y leemos el mdelo de datos
        let historicoUsuario = historicos[Categorias.usuario]
        let historicoUsuarioC1 = historicosC1[Categorias.usuario]
        let historicoUsuarioC2 = historicosC2[Categorias.usuario]
        let historicoUsuarioC3 = historicosC3[Categorias.usuario]
        let historicoUsuarioC4 = historicosC4[Categorias.usuario]
        let historicoUsuarioC5 = historicosC5[Categorias.usuario]
        
        let historicoUltima = historicoUsuario.value(forKey: "ultima")
        let historico2 = historicoUsuario.value(forKey: "hace2")
        let historico3 = historicoUsuario.value(forKey: "hace3")
        let historico4 = historicoUsuario.value(forKey: "hace4")
        
        let historicoUltimaC1 = historicoUsuarioC1.value(forKey: "ultima")
        let historico2C1 = historicoUsuarioC1.value(forKey: "hace2")
        let historico3C1 = historicoUsuarioC1.value(forKey: "hace3")
        let historico4C1 = historicoUsuarioC1.value(forKey: "hace4")
        
        let historicoUltimaC2 = historicoUsuarioC2.value(forKey: "ultima")
        let historico2C2 = historicoUsuarioC2.value(forKey: "hace2")
        let historico3C2 = historicoUsuarioC2.value(forKey: "hace3")
        let historico4C2 = historicoUsuarioC2.value(forKey: "hace4")
        
        let historicoUltimaC3 = historicoUsuarioC3.value(forKey: "ultima")
        let historico2C3 = historicoUsuarioC3.value(forKey: "hace2")
        let historico3C3 = historicoUsuarioC3.value(forKey: "hace3")
        let historico4C3 = historicoUsuarioC3.value(forKey: "hace4")
        
        let historicoUltimaC4 = historicoUsuarioC4.value(forKey: "ultima")
        let historico2C4 = historicoUsuarioC4.value(forKey: "hace2")
        let historico3C4 = historicoUsuarioC4.value(forKey: "hace3")
        let historico4C4 = historicoUsuarioC4.value(forKey: "hace4")
        
        let historicoUltimaC5 = historicoUsuarioC5.value(forKey: "ultima")
        let historico2C5 = historicoUsuarioC5.value(forKey: "hace2")
        let historico3C5 = historicoUsuarioC5.value(forKey: "hace3")
        let historico4C5 = historicoUsuarioC5.value(forKey: "hace4")
        
        //Actualizamos el historico
        historicoUsuario.setValue("\(Categorias.numeroIntentos)", forKey: "ultima")
        historicoUsuario.setValue(historicoUltima, forKey: "hace2")
        historicoUsuario.setValue(historico2, forKey: "hace3")
        historicoUsuario.setValue(historico3, forKey: "hace4")
        historicoUsuario.setValue(historico4, forKey: "hace5")
        
        historicoUsuarioC1.setValue("\(Categorias.Categoria1.numeroIntentos)", forKey: "ultima")
        historicoUsuarioC1.setValue(historicoUltimaC1, forKey: "hace2")
        historicoUsuarioC1.setValue(historico2C1, forKey: "hace3")
        historicoUsuarioC1.setValue(historico3C1, forKey: "hace4")
        historicoUsuarioC1.setValue(historico4C1, forKey: "hace5")
        
        historicoUsuarioC2.setValue("\(Categorias.Categoria2.numeroIntentos)", forKey: "ultima")
        historicoUsuarioC2.setValue(historicoUltimaC2, forKey: "hace2")
        historicoUsuarioC2.setValue(historico2C2, forKey: "hace3")
        historicoUsuarioC2.setValue(historico3C2, forKey: "hace4")
        historicoUsuarioC2.setValue(historico4C2, forKey: "hace5")
        
        historicoUsuarioC3.setValue("\(Categorias.Categoria3.numeroIntentos)", forKey: "ultima")
        historicoUsuarioC3.setValue(historicoUltimaC3, forKey: "hace2")
        historicoUsuarioC3.setValue(historico2C3, forKey: "hace3")
        historicoUsuarioC3.setValue(historico3C3, forKey: "hace4")
        historicoUsuarioC3.setValue(historico4C3, forKey: "hace5")
        
        historicoUsuarioC4.setValue("\(Categorias.Categoria4.numeroIntentos)", forKey: "ultima")
        historicoUsuarioC4.setValue(historicoUltimaC4, forKey: "hace2")
        historicoUsuarioC4.setValue(historico2C4, forKey: "hace3")
        historicoUsuarioC4.setValue(historico3C4, forKey: "hace4")
        historicoUsuarioC4.setValue(historico4C4, forKey: "hace5")
        
        historicoUsuarioC5.setValue("\(Categorias.Categoria5.numeroIntentos)", forKey: "ultima")
        historicoUsuarioC5.setValue(historicoUltimaC5, forKey: "hace2")
        historicoUsuarioC5.setValue(historico2C5, forKey: "hace3")
        historicoUsuarioC5.setValue(historico3C5, forKey: "hace4")
        historicoUsuarioC5.setValue(historico4C5, forKey: "hace5")
        
        print("Index Usuario", Categorias.usuario)
        print("Historico tras actualizar", historicoUsuario.value(forKey: "ultima") as! String)
        
        do{
            try managedContext.save()
        }catch  let error as NSError{
            print("no ha sido posible guardar"+"\(error)")
        }
    }
}
