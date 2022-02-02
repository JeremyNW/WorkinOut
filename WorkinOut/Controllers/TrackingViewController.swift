//
//  TrackingViewController.swift
//  WorkinOut
//
//  Created by Jeremy Warren on 1/28/22.
//

import UIKit
import Charts

class TrackingViewController: UIViewController, ChartViewDelegate {
    
    @IBOutlet weak var weightGraph: LineChartView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let dataSet = LineChartDataSet(entries: entries, label: "Bodyweight")
        weightGraph.data = LineChartData(dataSet: dataSet)
        
        weightGraph.backgroundColor = .darkGray
        weightGraph.xAxis.labelPosition = .bottom
        let rAxis = weightGraph.rightAxis
        let lAxis = weightGraph.leftAxis
        rAxis.enabled = false
    }
    
    override func viewWillAppear(_ animated: Bool) {
//        weightGraph.inputViewController?.loadView()
    }
    
    var entries: [ChartDataEntry] {
        BodyWeightController.shared.bodyWeights.compactMap { bodyweight in
            if let date = bodyweight.date {
                return ChartDataEntry(x: date.timeIntervalSince1970, y: bodyweight.pounds)
            }
            return nil
        }
    }
}
