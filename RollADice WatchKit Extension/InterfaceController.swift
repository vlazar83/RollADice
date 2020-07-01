//
//  InterfaceController.swift
//  RollADice WatchKit Extension
//
//  Created by admin on 2020. 06. 29..
//  Copyright © 2020. admin. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    @IBOutlet weak var resultLabel: WKInterfaceLabel!
    
    @IBOutlet weak var Label6D: WKInterfaceButton!
    
    @IBOutlet weak var Label12D: WKInterfaceButton!
    
    @IBOutlet weak var Label20D: WKInterfaceButton!
    
    var selectedButton = 0
    
    var shaker:WatchShaker = WatchShaker(shakeSensibility: .shakeSensibilityNormal, delay: 0.2)
    
    @IBAction func button6DClicked() {
        
        Label6D.setBackgroundColor(UIColor.red)
        Label12D.setBackgroundColor(UIColor.black)
        Label20D.setBackgroundColor(UIColor.black)
        
        selectedButton = 6
        
        resultLabel.setText("0")
    }
    
    @IBAction func button12DClicked() {
        
        Label12D.setBackgroundColor(UIColor.red)
        Label6D.setBackgroundColor(UIColor.black)
        Label20D.setBackgroundColor(UIColor.black)
        
        selectedButton = 12
        
        resultLabel.setText("0")
    }
    
    @IBAction func button20dClicked() {
        
        Label20D.setBackgroundColor(UIColor.red)
        Label6D.setBackgroundColor(UIColor.black)
        Label12D.setBackgroundColor(UIColor.black)
        
        selectedButton = 20
        
        resultLabel.setText("0")
        
    }
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        shaker.delegate = self
        shaker.start()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
        shaker.stop()
    }

}

extension InterfaceController: WatchShakerDelegate
{
    /// Called when Apple Watch are shaked
    ///
    /// - Parameter watchShaker: the watch shaker instance
    func watchShaker(_ watchShaker: WatchShaker, didShakeWith sensibility:ShakeSensibility){
        
        switch selectedButton {
        case 6:
            let generatedNumber = arc4random_uniform(6) + 1
            resultLabel.setText(String(generatedNumber))
        case 12:
            let generatedNumber = arc4random_uniform(12) + 1
            resultLabel.setText(String(generatedNumber))
        case 20:
            let generatedNumber = arc4random_uniform(20) + 1
            resultLabel.setText(String(generatedNumber))
        default:
            let generatedNumber = arc4random_uniform(20) + 1
            resultLabel.setText(String(generatedNumber))
        }
        print("YOU HAVE SHAKEN YOUR ⌚️⌚️⌚️")
    }
    
    /// Called when Something are wrong
    ///
    /// - Parameter watchShaker: the watch shaker instance
    /// - Parameter error: error ocurred
    func watchShaker(_ watchShaker:WatchShaker, didFailWith error: Error){
        print(error.localizedDescription)
    }
    

}
