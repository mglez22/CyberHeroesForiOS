//
//  ResultadoViewController.swift
//  CyberHeroe
//
//  Created by Mario on 18/04/2018.
//  Copyright © 2018 Mario. All rights reserved.
//

import UIKit
import Charts

class ResultadoViewController: UIViewController {

    
    @IBOutlet weak var graficoHistorico: PieChartView!
    
    
 
    
    let surveyData = ["cat": 20, "dog": 30, "both": 5, "neither": 45]
    
    override func viewDidLoad() {
        super.viewDidLoad()
      graficoHistorico.translatesAutoresizingMaskIntoConstraints = false
      graficoHistorico.noDataText = "No date to display"
        graficoHistorico.legend.enabled = false
        graficoHistorico.chartDescription?.text = ""
        graficoHistorico.drawHoleEnabled = false
    
        view.backgroundColor = UIColor(white: 0.9, alpha: 1)
        fillChart()
    }
    
    
    func fillChart() {
        var dataEntries = [PieChartDataEntry]()
        for (key, val) in surveyData {
            let percent = Double(val) / 100.0
            let entry = PieChartDataEntry(value: percent, label: key)
            dataEntries.append(entry)
        }
        let chartDataSet = PieChartDataSet(values: dataEntries, label: "")
        chartDataSet.colors = ChartColorTemplates.material()
        chartDataSet.sliceSpace = 2
        chartDataSet.selectionShift = 5
        
        let chartData = PieChartData(dataSet: chartDataSet)
        let formatter = NumberFormatter()
        formatter.numberStyle = .percent
        formatter.maximumFractionDigits = 0
        chartData.setValueFormatter(DefaultValueFormatter(formatter: formatter))
        
        graficoHistorico.data = chartData
    }
    
}
