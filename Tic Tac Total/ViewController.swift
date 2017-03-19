//
//  ViewController.swift
//  Tic Tac Total
//
//  Created by Andrew Bellamy on 16/3/17.
//  Copyright © 2017 Andrew Bellamy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let nought:Int = 3
    let cross:Int = 4
    var finished:Bool = false
    
    var gameHistory = [Game]()
    
    var playerOne = Player(name: "player one", avatar: "2", symbol: "1", point: 3, score: 0),
        playerTwo = Player(name: "player two", avatar: "19", symbol: "4", point: 4, score: 0),
        gameBoard:Board?,
        currentPlayer:Player?,
        restingPlayer:Player?
    
    @IBOutlet weak var runTime: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func newGame(_ sender: Any) {
        gameBoard = Board(A: 0,B: 0,C: 0,D: 0,E: 0,F: 0,G: 0,H: 0,I: 0)
        currentPlayer = playerOne
        restingPlayer = playerTwo
        updatePlayerLabel()
    }

    @IBAction func squareA(_ sender: UIButton) {
        sender.setImage(UIImage(named: (currentPlayer?.symbol)!), for: .normal)
        gameBoard?.A = (currentPlayer?.point)!
        changePlayer()
        sender.isEnabled = false
    }
    
    @IBAction func squareB(_ sender: UIButton) {
        sender.setImage(UIImage(named: (currentPlayer?.symbol)!), for: .normal)
        gameBoard?.B = (currentPlayer?.point)!
        changePlayer()
        sender.isEnabled = false
    }
    
    @IBAction func squareC(_ sender: UIButton) {
        sender.setImage(UIImage(named: (currentPlayer?.symbol)!), for: .normal)
        gameBoard?.C = (currentPlayer?.point)!
        changePlayer()
        sender.isEnabled = false
    }
    
    @IBAction func squareD(_ sender: UIButton) {
        sender.setImage(UIImage(named: (currentPlayer?.symbol)!), for: .normal)
        gameBoard?.D = (currentPlayer?.point)!
        changePlayer()
        sender.isEnabled = false
    }
    
    func changePlayer() {
        let tempCurrent = currentPlayer
        let tempResting = restingPlayer
        currentPlayer = tempResting
        restingPlayer = tempCurrent
        updatePlayerLabel()
    }
    
    func updatePlayerLabel() {
        runTime.text = currentPlayer?.name
    }
    
    
}

struct Board {
    var A:Int,
    B:Int,
    C:Int,
    D:Int,
    E:Int,
    F:Int,
    G:Int,
    H:Int,
    I:Int
}

struct Game {
    var gameBoard:Board
    var winner:Player
}

struct Player {
    var name:String?
    var avatar:String?
    var symbol:String?
    var point:Int?
    var score:Int = 0
    mutating func changeSymbol() {
        if symbol == "1" {
            self.symbol = "4"
        } else {
            self.symbol = "1"
        }
    }
}
