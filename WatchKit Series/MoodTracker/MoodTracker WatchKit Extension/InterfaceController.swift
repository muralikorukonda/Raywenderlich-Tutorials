//
//  InterfaceController.swift
//  MoodTracker WatchKit Extension
//
//  Created by Greg Heo on 2014-11-20.
//  Copyright (c) 2014 Razeware LLC. All rights reserved.
//

import WatchKit
import Foundation

class MoodContextData {
    var moodIndex : Int = 0
    var shouldShowAdvice: Bool = true
    
    init(moodIndex:Int,shouldShowAdvice:Bool){
        self.moodIndex = moodIndex
        self.shouldShowAdvice = shouldShowAdvice
    }
}
class InterfaceController: WKInterfaceController {
    
    @IBOutlet weak var moodImage: WKInterfaceImage!
    var currentMood: Int = 0
    var shouldShowAdvice: Bool = true
    override func awakeWithContext(context: AnyObject!) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
        NSLog("%@ awake", self)
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        NSLog("%@ will activate", self)
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        NSLog("%@ did deactivate", self)
        super.didDeactivate()
    }
    
    @IBAction func moodSliderChanged(value: Float) {
        currentMood = Int(value)
        println("Current mood:\(currentMood)")
        updateMoodImage()
    }
    
    func updateMoodImage(){
        if currentMood < 0 || currentMood > 4{
            return
        }
        moodImage.setImageNamed("rage\(currentMood)")
    }
    
    override func contextForSegueWithIdentifier(segueIdentifier: String) -> AnyObject? {
        if segueIdentifier == "moodDetailsSegue" {
            return MoodContextData(moodIndex: currentMood,shouldShowAdvice:shouldShowAdvice)
        }
        return nil
    }
    
    @IBAction func offerAdviceSwitchChanged(value: Bool) {
        shouldShowAdvice = value
        println("Offer Advice: \(shouldShowAdvice)")
    }
}
