//
//  MoodDetailsController.swift
//  MoodTracker
//
//  Created by Murali Korukonda on 14/1/15.
//  Copyright (c) 2015 Razeware LLC. All rights reserved.
//

import WatchKit
import Foundation


class MoodDetailsController: WKInterfaceController {
    
    let moodNames = ["OK","Not Bad","Hmm","Anger","RAWR"]
    var currentMood = 0
    var shouldShowAdvice = true
    
    @IBOutlet weak var moodImage: WKInterfaceImage!
    @IBOutlet weak var moodNameLabel: WKInterfaceLabel!
    @IBOutlet weak var moodDescriptionLabel: WKInterfaceLabel!
    @IBOutlet weak var moodAdviceLabel: WKInterfaceLabel!
    
    init(context:AnyObject?){
        super.init()
        
        if let moodContextData = context as? MoodContextData{
            currentMood = moodContextData.moodIndex
            shouldShowAdvice = moodContextData.shouldShowAdvice
        }
    }
    
    override func willActivate() {
        super.willActivate()
        
        moodImage.setImageNamed("rage\(currentMood)")
        let moodName = moodNames[currentMood]
        moodNameLabel.setText(moodName)
        moodDescriptionLabel.setText("You are feeling So \(moodName), eh?")
        
        if shouldShowAdvice {
            moodAdviceLabel.setText("Feeling \(moodName)? Try some videos")
            moodAdviceLabel.setHidden(false)
        }
        else{
            moodAdviceLabel.setHidden(true)
        }
    }
}
