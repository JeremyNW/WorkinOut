//
//  LineGraph.swift
//  WorkinOut
//
//  Created by Jeremy Warren on 1/17/22.
//
import UIKit
import Foundation
import Charts

class UIView: UIViewController, ChartViewDelegate {
    
    
    lazy var lineChartView: LineChartView = {
        let chartView = LineChartView()
        chartView.backgroundColor = .systemGray2
        
        chartView.rightAxis.enabled = false
        
        let yAxis = chartView.leftAxis
        yAxis.labelFont = .boldSystemFont(ofSize: 12)
        yAxis.setLabelCount(6, force: false)
        yAxis.labelTextColor = .white
        yAxis.axisLineColor = .white
        yAxis.labelPosition = .insideChart
        
        chartView.xAxis.labelPosition = .bottom
        chartView.xAxis.labelFont = .boldSystemFont(ofSize: 12)
        chartView.xAxis.setLabelCount(6, force: false)
        chartView.xAxis.labelTextColor = .white
        chartView.xAxis.axisLineColor = .systemBlue
        
        chartView.animate(xAxisDuration: 3.0)
        
        return chartView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view = lineChartView
        

        setMoreData()
        
    }

    func chartValueSelected(_ chartView: ChartViewBase, entry: ChartDataEntry, highlight: Highlight) {
        print(entry)
    }
    
    func setMoreData() {
        let set2 = LineChartDataSet(entries: xValues, label: "Zachs Love Stocks")
        
        set2.lineWidth = 1
        set2.setColor(.blue)
        set2.highlightColor = .systemCyan
        
        set2.drawCirclesEnabled = false
        
        let set1 = LineChartDataSet(entries: yValues, label: "My Love Stocks")
        
        
//        you can customize the string appearance
//        set1.mode = .horizontalBezier
        set1.lineWidth = 1
        set1.setColor(.white)
        set1.drawHorizontalHighlightIndicatorEnabled = false
        set1.highlightColor = .systemBlue
        
        set1.drawCirclesEnabled = false
        let data = LineChartData(dataSets: [set1, set2])
        data.setDrawValues(true)
        lineChartView.data = data
    }
    
    
    
    let yValues: [ChartDataEntry] = [
        ChartDataEntry(x: 0.0, y: 1.0),
        ChartDataEntry(x: 1.0, y: 2.0),
        ChartDataEntry(x: 2.0, y: 4.0),
        ChartDataEntry(x: 3.0, y: 6.0),
        ChartDataEntry(x: 4.0, y: 5.0),
        ChartDataEntry(x: 5.0, y: 7.0),
        ChartDataEntry(x: 6.0, y: 6.0),
        ChartDataEntry(x: 7.0, y: 8.0),
        ChartDataEntry(x: 8.0, y: 9.0),
        ChartDataEntry(x: 9.0, y: 10.0),
        ChartDataEntry(x: 10.0, y: 12.0),
        ChartDataEntry(x: 11.0, y: 15.0),
        ChartDataEntry(x: 12.0, y: 18.0),
        ChartDataEntry(x: 13.0, y: 22.0),
        ChartDataEntry(x: 14.0, y: 28.0),
        ChartDataEntry(x: 15.0, y: 34.0),
        ChartDataEntry(x: 16.0, y: 42.0),
        ChartDataEntry(x: 17.0, y: 50.0),
        ChartDataEntry(x: 18.0, y: 28.0),
        ChartDataEntry(x: 19.0, y: -8.0),
        ChartDataEntry(x: 20.0, y: 36.0),
        ChartDataEntry(x: 21.0, y: 74.0),
        ChartDataEntry(x: 21.5, y: 93.0),
    ]

    
    let xValues: [ChartDataEntry] = [
        ChartDataEntry(x: 0.0, y: -5.0),
        ChartDataEntry(x: 1.0, y: 10.0),
        ChartDataEntry(x: 2.0, y: 20.0),
        ChartDataEntry(x: 3.0, y: 50.0),
        ChartDataEntry(x: 4.0, y: 80.0),
        ChartDataEntry(x: 5.0, y: 75.0),
        ChartDataEntry(x: 6.0, y: 70.0),
        ChartDataEntry(x: 7.0, y: 60.0),
        ChartDataEntry(x: 8.0, y: 55.0),
        ChartDataEntry(x: 9.0, y: 50.0),
        ChartDataEntry(x: 10.0, y: 45.0),
        ChartDataEntry(x: 11.0, y: 40.0),
        ChartDataEntry(x: 12.0, y: 35.0),
        ChartDataEntry(x: 13.0, y: 30.0),
        ChartDataEntry(x: 14.0, y: 25.0),
        ChartDataEntry(x: 15.0, y: 20.0),
        ChartDataEntry(x: 16.0, y: 15.0),
        ChartDataEntry(x: 17.0, y: 12.0),
        ChartDataEntry(x: 18.0, y: 10.0),
        ChartDataEntry(x: 19.0, y: 5.0),
        ChartDataEntry(x: 20.0, y: -8.0)
    ]
    
    
    
    
}
