//
//  ViewController.swift
//  Tic Tac Total
//
//  Created by Andrew Bellamy ID : 215240036 on 16/3/17
//  SIT206 Assignment 1
//  Copyright © 2017 Andrew Bellamy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //I
    var gameHistory = [Game]()
    
    var playerOne = Player(name: "player one", avatar: "2", symbol: "1", point: 3, score: 0,identifier: 1),
        playerTwo = Player(name: "player two", avatar: "19", symbol: "4", point: 4, score: 0, identifier: 2),
        gameBoard:Board!,
        currentPlayer:Player!
    
    @IBOutlet weak var runTime: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func newGame(_ sender: UIButton) {
        currentPlayer = playerOne
        gameBoard = Board(A: 0,B: 0,C: 0,D: 0,E: 0,F: 0,G: 0,H: 0,I: 0)
        updatePlayerLabel()
    }
    
    @IBAction func square(_ sender: UIButton) {
        
        switch sender.tag {
        case 1:
            sender.setImage(UIImage(named: (currentPlayer.symbol)!), for: .normal)
            gameBoard.A = (currentPlayer.point)!
            changePlayer()
            sender.isEnabled = false
        case 2:
            sender.setImage(UIImage(named: (currentPlayer.symbol)!), for: .normal)
            gameBoard.B = (currentPlayer.point)!
            changePlayer()
            sender.isEnabled = false
        case 3:
            sender.setImage(UIImage(named: (currentPlayer.symbol)!), for: .normal)
            gameBoard.C = (currentPlayer.point)!
            changePlayer()
            sender.isEnabled = false
        case 4:
            sender.setImage(UIImage(named: (currentPlayer.symbol)!), for: .normal)
            gameBoard.D = (currentPlayer.point)!
            changePlayer()
            sender.isEnabled = false
        case 5:
            sender.setImage(UIImage(named: (currentPlayer.symbol)!), for: .normal)
            gameBoard.E = (currentPlayer.point)!
            changePlayer()
            sender.isEnabled = false
        case 6:
            sender.setImage(UIImage(named: (currentPlayer.symbol)!), for: .normal)
            gameBoard.F = (currentPlayer.point)!
            changePlayer()
            sender.isEnabled = false
        case 7:
            sender.setImage(UIImage(named: (currentPlayer.symbol)!), for: .normal)
            gameBoard.G = (currentPlayer.point)!
            changePlayer()
            sender.isEnabled = false
        case 8:
            sender.setImage(UIImage(named: (currentPlayer.symbol)!), for: .normal)
            gameBoard.H = (currentPlayer.point)!
            changePlayer()
            sender.isEnabled = false
        case 9:
            sender.setImage(UIImage(named: (currentPlayer.symbol)!), for: .normal)
            gameBoard.I = (currentPlayer.point)!
            changePlayer()
            sender.isEnabled = false
        default: break
            //Nothing
        }
        
        
    }

    
    func changePlayer () {
        if (currentPlayer.identifier == 1) {
            currentPlayer = playerTwo
        } else {
            currentPlayer = playerOne
        }
        updatePlayerLabel()
    }
    
    func updatePlayerLabel() {
        runTime.text = currentPlayer.name
    }
    
    func gameEnded(winner: Player, result: String) {
        //var tempGame = Game(winner: Player, result: "")
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
    var winner:Player?
    var result:String
}

struct Player {
    var name:String?
    var avatar:String?
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
