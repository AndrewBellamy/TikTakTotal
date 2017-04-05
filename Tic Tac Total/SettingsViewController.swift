//
//  SettingsViewController.swift
//  Tic Tac Total
//
//  Created by Andrew Bellamy on 5/4/17.
//  Copyright © 2017 Andrew Bellamy. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var playerOneSymbolButton: UIButton!
    @IBOutlet weak var playerTwoSymbolButton: UIButton!
    @IBOutlet weak var playerTwoAI: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if (aiIsOn == true) {
            playerTwoAI.isOn = true
        } else {
            playerTwoAI.isOn = false
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func changePlayerSymbol(_ sender: UIButton) {
        performSegue(withIdentifier: "SymbolSelectSegue", sender: sender)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "SymbolSelectSegue" {
            
            let toViewController = segue.destination as! SymbolsViewController
            
            toViewController.requestingPlayer = (sender as AnyObject).tag
            
        }
    }

    @IBAction func onSetAI(_ sender: UISwitch) {
        if (sender.isOn == true) {
            aiIsOn = true
        } else {
            aiIsOn = false
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
