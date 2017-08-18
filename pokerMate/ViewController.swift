//
//  ViewController.swift
//  pokerMate
//
//  Created by Akilesh Bapu on 12/22/16.
//  Copyright © 2016 org.berkeleyMobile. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    var playerNameArray = ["Mehul", "Arnav", "Nihar", "Akilesh", "Rohan"]
    @IBOutlet weak var playerPicker: UIPickerView!
    @IBOutlet weak var potAmount: UILabel!
    @IBOutlet weak var checkValue: UILabel!
    @IBOutlet weak var mehulScore: UITextField!
    @IBOutlet weak var arnavScore: UITextField!
    @IBOutlet weak var nihar: UITextField!
    @IBOutlet weak var addMinusAmt: UITextField!
    @IBOutlet weak var akileshScore: UITextField!
    @IBOutlet weak var rohanScore: UITextField!
    var currentPlayer = 0

    var playerArray: [UITextField]!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        playerArray = [mehulScore, arnavScore, nihar, akileshScore, rohanScore]
        playerPicker.dataSource = self
        playerPicker.delegate = self
        potAmount.text = "0"
    }
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 5
    }
    public func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    public func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        //Set currPlayer
        self.currentPlayer = row
        if (row == 0) {
            
        }
    }
    public func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return playerNameArray[row]
    }
    @IBAction func addButton(_ sender: Any) {
        var thisGuy = self.checkValue!
        let formatter = NumberFormatter.init()
        let amtToAdd = self.addMinusAmt.text
        let number = formatter.number(from: amtToAdd!)
        let currentNumber = formatter.number(from:thisGuy.text!)
        thisGuy.text = String((number?.intValue)! + (currentNumber?.intValue)!)
    }
    @IBAction func resetCheckValue(_ sender: Any) {
        self.checkValue.text = "0"
    }
    @IBAction func nextRound(_ sender: Any) {
        for thisGuy in playerArray {

            let formatter = NumberFormatter.init()
            let amtToAdd = self.addMinusAmt.text
            let number = formatter.number(from: amtToAdd!)
            let currentNumber = formatter.number(from:thisGuy.text!)
            thisGuy.text = String((currentNumber?.intValue)! - 2)
        }
        var thisGuy = self.playerArray[self.currentPlayer]
        let formatter = NumberFormatter.init()
        let amtToAdd = self.addMinusAmt.text
        let number = formatter.number(from: self.potAmount.text!)
        let currentNumber = formatter.number(from:thisGuy.text!)
        thisGuy.text = String((number?.intValue)! + (currentNumber?.intValue)!)
        potAmount.text = "10"
    }
    @IBAction func match(_ sender: Any) {
        minus()
        var thisGuy = self.checkValue!
        let formatter = NumberFormatter.init()
        let amtToAdd = self.addMinusAmt.text
        let number = formatter.number(from: self.checkValue.text!)
        let currentNumber = formatter.number(from:self.potAmount.text!)
        self.potAmount.text = String((number?.intValue)! + (currentNumber?.intValue)!)
    }
    func minus() {
        var thisGuy = playerArray[currentPlayer]
        let formatter = NumberFormatter.init()
        let amtToAdd = self.addMinusAmt.text
        let number = formatter.number(from: self.checkValue.text!)
        let currentNumber = formatter.number(from:thisGuy.text!)
        thisGuy.text = String((currentNumber?.intValue)! - (number?.intValue)!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

