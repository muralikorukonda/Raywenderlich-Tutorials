//
//  TodayViewController.swift
//  BTC Widget
//
//  Created by Murali Korukonda on 2/10/14.
//  Copyright (c) 2014 Ray Wenderlich. All rights reserved.
//

import UIKit
import NotificationCenter
import CryptoCurrencyKit

class TodayViewController: CurrencyDataViewController, NCWidgetProviding {
    var lineChartIsVisible = false
    
    @IBOutlet weak var toggleLineChartButton: UIButton!
    
    @IBOutlet weak var lineChartHeightConstraint: NSLayoutConstraint!

    override func viewDidLoad() {
        super.viewDidLoad()
        lineChartHeightConstraint.constant = 0
        
        lineChartView.delegate = self;
        lineChartView.dataSource = self;
        
        priceLabel.text = "--"
        priceChangeLabel.text = "--"
    }
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        fetchPrices{ error in
            if error == nil{
                self.updatePriceLabel()
                self.updatePriceChangeLabel()
                self.updatePriceHistoryLineChart()
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func widgetPerformUpdateWithCompletionHandler(completionHandler: ((NCUpdateResult) -> Void)!) {
        // Perform any setup necessary in order to update the view.

        // If an error is encountered, use NCUpdateResult.Failed
        // If there's no update required, use NCUpdateResult.NoData
        // If there's an update, use NCUpdateResult.NewData

        completionHandler(NCUpdateResult.NewData)
    }
    
    @IBAction func toggleLineChart(sender: AnyObject) {
        if  lineChartIsVisible {
            lineChartHeightConstraint.constant = 0
            let trasform = CGAffineTransformMakeRotation(0)
            toggleLineChartButton.transform = trasform
            lineChartIsVisible = false
        }
        else{
            lineChartHeightConstraint.constant=98
            let transform = CGAffineTransformMakeRotation(CGFloat(180.0 * M_PI/180.0))
            toggleLineChartButton.transform = transform
            lineChartIsVisible = true
        }
    }
    func widgetMarginInsetsForProposedMarginInsets(defaultMarginInsets: UIEdgeInsets) -> UIEdgeInsets {
        return UIEdgeInsetsZero
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        updatePriceHistoryLineChart()
    }
    override func lineChartView(lineChartView: JBLineChartView!, colorForLineAtLineIndex lineIndex: UInt) -> UIColor! {
        return UIColor(red: 0.17, green: 0.49, blue: 0.82, alpha: 1.0)
    }
}
