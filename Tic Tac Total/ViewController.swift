//
//  ViewController.swift
//  Tic Tac Total
//
//  Created by Andrew Bellamy ID : 215240036 on 16/3/17
//  SIT206 Assignment 1
//  Copyright © 2017 Andrew Bellamy. All rights reserved.
//

import UIKit

var gameHistory = [Game]()

class ViewController: UIViewController {

    var playerOne = Player(name: "player one", symbol: "1", point: 3, score: 0,identifier: 1),
        playerTwo = Player(name: "player two", symbol: "4", point: 4, score: 0, identifier: 2),
        gameBoard:Board!,
        currentPlayer:Player!
    //top label
    @IBOutlet weak var runTime: UILabel!
    //UI button elements for enabling/disabling
    @IBOutlet weak var buttonA: UIButton!
    @IBOutlet weak var buttonB: UIButton!
    @IBOutlet weak var buttonC: UIButton!
    @IBOutlet weak var buttonD: UIButton!
    @IBOutlet weak var buttonE: UIButton!
    @IBOutlet weak var buttonF: UIButton!
    @IBOutlet weak var buttonG: UIButton!
    @IBOutlet weak var buttonH: UIButton!
    @IBOutlet weak var buttonI: UIButton!
    @IBOutlet weak var playerAvatarImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        newLoad()
    }
    
    func newLoad () {
        currentPlayer = playerOne
        gameBoard = Board(A: 0,B: 0,C: 0,D: 0,E: 0,F: 0,G: 0,H: 0,I: 0)
        updatePlayerLabel()
        let buttonArray:[UIButton] = [
            buttonA,
            buttonB,
            buttonC,
            buttonD,
            buttonE,
            buttonF,
            buttonG,
            buttonH,
            buttonI
        ]
        for button in buttonArray {
            button.setImage(nil, for: .normal)
            button.isEnabled = true
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func square(_ sender: UIButton) {
        
        switch sender.tag {
        case 1:
            sender.setImage(UIImage(named: (currentPlayer.symbol)!), for: .normal)
            gameBoard.A = (currentPlayer.point)!
            sender.isEnabled = false
        case 2:
            sender.setImage(UIImage(named: (currentPlayer.symbol)!), for: .normal)
            gameBoard.B = (currentPlayer.point)!
            sender.isEnabled = false
        case 3:
            sender.setImage(UIImage(named: (currentPlayer.symbol)!), for: .normal)
            gameBoard.C = (currentPlayer.point)!
            sender.isEnabled = false
        case 4:
            sender.setImage(UIImage(named: (currentPlayer.symbol)!), for: .normal)
            gameBoard.D = (currentPlayer.point)!
            sender.isEnabled = false
        case 5:
            sender.setImage(UIImage(named: (currentPlayer.symbol)!), for: .normal)
            gameBoard.E = (currentPlayer.point)!
            sender.isEnabled = false
        case 6:
            sender.setImage(UIImage(named: (currentPlayer.symbol)!), for: .normal)
            gameBoard.F = (currentPlayer.point)!
            sender.isEnabled = false
        case 7:
            sender.setImage(UIImage(named: (currentPlayer.symbol)!), for: .normal)
            gameBoard.G = (currentPlayer.point)!
            sender.isEnabled = false
        case 8:
            sender.setImage(UIImage(named: (currentPlayer.symbol)!), for: .normal)
            gameBoard.H = (currentPlayer.point)!
            sender.isEnabled = false
        case 9:
            sender.setImage(UIImage(named: (currentPlayer.symbol)!), for: .normal)
            gameBoard.I = (currentPlayer.point)!
            sender.isEnabled = false
        default: break
            //Nothing
        }
        
        if (gameBoard.checkResult(player: currentPlayer.name!) != nil) {
            let alertController = UIAlertController(title: "Game Over", message: gameBoard.checkResult(player: currentPlayer.name!),
                preferredStyle: .alert)
            
            let yesAction = UIAlertAction(title: "Okay", style: .default) {
                (action) -> Void in print() }
            
            alertController.addAction(yesAction)
            self.present(alertController, animated: true, completion: nil)
            gameEnded(result: gameBoard.checkResult(player: currentPlayer.name!)!)
        } else {
            changePlayer()
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
        playerAvatarImage.image = UIImage(named: currentPlayer.symbol!)
    }
    
    func updatePlayerScores() {
        //playerOneScore.text = "\(playerOne.score)"
    }
    
    func gameEnded(result: String) {
        let buttonArray:[UIButton] = [
            buttonA,
            buttonB,
            buttonC,
            buttonD,
            buttonE,
            buttonF,
            buttonG,
            buttonH,
            buttonI
        ]
        for button in buttonArray {
            button.isEnabled = false
        }
        let tempGame = Game(result: result)
        if (result != "Draw") {
            currentPlayer.score += 1
        }
        gameHistory.append(tempGame)
        
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
    
    func checkResult(player: String) -> String? {
        var result:String?
        let cellArray:[Int] = [A,B,C,D,E,F,G,H,I]
        let checkZero = cellArray.index(of: 0)
        if (checkZero == nil) {
            result = "Draw"
        }
        let tupleArray:[(first:Int,second:Int,third:Int)] = [
            (A, B, C),
            (D, E, F),
            (G, H, I),
            (A, D, G),
            (B, E, H),
            (C, F, I),
            (A, E, I),
            (G, E, C),
        ]
        for tuple in tupleArray {
            let calc = tuple.first + tuple.second + tuple.third
            if (calc == 9 || calc == 12) {
                result = "The winner is \(player)"
            }
            
        }
        return result
    }
}

struct Game {
    var result:String
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
