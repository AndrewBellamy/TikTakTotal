//
//  MenuViewController.swift
//  Tic Tac Total
//
//  Created by Andrew Bellamy ID : 215240036 on 16/3/17
//  SIT206 Assignment 1
//  Copyright © 2017 Andrew Bellamy. All rights reserved.
//

import UIKit

/**
 global variables
 - used by: viewController and menuViewController
 */
var gameHistory = [Game](),
playerOne = Player(name: "Player one", symbol: "1", point: 3, score: 0, identifier: 1),
playerTwo = Player(name: "Player two", symbol: "4", point: 4, score: 0, identifier: 2),
aiIsOn:DarwinBoolean = true

class MenuViewController: UIViewController {
    
    //Player symbols on the menu
    @IBOutlet weak var playerOneSymbol: UIImageView!
    @IBOutlet weak var playerTwoSymbol: UIImageView!
    @IBOutlet weak var playerOneScore: UILabel?
    @IBOutlet weak var playerTwoScore: UILabel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        playerOneSymbol.image = UIImage(named: playerOne.symbol!)
        playerTwoSymbol.image = UIImage(named: playerTwo.symbol!)
        playerOneScore?.text = String(playerOne.score)
        playerTwoScore?.text = String(playerTwo.score)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /**
     Handles segue from menu to the game viewController.
    */
    @IBAction func newGame(_ sender: UIButton) {
        performSegue(withIdentifier: "NewGameSegue", sender: nil)
    }
    
    @IBAction func settings(_ sender: Any) {
        performSegue(withIdentifier: "SettingsSegue", sender: nil)
    }
    
    /**
     Handles segue from menu to the history tableViewController.
    */
    @IBAction func history(_ sender: UIButton) {
        performSegue(withIdentifier: "HistorySegue", sender: nil)
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

struct Player {
    var name:String?
    var symbol:String?
    var point:Int?
    var score:Int = 0
    var identifier:Int
    mutating func changeSymbol() {
        if symbol == "1" {
            self.symbol = "4"
        } else {
            self.symbol = "1"
        }
    }
}
