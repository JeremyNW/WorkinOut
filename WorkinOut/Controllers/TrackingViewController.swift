//
//  TrackingViewController.swift
//  WorkinOut
//
//  Created by Jeremy Warren on 1/28/22.
//
import Foundation
import UIKit
import Charts

class TrackingViewController: UIViewController, ChartViewDelegate {
    
    @IBOutlet weak var weightGraph: LineChartView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        let dataSet = LineChartDataSet(entries: entries, label: "Bodyweight")
        weightGraph.data = LineChartData(dataSet: dataSet)
        dataSet.drawCirclesEnabled = false
        weightGraph.backgroundColor = .darkGray
        weightGraph.xAxis.labelPosition = .bottom
        weightGraph.xAxis.valueFormatter = MyFormatter()
        weightGraph.isUserInteractionEnabled = false
        let rAxis = weightGraph.rightAxis
        rAxis.enabled = false
        weightGraph.isHidden = entries.isEmpty
        weightGraph.xAxis.labelCount = entries.count
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


class MyFormatter: AxisValueFormatter {
    static let formatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.timeStyle = .none
        formatter.dateStyle = .short
        return formatter
    }()
    func stringForValue(_ value: Double, axis: AxisBase?) -> String {
        let date = Date(timeIntervalSince1970: value)
        return Self.formatter.string(from: date)
    }
    
    
}
