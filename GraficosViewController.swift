//
//  GraficosViewController.swift
//  CyberHeroe
//
//  Created by Mario on 11/05/2018.
//  Copyright © 2018 Mario. All rights reserved.
//

import UIKit
import Charts
import FirebaseDatabase

class GraficosViewController: UIViewController {

    var rootRef:DatabaseReference!
    var subHandler: DatabaseHandle!
    var handler: DatabaseHandle!
    var handler2: DatabaseHandle!
    var handler3: DatabaseHandle!
    var users:[User] = []

    
    var userAge = ""
    var userSex = ""
    
    var historicos:[Historico] = []
    var historicosC1:[HistoricoC1] = []
    var historicosC2:[HistoricoC2] = []
    var historicosC3:[HistoricoC3] = []
    var historicosC4:[HistoricoC4] = []
    var historicosC5:[HistoricoC5] = []
    
    var total : [NSString] = []
    var cat1 : [NSString] = []
    var cat2 : [NSString] = []
    var cat3 : [NSString] = []
    var cat4 : [NSString] = []
    var cat5 : [NSString] = []
    
     var managedContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var historicoSeleccionado = false
    @IBOutlet weak var graficoHistorico: PieChartView!
    var historico : [String:String] = ["Hace 5":"0","Hace 4":"0","Hace 3":"0","Hace 2":"0","Ultima Partida":"0"]
    var global : [String:String] = ["Categoria 5":"5","Categoria 4":"5","Categoria 3":"5","Categoria 2":"5","Categoria 1":"5","Total":"5"]
    
    @IBOutlet weak var seleccion3: UISegmentedControl!
    @IBOutlet weak var seleccion2: UISegmentedControl!
    @IBOutlet weak var seleccion1: UISegmentedControl!
    
    
    @IBAction func selector1(_ sender: Any) {
        switch seleccion1.selectedSegmentIndex {
        case 0:
            historicoSeleccionado = true
            graficoHistorico.chartDescription?.text = "Historico Intentos Total"
            seleccion2.alpha = 1
            seleccion3.alpha = 0
            fillChart()
        case 1:
            historicoSeleccionado = false
            graficoHistorico.chartDescription?.text = "Media de Intentos Total y por Categoria"
            seleccion2.alpha = 0
            seleccion3.alpha = 1
            fillChart()
        default:
            return
        }
    }
    
