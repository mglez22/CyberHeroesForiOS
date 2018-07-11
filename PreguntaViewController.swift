//
//  PreguntaViewController.swift
//  CyberHeroe
//
//  Created by Mario on 18/04/2018.
//  Copyright © 2018 Mario. All rights reserved.
//

import UIKit

class PreguntaViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //Variables
    var nPregunta : Int!
    var nCategoria : Int!
    var pregunta : String!
    var respuestas: [String]!
    var titulo: String!
    var timerLab = ""
    var segundos = 35
    var timer = Timer()
    var timerIsRunning = false
    
    
    @IBOutlet weak var tableView: UITableView!
    
    // Configuracion Table View
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footer = UIView(frame: CGRect(x:0, y:0, width:tableView.frame.size.width, height: 5))
        footer.backgroundColor = UIColor.blue
        return footer
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if section == 0{
        return 10
        }
        else{
            return 0
        }
    
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return 3
        case 2:
            return 1
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 140
        case 2:
            return 50
        default:
            return 80
        }
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "PreguntaTableViewCell", for: indexPath) as! PreguntaTableViewCell
            cell.pregunta.text = pregunta
            cell.backgroundColor = UIColor.white
            cell.pregunta.textColor = UIColor.black
           
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "RespuestaTableViewCell", for: indexPath) as! RespuestaTableViewCell
            cell.backgroundColor = UIColor.red
            cell.respuesta.textColor = UIColor.black
            
            if indexPath.row == 0{
            cell.respuesta.text = respuestas[0]
            }
            if indexPath.row == 1{
                cell.respuesta.text = respuestas[1]
            }
            if indexPath.row == 2{
                cell.respuesta.text = respuestas[2]
            }
            return cell
      
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "MarcadorTableViewCell", for: indexPath) as! MarcadorTableViewCell
            cell.timer.text = timerLab
            cell.intentos.text = "Nº de intentos total: " + "\(Categorias.numeroIntentos)"
            cell.backgroundColor = UIColor(red: 0,green: 0, blue: 255, alpha: 1)
            cell.timer.textColor = UIColor.white
            cell.intentos.textColor = UIColor.white
            return cell
        default:
            let cell = UITableViewCell(style: .default, reuseIdentifier: "")
            return  cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.section {
        case 1:
            timer.invalidate()
            segundos = 35
            if indexPath.row == 0{
                if respuestas[3] == "A" {
                    categoriaRespondida()
                    let viewController =  self.storyboard?.instantiateViewController(withIdentifier: "ConsejoCorrectoViewController") as! ConsejoCorrectoViewController
                    viewController.consejo = respuestas[4]
                    self.navigationController?.pushViewController(viewController, animated: true)
                }
                else {
                    let viewController =  self.storyboard?.instantiateViewController(withIdentifier: "ConsejoIncorrectoViewController") as! ConsejoIncorrectoViewController
                    viewController.consejo = respuestas[4]
                    self.navigationController?.pushViewController(viewController, animated: true)
                }
            }
            if indexPath.row == 1{
                if respuestas[3] == "B" {
                    categoriaRespondida()
                    let viewController =  self.storyboard?.instantiateViewController(withIdentifier: "ConsejoCorrectoViewController") as! ConsejoCorrectoViewController
                    viewController.consejo = respuestas[4]
                    self.navigationController?.pushViewController(viewController, animated: true)
                }
                else {
                    let viewController =  self.storyboard?.instantiateViewController(withIdentifier: "ConsejoIncorrectoViewController") as! ConsejoIncorrectoViewController
                    viewController.consejo = respuestas[4]
                    self.navigationController?.pushViewController(viewController, animated: true)
                }
            }
            if indexPath.row == 2{
                if respuestas[3] == "C" {
                    categoriaRespondida()
                    let viewController =  self.storyboard?.instantiateViewController(withIdentifier: "ConsejoCorrectoViewController") as! ConsejoCorrectoViewController
                    viewController.consejo = respuestas[4]
                    self.navigationController?.pushViewController(viewController, animated: true)
                }
                else {
                    let viewController =  self.storyboard?.instantiateViewController(withIdentifier: "ConsejoIncorrectoViewController") as! ConsejoIncorrectoViewController
                    viewController.consejo = respuestas[4]
                   self.navigationController?.pushViewController(viewController, animated: true)
                }
            }
        default:
            return
        }
    }
   
    //Configuracin del Timer
  @objc func updateTimer(){
        segundos -= 1
        if segundos < 10{
            timerLab = "00:" + "0" + "\(segundos)"
        }else{
            timerLab = "00:" + "\(segundos)"
        }
        if segundos == 0 {
            timer.invalidate()
            segundos = 35
            let viewController =  self.storyboard?.instantiateViewController(withIdentifier: "ConsejoIncorrectoViewController") as! ConsejoIncorrectoViewController
            
            viewController.consejo = respuestas [4]
        self.navigationController?.pushViewController(viewController, animated: true)
        }
       tableView.reloadData()
        
    }
    
    func runTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    //Seleccion de preguntas y Respuestas
    
    func seleccionPregunta()->String{
        Categorias.numeroIntentos = Categorias.numeroIntentos + 1
        switch nCategoria {
        case 0:
            Categorias.Categoria1.numeroIntentos = Categorias.Categoria1.numeroIntentos + 1
            switch nPregunta{
                case 0:
                    return Categorias.Categoria1.Preguntas.Pregunta1.Pregunta
                case 1:
                    return Categorias.Categoria1.Preguntas.Pregunta2.Pregunta
                case 2:
                    return Categorias.Categoria1.Preguntas.Pregunta3.Pregunta
                case 3:
                    return Categorias.Categoria1.Preguntas.Pregunta4.Pregunta
                case 4:
                    return Categorias.Categoria1.Preguntas.Pregunta5.Pregunta
                case 5:
                    return Categorias.Categoria1.Preguntas.Pregunta6.Pregunta
                case 6:
                    return Categorias.Categoria1.Preguntas.Pregunta7.Pregunta
             
                default:
                    return ""
            }
        case 1:
           Categorias.Categoria2.numeroIntentos = Categorias.Categoria2.numeroIntentos + 1
            switch nPregunta{
            case 0:
                return Categorias.Categoria2.Preguntas.Pregunta1.Pregunta
            case 1:
                return Categorias.Categoria2.Preguntas.Pregunta2.Pregunta
            case 2:
                return Categorias.Categoria2.Preguntas.Pregunta3.Pregunta
            case 3:
                return Categorias.Categoria2.Preguntas.Pregunta4.Pregunta
            case 4:
                return Categorias.Categoria2.Preguntas.Pregunta5.Pregunta
            case 5:
                return Categorias.Categoria2.Preguntas.Pregunta6.Pregunta
            case 6:
                return Categorias.Categoria2.Preguntas.Pregunta7.Pregunta
       
            default:
                return ""
            }
        case 2:
            Categorias.Categoria3.numeroIntentos = Categorias.Categoria3.numeroIntentos + 1
            switch nPregunta{
            case 0:
                return Categorias.Categoria3.Preguntas.Pregunta1.Pregunta
            case 1:
                return Categorias.Categoria3.Preguntas.Pregunta2.Pregunta
            case 2:
                return Categorias.Categoria3.Preguntas.Pregunta3.Pregunta
            case 3:
                return Categorias.Categoria3.Preguntas.Pregunta4.Pregunta
            case 4:
                return Categorias.Categoria3.Preguntas.Pregunta5.Pregunta
            case 5:
                return Categorias.Categoria3.Preguntas.Pregunta6.Pregunta
            case 6:
                return Categorias.Categoria3.Preguntas.Pregunta7.Pregunta
       
            default:
                return ""
            }
        case 3:
            Categorias.Categoria4.numeroIntentos = Categorias.Categoria4.numeroIntentos + 1
            switch nPregunta{
            case 0:
                return Categorias.Categoria4.Preguntas.Pregunta1.Pregunta
            case 1:
                return Categorias.Categoria4.Preguntas.Pregunta2.Pregunta
            case 2:
                return Categorias.Categoria4.Preguntas.Pregunta3.Pregunta
            case 3:
                return Categorias.Categoria4.Preguntas.Pregunta4.Pregunta
            case 4:
                return Categorias.Categoria4.Preguntas.Pregunta5.Pregunta
            case 5:
                return Categorias.Categoria4.Preguntas.Pregunta6.Pregunta
            case 6:
                return Categorias.Categoria4.Preguntas.Pregunta7.Pregunta
        
            default:
                return ""
            }
        case 4:
            Categorias.Categoria5.numeroIntentos = Categorias.Categoria5.numeroIntentos + 1
            switch nPregunta{
            case 0:
                return Categorias.Categoria5.Preguntas.Pregunta1.Pregunta
            case 1:
                return Categorias.Categoria5.Preguntas.Pregunta2.Pregunta
            case 2:
                return Categorias.Categoria5.Preguntas.Pregunta3.Pregunta
            case 3:
                return Categorias.Categoria5.Preguntas.Pregunta4.Pregunta
            case 4:
                return Categorias.Categoria5.Preguntas.Pregunta5.Pregunta
            case 5:
                return Categorias.Categoria5.Preguntas.Pregunta6.Pregunta
            case 6:
                return Categorias.Categoria5.Preguntas.Pregunta7.Pregunta
       
            default:
                return ""
            }
        default:
            return ""
        }
    }
    
    func seleccionRespuesta()->[String]{
        switch nCategoria {
        case 0:
            titulo  = Categorias.Categoria1.Nombre
            switch nPregunta{
            case 0:
                var respuestas: [String] = ["","","","",""]
                respuestas[0] = Categorias.Categoria1.Preguntas.Pregunta1.RespuestaA.respuesta
                respuestas[1] = Categorias.Categoria1.Preguntas.Pregunta1.RespuestaB.respuesta
                respuestas[2] = Categorias.Categoria1.Preguntas.Pregunta1.RespuestaC.respuesta
                respuestas[3] = Categorias.Categoria1.Preguntas.Pregunta1.correcta
                respuestas[4] = Categorias.Categoria1.Preguntas.Pregunta1.consejo

                return respuestas
            case 1:
                var respuestas: [String] = ["","","","",""]
                respuestas[0] = Categorias.Categoria1.Preguntas.Pregunta2.RespuestaA.respuesta
                respuestas[1] = Categorias.Categoria1.Preguntas.Pregunta2.RespuestaB.respuesta
                respuestas[2] = Categorias.Categoria1.Preguntas.Pregunta2.RespuestaC.respuesta
                respuestas[3] = Categorias.Categoria1.Preguntas.Pregunta2.correcta
                respuestas[4] = Categorias.Categoria1.Preguntas.Pregunta1.consejo

                return respuestas
            case 2:
                var respuestas: [String] = ["","","","",""]
                respuestas[0] = Categorias.Categoria1.Preguntas.Pregunta3.RespuestaA.respuesta
                respuestas[1] = Categorias.Categoria1.Preguntas.Pregunta3.RespuestaB.respuesta
                respuestas[2] = Categorias.Categoria1.Preguntas.Pregunta3.RespuestaC.respuesta
                respuestas[3] = Categorias.Categoria1.Preguntas.Pregunta3.correcta
                respuestas[4] = Categorias.Categoria1.Preguntas.Pregunta1.consejo

                return respuestas
            case 3:
                var respuestas: [String] = ["","","","",""]
                respuestas[0] = Categorias.Categoria1.Preguntas.Pregunta4.RespuestaA.respuesta
                respuestas[1] = Categorias.Categoria1.Preguntas.Pregunta4.RespuestaB.respuesta
                respuestas[2] = Categorias.Categoria1.Preguntas.Pregunta4.RespuestaC.respuesta
                respuestas[3] = Categorias.Categoria1.Preguntas.Pregunta4.correcta
                respuestas[4] = Categorias.Categoria1.Preguntas.Pregunta1.consejo

                return respuestas
            case 4:
                var respuestas: [String] = ["","","","",""]
                respuestas[0] = Categorias.Categoria1.Preguntas.Pregunta5.RespuestaA.respuesta
                respuestas[1] = Categorias.Categoria1.Preguntas.Pregunta5.RespuestaB.respuesta
                respuestas[2] = Categorias.Categoria1.Preguntas.Pregunta5.RespuestaC.respuesta
                respuestas[3] = Categorias.Categoria1.Preguntas.Pregunta5.correcta
                respuestas[4] = Categorias.Categoria1.Preguntas.Pregunta1.consejo

                return respuestas
            case 5:
                var respuestas: [String] = ["","","","",""]
                respuestas[0] = Categorias.Categoria1.Preguntas.Pregunta6.RespuestaA.respuesta
                respuestas[1] = Categorias.Categoria1.Preguntas.Pregunta6.RespuestaB.respuesta
                respuestas[2] = Categorias.Categoria1.Preguntas.Pregunta6.RespuestaC.respuesta
                respuestas[3] = Categorias.Categoria1.Preguntas.Pregunta6.correcta
                respuestas[4] = Categorias.Categoria1.Preguntas.Pregunta1.consejo

                return respuestas
            case 6:
                var respuestas: [String] = ["","","","",""]
                respuestas[0] = Categorias.Categoria1.Preguntas.Pregunta7.RespuestaA.respuesta
                respuestas[1] = Categorias.Categoria1.Preguntas.Pregunta7.RespuestaB.respuesta
                respuestas[2] = Categorias.Categoria1.Preguntas.Pregunta7.RespuestaC.respuesta
                respuestas[3] = Categorias.Categoria1.Preguntas.Pregunta7.correcta
                respuestas[4] = Categorias.Categoria1.Preguntas.Pregunta1.consejo

                return respuestas
                
            default:
                return []
            }
        case 1:
            titulo  = Categorias.Categoria2.Nombre
            switch nPregunta{
            case 0:
                var respuestas: [String] = ["","","","",""]
                respuestas[0] = Categorias.Categoria2.Preguntas.Pregunta1.RespuestaA.respuesta
                respuestas[1] = Categorias.Categoria2.Preguntas.Pregunta1.RespuestaB.respuesta
                respuestas[2] = Categorias.Categoria2.Preguntas.Pregunta1.RespuestaC.respuesta
                respuestas[3] = Categorias.Categoria2.Preguntas.Pregunta1.correcta
                respuestas[4] = Categorias.Categoria2.Preguntas.Pregunta1.consejo
                return respuestas
            case 1:
                var respuestas: [String] = ["","","","",""]
                respuestas[0] = Categorias.Categoria2.Preguntas.Pregunta2.RespuestaA.respuesta
                respuestas[1] = Categorias.Categoria2.Preguntas.Pregunta2.RespuestaB.respuesta
                respuestas[2] = Categorias.Categoria2.Preguntas.Pregunta2.RespuestaC.respuesta
                respuestas[3] = Categorias.Categoria2.Preguntas.Pregunta2.correcta
                respuestas[4] = Categorias.Categoria2.Preguntas.Pregunta2.consejo

                return respuestas
            case 2:
                var respuestas: [String] = ["","","","",""]
                respuestas[0] = Categorias.Categoria2.Preguntas.Pregunta3.RespuestaA.respuesta
                respuestas[1] = Categorias.Categoria2.Preguntas.Pregunta3.RespuestaB.respuesta
                respuestas[2] = Categorias.Categoria2.Preguntas.Pregunta3.RespuestaC.respuesta
                respuestas[3] = Categorias.Categoria2.Preguntas.Pregunta3.correcta
                respuestas[4] = Categorias.Categoria2.Preguntas.Pregunta3.consejo

                return respuestas
            case 3:
                var respuestas: [String] = ["","","","",""]
                respuestas[0] = Categorias.Categoria2.Preguntas.Pregunta4.RespuestaA.respuesta
                respuestas[1] = Categorias.Categoria2.Preguntas.Pregunta4.RespuestaB.respuesta
                respuestas[2] = Categorias.Categoria2.Preguntas.Pregunta4.RespuestaC.respuesta
                respuestas[3] = Categorias.Categoria2.Preguntas.Pregunta4.correcta
                respuestas[4] = Categorias.Categoria2.Preguntas.Pregunta4.consejo

                return respuestas
            case 4:
                var respuestas: [String] = ["","","","",""]
                respuestas[0] = Categorias.Categoria2.Preguntas.Pregunta5.RespuestaA.respuesta
                respuestas[1] = Categorias.Categoria2.Preguntas.Pregunta5.RespuestaB.respuesta
                respuestas[2] = Categorias.Categoria2.Preguntas.Pregunta5.RespuestaC.respuesta
                respuestas[3] = Categorias.Categoria2.Preguntas.Pregunta5.correcta
                respuestas[4] = Categorias.Categoria2.Preguntas.Pregunta5.consejo

                return respuestas
            case 5:
                var respuestas: [String] = ["","","","",""]
                respuestas[0] = Categorias.Categoria2.Preguntas.Pregunta6.RespuestaA.respuesta
                respuestas[1] = Categorias.Categoria2.Preguntas.Pregunta6.RespuestaB.respuesta
                respuestas[2] = Categorias.Categoria2.Preguntas.Pregunta6.RespuestaC.respuesta
                respuestas[3] = Categorias.Categoria2.Preguntas.Pregunta6.correcta
                respuestas[4] = Categorias.Categoria2.Preguntas.Pregunta6.consejo

                return respuestas
            case 6:
                var respuestas: [String] = ["","","","",""]
                respuestas[0] = Categorias.Categoria2.Preguntas.Pregunta7.RespuestaA.respuesta
                respuestas[1] = Categorias.Categoria2.Preguntas.Pregunta7.RespuestaB.respuesta
                respuestas[2] = Categorias.Categoria2.Preguntas.Pregunta7.RespuestaC.respuesta
                respuestas[3] = Categorias.Categoria2.Preguntas.Pregunta7.correcta
                respuestas[4] = Categorias.Categoria2.Preguntas.Pregunta7.consejo

                return respuestas
                
            default:
                return []
            }
        case 2:
            titulo  = Categorias.Categoria3.Nombre
            switch nPregunta{
            case 0:
                var respuestas: [String] = ["","","","",""]
                respuestas[0] = Categorias.Categoria3.Preguntas.Pregunta1.RespuestaA.respuesta
                respuestas[1] = Categorias.Categoria3.Preguntas.Pregunta1.RespuestaB.respuesta
                respuestas[2] = Categorias.Categoria3.Preguntas.Pregunta1.RespuestaC.respuesta
                respuestas[3] = Categorias.Categoria3.Preguntas.Pregunta1.correcta
                respuestas[4] = Categorias.Categoria3.Preguntas.Pregunta1.consejo

                return respuestas
            case 1:
                var respuestas: [String] = ["","","","",""]
                respuestas[0] = Categorias.Categoria3.Preguntas.Pregunta2.RespuestaA.respuesta
                respuestas[1] = Categorias.Categoria3.Preguntas.Pregunta2.RespuestaB.respuesta
                respuestas[2] = Categorias.Categoria3.Preguntas.Pregunta2.RespuestaC.respuesta
                respuestas[3] = Categorias.Categoria3.Preguntas.Pregunta2.correcta
                respuestas[4] = Categorias.Categoria3.Preguntas.Pregunta2.consejo

                return respuestas
            case 2:
                var respuestas: [String] = ["","","","",""]
                respuestas[0] = Categorias.Categoria3.Preguntas.Pregunta3.RespuestaA.respuesta
                respuestas[1] = Categorias.Categoria3.Preguntas.Pregunta3.RespuestaB.respuesta
                respuestas[2] = Categorias.Categoria3.Preguntas.Pregunta3.RespuestaC.respuesta
                respuestas[3] = Categorias.Categoria3.Preguntas.Pregunta3.correcta
                respuestas[4] = Categorias.Categoria3.Preguntas.Pregunta3.consejo
                return respuestas
            case 3:
                var respuestas: [String] = ["","","","",""]
                respuestas[0] = Categorias.Categoria3.Preguntas.Pregunta4.RespuestaA.respuesta
                respuestas[1] = Categorias.Categoria3.Preguntas.Pregunta4.RespuestaB.respuesta
                respuestas[2] = Categorias.Categoria3.Preguntas.Pregunta4.RespuestaC.respuesta
                respuestas[3] = Categorias.Categoria3.Preguntas.Pregunta4.correcta
                respuestas[4] = Categorias.Categoria3.Preguntas.Pregunta4.consejo

                return respuestas
            case 4:
                var respuestas: [String] = ["","","","",""]
                respuestas[0] = Categorias.Categoria3.Preguntas.Pregunta5.RespuestaA.respuesta
                respuestas[1] = Categorias.Categoria3.Preguntas.Pregunta5.RespuestaB.respuesta
                respuestas[2] = Categorias.Categoria3.Preguntas.Pregunta5.RespuestaC.respuesta
                respuestas[3] = Categorias.Categoria3.Preguntas.Pregunta5.correcta
                respuestas[4] = Categorias.Categoria3.Preguntas.Pregunta5.consejo
                
                return respuestas
            case 5:
                var respuestas: [String] = ["","","","",""]
                respuestas[0] = Categorias.Categoria3.Preguntas.Pregunta6.RespuestaA.respuesta
                respuestas[1] = Categorias.Categoria3.Preguntas.Pregunta6.RespuestaB.respuesta
                respuestas[2] = Categorias.Categoria3.Preguntas.Pregunta6.RespuestaC.respuesta
                respuestas[3] = Categorias.Categoria3.Preguntas.Pregunta6.correcta
                respuestas[4] = Categorias.Categoria3.Preguntas.Pregunta6.consejo

                return respuestas
            case 6:
                var respuestas: [String] = ["","","","",""]
                respuestas[0] = Categorias.Categoria3.Preguntas.Pregunta7.RespuestaA.respuesta
                respuestas[1] = Categorias.Categoria3.Preguntas.Pregunta7.RespuestaB.respuesta
                respuestas[2] = Categorias.Categoria3.Preguntas.Pregunta7.RespuestaC.respuesta
                respuestas[3] = Categorias.Categoria3.Preguntas.Pregunta7.correcta
                respuestas[4] = Categorias.Categoria3.Preguntas.Pregunta7.consejo

                return respuestas
                
            default:
                return []
            }
        case 3:
            titulo  = Categorias.Categoria4.Nombre
            switch nPregunta{
            case 0:
                var respuestas: [String] = ["","","","",""]
                respuestas[0] = Categorias.Categoria4.Preguntas.Pregunta1.RespuestaA.respuesta
                respuestas[1] = Categorias.Categoria4.Preguntas.Pregunta1.RespuestaB.respuesta
                respuestas[2] = Categorias.Categoria4.Preguntas.Pregunta1.RespuestaC.respuesta
                respuestas[3] = Categorias.Categoria4.Preguntas.Pregunta1.correcta
                respuestas[4] = Categorias.Categoria4.Preguntas.Pregunta1.consejo

                return respuestas
            case 1:
                var respuestas: [String] = ["","","","",""]
                respuestas[0] = Categorias.Categoria4.Preguntas.Pregunta2.RespuestaA.respuesta
                respuestas[1] = Categorias.Categoria4.Preguntas.Pregunta2.RespuestaB.respuesta
                respuestas[2] = Categorias.Categoria4.Preguntas.Pregunta2.RespuestaC.respuesta
                respuestas[3] = Categorias.Categoria4.Preguntas.Pregunta2.correcta
                respuestas[4] = Categorias.Categoria4.Preguntas.Pregunta2.consejo

                return respuestas
            case 2:
                var respuestas: [String] = ["","","","",""]
                respuestas[0] = Categorias.Categoria4.Preguntas.Pregunta3.RespuestaA.respuesta
                respuestas[1] = Categorias.Categoria4.Preguntas.Pregunta3.RespuestaB.respuesta
                respuestas[2] = Categorias.Categoria4.Preguntas.Pregunta3.RespuestaC.respuesta
                respuestas[3] = Categorias.Categoria4.Preguntas.Pregunta3.correcta
                respuestas[4] = Categorias.Categoria4.Preguntas.Pregunta3.consejo

                return respuestas
            case 3:
                var respuestas: [String] = ["","","","",""]
                respuestas[0] = Categorias.Categoria4.Preguntas.Pregunta4.RespuestaA.respuesta
                respuestas[1] = Categorias.Categoria4.Preguntas.Pregunta4.RespuestaB.respuesta
                respuestas[2] = Categorias.Categoria4.Preguntas.Pregunta4.RespuestaC.respuesta
                respuestas[3] = Categorias.Categoria4.Preguntas.Pregunta4.correcta
                respuestas[4] = Categorias.Categoria4.Preguntas.Pregunta4.consejo

                return respuestas
            case 4:
                var respuestas: [String] = ["","","","",""]
                respuestas[0] = Categorias.Categoria4.Preguntas.Pregunta5.RespuestaA.respuesta
                respuestas[1] = Categorias.Categoria4.Preguntas.Pregunta5.RespuestaB.respuesta
                respuestas[2] = Categorias.Categoria4.Preguntas.Pregunta5.RespuestaC.respuesta
                respuestas[3] = Categorias.Categoria4.Preguntas.Pregunta5.correcta
                respuestas[4] = Categorias.Categoria4.Preguntas.Pregunta5.consejo

                return respuestas
            case 5:
                var respuestas: [String] = ["","","","",""]
                respuestas[0] = Categorias.Categoria4.Preguntas.Pregunta6.RespuestaA.respuesta
                respuestas[1] = Categorias.Categoria4.Preguntas.Pregunta6.RespuestaB.respuesta
                respuestas[2] = Categorias.Categoria4.Preguntas.Pregunta6.RespuestaC.respuesta
                respuestas[3] = Categorias.Categoria4.Preguntas.Pregunta6.correcta
                respuestas[4] = Categorias.Categoria4.Preguntas.Pregunta6.consejo

                return respuestas
            case 6:
                var respuestas: [String] = ["","","","",""]
                respuestas[0] = Categorias.Categoria4.Preguntas.Pregunta7.RespuestaA.respuesta
                respuestas[1] = Categorias.Categoria4.Preguntas.Pregunta7.RespuestaB.respuesta
                respuestas[2] = Categorias.Categoria4.Preguntas.Pregunta7.RespuestaC.respuesta
                respuestas[3] = Categorias.Categoria4.Preguntas.Pregunta7.correcta
                respuestas[4] = Categorias.Categoria4.Preguntas.Pregunta7.consejo

                return respuestas
                
            default:
                return []
            }
        case 4:
            titulo  = Categorias.Categoria5.Nombre
            switch nPregunta{
            case 0:
                var respuestas: [String] = ["","","","",""]
                respuestas[0] = Categorias.Categoria5.Preguntas.Pregunta1.RespuestaA.respuesta
                respuestas[1] = Categorias.Categoria5.Preguntas.Pregunta1.RespuestaB.respuesta
                respuestas[2] = Categorias.Categoria5.Preguntas.Pregunta1.RespuestaC.respuesta
                respuestas[3] = Categorias.Categoria5.Preguntas.Pregunta1.correcta
                respuestas[4] = Categorias.Categoria5.Preguntas.Pregunta1.consejo

                return respuestas
            case 1:
                var respuestas: [String] = ["","","","",""]
                respuestas[0] = Categorias.Categoria5.Preguntas.Pregunta2.RespuestaA.respuesta
                respuestas[1] = Categorias.Categoria5.Preguntas.Pregunta2.RespuestaB.respuesta
                respuestas[2] = Categorias.Categoria5.Preguntas.Pregunta2.RespuestaC.respuesta
                respuestas[3] = Categorias.Categoria5.Preguntas.Pregunta2.correcta
                respuestas[4] = Categorias.Categoria5.Preguntas.Pregunta2.consejo

                return respuestas
            case 2:
                var respuestas: [String] = ["","","","",""]
                respuestas[0] = Categorias.Categoria5.Preguntas.Pregunta3.RespuestaA.respuesta
                respuestas[1] = Categorias.Categoria5.Preguntas.Pregunta3.RespuestaB.respuesta
                respuestas[2] = Categorias.Categoria5.Preguntas.Pregunta3.RespuestaC.respuesta
                respuestas[3] = Categorias.Categoria5.Preguntas.Pregunta3.correcta
                respuestas[4] = Categorias.Categoria5.Preguntas.Pregunta3.consejo

                return respuestas
            case 3:
                var respuestas: [String] = ["","","","",""]
                respuestas[0] = Categorias.Categoria5.Preguntas.Pregunta4.RespuestaA.respuesta
                respuestas[1] = Categorias.Categoria5.Preguntas.Pregunta4.RespuestaB.respuesta
                respuestas[2] = Categorias.Categoria5.Preguntas.Pregunta4.RespuestaC.respuesta
                respuestas[3] = Categorias.Categoria5.Preguntas.Pregunta4.correcta
                respuestas[4] = Categorias.Categoria5.Preguntas.Pregunta4.consejo

                return respuestas
            case 4:
                var respuestas: [String] = ["","","","",""]
                respuestas[0] = Categorias.Categoria5.Preguntas.Pregunta5.RespuestaA.respuesta
                respuestas[1] = Categorias.Categoria5.Preguntas.Pregunta5.RespuestaB.respuesta
                respuestas[2] = Categorias.Categoria5.Preguntas.Pregunta5.RespuestaC.respuesta
                respuestas[3] = Categorias.Categoria5.Preguntas.Pregunta5.correcta
                respuestas[4] = Categorias.Categoria5.Preguntas.Pregunta5.consejo

                return respuestas
            case 5:
                var respuestas: [String] = ["","","","",""]
                respuestas[0] = Categorias.Categoria5.Preguntas.Pregunta6.RespuestaA.respuesta
                respuestas[1] = Categorias.Categoria5.Preguntas.Pregunta6.RespuestaB.respuesta
                respuestas[2] = Categorias.Categoria5.Preguntas.Pregunta6.RespuestaC.respuesta
                respuestas[3] = Categorias.Categoria5.Preguntas.Pregunta6.correcta
                respuestas[4] = Categorias.Categoria5.Preguntas.Pregunta6.consejo

                return respuestas
            case 6:
                var respuestas: [String] = ["","","","",""]
                respuestas[0] = Categorias.Categoria5.Preguntas.Pregunta7.RespuestaA.respuesta
                respuestas[1] = Categorias.Categoria5.Preguntas.Pregunta7.RespuestaB.respuesta
                respuestas[2] = Categorias.Categoria5.Preguntas.Pregunta7.RespuestaC.respuesta
                respuestas[3] = Categorias.Categoria5.Preguntas.Pregunta7.correcta
                respuestas[4] = Categorias.Categoria5.Preguntas.Pregunta7.consejo

                return respuestas

            default:
                return []
            }
        default:
            return []
        }
    }
    
    func categoriaRespondida(){
        switch nCategoria {
        case 0:
            Categorias.Categoria1.Finalizada = "True"
        case 1:
            Categorias.Categoria2.Finalizada = "True"
        case 2:
            Categorias.Categoria3.Finalizada = "True"
        case 3:
            Categorias.Categoria4.Finalizada = "True"
        case 4:
            Categorias.Categoria5.Finalizada = "True"
        default:
            return
        }
    }
    
    //View Did Load
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        timerLab = "00:35"
        self.navigationItem.hidesBackButton = true
        runTimer()
        pregunta = seleccionPregunta()
        respuestas = seleccionRespuesta()
        tableView.backgroundColor = UIColor.blue
        tableView.reloadData()
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }    
}
