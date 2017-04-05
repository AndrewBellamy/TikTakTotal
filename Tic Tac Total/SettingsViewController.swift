//
//  SettingsViewController.swift
//  Tic Tac Total
//
//  Created by Andrew Bellamy ID : 215240036 on 16/3/17
//  SIT206 Assignment 1
//  Copyright © 2017 Andrew Bellamy. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var playerOneSymbolButton: UIButton!
    @IBOutlet weak var playerTwoSymbolButton: UIButton!
    @IBOutlet weak var playerTwoAI: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Check if AI is on, button reacts accordingly.
        if (aiIsOn == true) {
            playerTwoAI.isOn = true
        } else {
            playerTwoAI.isOn = false
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /**
     For symbol buttons. Passes tag to identify which player to change.
    */
    @IBAction func changePlayerSymbol(_ sender: UIButton) {
        performSegue(withIdentifier: "SymbolSelectSegue", sender: sender)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //Place any other segue preps in here by identifier.
        if segue.identifier == "SymbolSelectSegue" {
            let toViewController = segue.destination as! SymbolsViewController
            toViewController.requestingPlayer = (sender as AnyObject).tag
        }
    }

    /**
     Handles setting the AI on/off.
    */
    @IBAction func onSetAI(_ sender: UISwitch) {
        if (sender.isOn == true) {
            aiIsOn = true
        } else {
            aiIsOn = false
        }
    }

}