    @IBAction func selector2(_ sender: Any) {
        switch seleccion2.selectedSegmentIndex {
        case 0:
            datosHistorico(0)
        case 1:
            datosHistorico(1)
        case 2:
            datosHistorico(2)
        case 3:
            datosHistorico(3)
        case 4:
            datosHistorico(4)
        case 5:
            datosHistorico(5)
        default:
            return
        }
    }
    
    
    @IBAction func selector3(_ sender: Any) {

        switch seleccion3.selectedSegmentIndex {
        case 0:
            print("sel 1")
            obtenDatosFirebase(0)
        case 1:
            print("sel 2")
            obtenDatosFirebase(1)
        case 2:
            print("sel 3")
            obtenDatosFirebase(2)
        default:
            return
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        rootRef = Database.database().reference()
        obtenDatosFirebase(0)
        fetchData()
        graficoHistorico.translatesAutoresizingMaskIntoConstraints = false
        graficoHistorico.noDataText = "Sin datos previos"
        graficoHistorico.legend.enabled = true
        graficoHistorico.drawHoleEnabled = false
        
        graficoHistorico.chartDescription?.text = "Historico Intentos Total"
        
        let historicoUsuario = historicos[Categorias.usuario]
        
        let historicoUltima = historicoUsuario.value(forKey: "ultima") as! String
        let historico2 = historicoUsuario.value(forKey: "hace2") as! String
        let historico3 = historicoUsuario.value(forKey: "hace3") as! String
        let historico4 = historicoUsuario.value(forKey: "hace4") as! String
        let historico5 = historicoUsuario.value(forKey: "hace5") as! String
        
        graficoHistorico.chartDescription?.text = "Historico Intentos Total"
        historico.updateValue(historico4, forKey: "Hace 4")
        historico.updateValue(historico3, forKey: "Hace 3")
        historico.updateValue(historico5, forKey: "Hace 5")
        historico.updateValue(historico2, forKey: "Hace 2")
        historico.updateValue(historicoUltima, forKey: "Ultima Partida")

        global.updateValue("0", forKey: "Categoria 4")
        global.updateValue("0", forKey: "Categoria 3")
        global.updateValue("0", forKey: "Categoria 5")
        global.updateValue("0", forKey: "Categoria 2")
        global.updateValue("0", forKey: "Categoria 1")
        global.updateValue("0", forKey: "Total")
        
        
        view.backgroundColor = UIColor(white: 0.9, alpha: 1)
        seleccion3.alpha = 0
        historicoSeleccionado = true
        fillChart()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        obtenDatosFirebase(0)
        obtenDatosFirebase(1)
        obtenDatosFirebase(2)
        datosHistorico(0)
        datosHistorico(1)
        datosHistorico(2)
        datosHistorico(3)
        datosHistorico(4)
        datosHistorico(5)

        fillChart()
        seleccion3.alpha = 0
    }
    
    
    func fillChart() {
        var dataEntries = [PieChartDataEntry]()
        if historicoSeleccionado {
            for (key, val) in historico {
                let entry = PieChartDataEntry(value: Double(val)!, label: key)
                dataEntries.append(entry)
            }
        }else{
            for (key, val) in global {
                let entry = PieChartDataEntry(value: Double(val)!, label: key)
                dataEntries.append(entry)
            }
        }
        let chartDataSet = PieChartDataSet(values: dataEntries, label: "")
        chartDataSet.colors = ChartColorTemplates.joyful()
        chartDataSet.valueColors = [NSUIColor.black]
        chartDataSet.sliceSpace = 2
        chartDataSet.selectionShift = 5
        
        let chartData = PieChartData(dataSet: chartDataSet)
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        chartData.setValueFormatter(DefaultValueFormatter(formatter: formatter))
        
        graficoHistorico.data = chartData
    }
    
    func fetchData(){
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        do{
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
    
    func datosHistorico(_ index : Int){
        //Guardamos y leemos el mdelo de datos
        let historicoUsuario = historicos[Categorias.usuario]
        let historicoUsuarioC1 = historicosC1[Categorias.usuario]
        let historicoUsuarioC2 = historicosC2[Categorias.usuario]
        let historicoUsuarioC3 = historicosC3[Categorias.usuario]
        let historicoUsuarioC4 = historicosC4[Categorias.usuario]
        let historicoUsuarioC5 = historicosC5[Categorias.usuario]
        
        let historicoUltima = historicoUsuario.value(forKey: "ultima") as! String
        let historico2 = historicoUsuario.value(forKey: "hace2") as! String
        let historico3 = historicoUsuario.value(forKey: "hace3") as! String
        let historico4 = historicoUsuario.value(forKey: "hace4") as! String
        let historico5 = historicoUsuario.value(forKey: "hace5") as! String
        
        let historicoUltimaC1 = historicoUsuarioC1.value(forKey: "ultima") as! String
        let historico2C1 = historicoUsuarioC1.value(forKey: "hace2") as! String
        let historico3C1 = historicoUsuarioC1.value(forKey: "hace3") as! String
        let historico4C1 = historicoUsuarioC1.value(forKey: "hace4") as! String
        let historico5C1 = historicoUsuarioC1.value(forKey: "hace5") as! String
        
        let historicoUltimaC2 = historicoUsuarioC2.value(forKey: "ultima") as! String
        let historico2C2 = historicoUsuarioC2.value(forKey: "hace2") as! String
        let historico3C2 = historicoUsuarioC2.value(forKey: "hace3") as! String
        let historico4C2 = historicoUsuarioC2.value(forKey: "hace4") as! String
        let historico5C2 = historicoUsuarioC2.value(forKey: "hace5") as! String
        
        let historicoUltimaC3 = historicoUsuarioC3.value(forKey: "ultima") as! String
        let historico2C3 = historicoUsuarioC3.value(forKey: "hace2") as! String
        let historico3C3 = historicoUsuarioC3.value(forKey: "hace3") as! String
        let historico4C3 = historicoUsuarioC3.value(forKey: "hace4") as! String
        let historico5C3 = historicoUsuarioC3.value(forKey: "hace5") as! String

        let historicoUltimaC4 = historicoUsuarioC4.value(forKey: "ultima") as! String
        let historico2C4 = historicoUsuarioC4.value(forKey: "hace2") as! String
        let historico3C4 = historicoUsuarioC4.value(forKey: "hace3") as! String
        let historico4C4 = historicoUsuarioC4.value(forKey: "hace4") as! String
        let historico5C4 = historicoUsuarioC4.value(forKey: "hace5") as! String
        
        let historicoUltimaC5 = historicoUsuarioC5.value(forKey: "ultima") as! String
        let historico2C5 = historicoUsuarioC5.value(forKey: "hace2") as! String
        let historico3C5 = historicoUsuarioC5.value(forKey: "hace3") as! String
        let historico4C5 = historicoUsuarioC5.value(forKey: "hace4") as! String
        let historico5C5 = historicoUsuarioC5.value(forKey: "hace5") as! String
        
        //Actualizamos gráfico con los datos leidos
        switch index {
        case 0:
            graficoHistorico.chartDescription?.text = "Historico Intentos Total"
            historico.updateValue(historico4, forKey: "Hace 4")
            historico.updateValue(historico3, forKey: "Hace 3")
            historico.updateValue(historico5, forKey: "Hace 5")
            historico.updateValue(historico2, forKey: "Hace 2")
            historico.updateValue(historicoUltima, forKey: "Ultima Partida")

       case 1:
            graficoHistorico.chartDescription?.text = "Historico Intentos Categoria 1"
            historico.updateValue(historico4C1, forKey: "Hace 4")
            historico.updateValue(historico3C1, forKey: "Hace 3")
            historico.updateValue(historico5C1, forKey: "Hace 5")
            historico.updateValue(historico2C1, forKey: "Hace 2")
            historico.updateValue(historicoUltimaC1, forKey: "Ultima Partida")
        case 2:
            graficoHistorico.chartDescription?.text = "Historico Intentos Categoria 2"
            historico.updateValue(historico4C2, forKey: "Hace 4")
            historico.updateValue(historico3C2, forKey: "Hace 3")
            historico.updateValue(historico5C2, forKey: "Hace 5")
            historico.updateValue(historico2C2, forKey: "Hace 2")
            historico.updateValue(historicoUltimaC2, forKey: "Ultima Partida")
        case 3:
            graficoHistorico.chartDescription?.text = "Historico Intentos Categoria 3"
            historico.updateValue(historico4C3, forKey: "Hace 4")
            historico.updateValue(historico3C3, forKey: "Hace 3")
            historico.updateValue(historico5C3, forKey: "Hace 5")
            historico.updateValue(historico2C3, forKey: "Hace 2")
            historico.updateValue(historicoUltimaC3, forKey: "Ultima Partida")
        case 4:
            graficoHistorico.chartDescription?.text = "Historico Intentos Categoria 4"
            historico.updateValue(historico4C4, forKey: "Hace 4")
            historico.updateValue(historico3C4, forKey: "Hace 3")
            historico.updateValue(historico5C4, forKey: "Hace 5")
            historico.updateValue(historico2C4, forKey: "Hace 2")
            historico.updateValue(historicoUltimaC4, forKey: "Ultima Partida")
        case 5:
            graficoHistorico.chartDescription?.text = "Historico Intentos Categoria 5"
            historico.updateValue(historico4C5, forKey: "Hace 4")
            historico.updateValue(historico3C5, forKey: "Hace 3")
            historico.updateValue(historico5C5, forKey: "Hace 5")
            historico.updateValue(historico2C5, forKey: "Hace 2")
            historico.updateValue(historicoUltimaC5, forKey: "Ultima Partida")
        default:
            return
        }
        fillChart()
    }
    func datosGlobales(_ resultado : [String]){
            graficoHistorico.chartDescription?.text = "Media de Intentos Totales y por Categoria"
            global.updateValue(resultado[4], forKey: "Categoria 4")
            global.updateValue(resultado[3], forKey: "Categoria 3")
            global.updateValue(resultado[5], forKey: "Categoria 5")
            global.updateValue(resultado[2], forKey: "Categoria 2")
            global.updateValue(resultado[1], forKey: "Categoria 1")
            global.updateValue(resultado[0], forKey: "Total")
        fillChart()
    }
    
    func obtenDatosFirebase(_ index : Int){
        switch index {
        case 0:
            rootRef = Database.database().reference()
            handler = rootRef.queryOrdered(byChild: "edad").queryEqual(toValue: userAge).observe(.value, with: { (snapshot) in
                self.total.removeAll()
                self.cat1.removeAll()
                self.cat2.removeAll()
                self.cat3.removeAll()
                self.cat4.removeAll()
                self.cat5.removeAll()
                
                for snap in snapshot.children {
                    self.total.append((snap as! DataSnapshot).childSnapshot(forPath: "intentos").childSnapshot(forPath: "0").value! as! NSString)
                    self.cat1.append((snap as! DataSnapshot).childSnapshot(forPath: "intentos").childSnapshot(forPath: "1").value! as! NSString)
                    self.cat2.append((snap as! DataSnapshot).childSnapshot(forPath: "intentos").childSnapshot(forPath: "2").value! as! NSString)
                    self.cat3.append((snap as! DataSnapshot).childSnapshot(forPath: "intentos").childSnapshot(forPath: "3").value! as! NSString)
                    self.cat4.append((snap as! DataSnapshot).childSnapshot(forPath: "intentos").childSnapshot(forPath: "4").value! as! NSString)
                    self.cat5.append((snap as! DataSnapshot).childSnapshot(forPath: "intentos").childSnapshot(forPath: "5").value! as! NSString)
                    
                }
                let result = self.calculaMedia()
                self.datosGlobales(result)
            })
        case 1:
            rootRef = Database.database().reference()
            handler2 = rootRef.queryOrdered(byChild: "sexo").queryEqual(toValue: userSex).observe(.value, with: { (snapshot) in
                self.total.removeAll()
                self.cat1.removeAll()
                self.cat2.removeAll()
                self.cat3.removeAll()
                self.cat4.removeAll()
                self.cat5.removeAll()

                for snap in snapshot.children {
                    self.total.append((snap as! DataSnapshot).childSnapshot(forPath: "intentos").childSnapshot(forPath: "0").value! as! NSString)
                    self.cat1.append((snap as! DataSnapshot).childSnapshot(forPath: "intentos").childSnapshot(forPath: "1").value! as! NSString)
                    self.cat2.append((snap as! DataSnapshot).childSnapshot(forPath: "intentos").childSnapshot(forPath: "2").value! as! NSString)
                    self.cat3.append((snap as! DataSnapshot).childSnapshot(forPath: "intentos").childSnapshot(forPath: "3").value! as! NSString)
                    self.cat4.append((snap as! DataSnapshot).childSnapshot(forPath: "intentos").childSnapshot(forPath: "4").value! as! NSString)
                    self.cat5.append((snap as! DataSnapshot).childSnapshot(forPath: "intentos").childSnapshot(forPath: "5").value! as! NSString)
                    
                }
                let result = self.calculaMedia()
                self.datosGlobales(result)
            })
        case 2:
            rootRef = Database.database().reference()
            handler3 = rootRef.queryOrdered(byChild: "sexo").queryEqual(toValue: userSex).observe(.value, with: { (snapshot) in
                self.total.removeAll()
                self.cat1.removeAll()
                self.cat2.removeAll()
                self.cat3.removeAll()
                self.cat4.removeAll()
                self.cat5.removeAll()
                
                for snap in snapshot.children {
                    if(((snap as! DataSnapshot).childSnapshot(forPath: "edad").value! as! String) == self.userAge){
                        self.total.append((snap as! DataSnapshot).childSnapshot(forPath: "intentos").childSnapshot(forPath: "0").value! as! NSString)
                        self.cat1.append((snap as! DataSnapshot).childSnapshot(forPath: "intentos").childSnapshot(forPath: "1").value! as! NSString)
                        self.cat2.append((snap as! DataSnapshot).childSnapshot(forPath: "intentos").childSnapshot(forPath: "2").value! as! NSString)
                        self.cat3.append((snap as! DataSnapshot).childSnapshot(forPath: "intentos").childSnapshot(forPath: "3").value! as! NSString)
                        self.cat4.append((snap as! DataSnapshot).childSnapshot(forPath: "intentos").childSnapshot(forPath: "4").value! as! NSString)
                        self.cat5.append((snap as! DataSnapshot).childSnapshot(forPath: "intentos").childSnapshot(forPath: "5").value! as! NSString)
                    }
                }
                    
                let result = self.calculaMedia()
                self.datosGlobales(result)
            })
        default:
            return
        }
       

    }
    
    func calculaMedia()->[String]{
        var mediaT = 0
        var mediaC1 = 0
        var mediaC2 = 0
        var mediaC3 = 0
        var mediaC4 = 0
        var mediaC5 = 0
        
        var result = ["","","","","",""]
        for i in total{
            mediaT = mediaT + Int(i.intValue)
        }
        for i in cat1{
            mediaC1 = mediaC1 + Int(i.intValue)
        }
        for i in cat2{
            mediaC2 = mediaC2 + Int(i.intValue)
        }
        for i in cat3{
            mediaC3 = mediaC3 + Int(i.intValue)
        }
        for i in cat4{
            mediaC4 = mediaC4 + Int(i.intValue)
        }
        for i in cat5{
            mediaC5 = mediaC5 + Int(i.intValue)
        }
        
        if total.count != 0 {
        mediaT = mediaT / total.count
        mediaC1 = mediaC1 / cat1.count
        mediaC2 = mediaC2 / cat2.count
        mediaC3 = mediaC3 / cat3.count
        mediaC4 = mediaC4 / cat4.count
        mediaC5 = mediaC5 / cat5.count
        }
        else{
            mediaT = 0
            mediaC1 = 0
            mediaC2 = 0
            mediaC3 = 0
            mediaC4 = 0
            mediaC5 = 0
        }

        result[0] = "\(mediaT)"
        result[1] = "\(mediaC1)"
        result[2] = "\(mediaC2)"
        result[3] = "\(mediaC3)"
        result[4] = "\(mediaC4)"
        result[5] = "\(mediaC5)"
        return result
    }
    
}
