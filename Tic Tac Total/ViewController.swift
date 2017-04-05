//
//  ViewController.swift
//  Tic Tac Total
//
//  Created by Andrew Bellamy ID : 215240036 on 16/3/17
//  SIT206 Assignment 1
//  Copyright © 2017 Andrew Bellamy. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    /**
     Initialization variables
    */
    var gameBoard:Board!,
        currentPlayer:Player!,
        player: AVAudioPlayer!
    
    /**
     In UI controls, set as variables for programmatic use.
    */
    @IBOutlet weak var runTime: UILabel!
    @IBOutlet weak var buttonA: UIButton!
    @IBOutlet weak var buttonB: UIButton!
    @IBOutlet weak var buttonC: UIButton!
    @IBOutlet weak var buttonD: UIButton!
    @IBOutlet weak var buttonE: UIButton!
    @IBOutlet weak var buttonF: UIButton!
    @IBOutlet weak var buttonG: UIButton!
    @IBOutlet weak var buttonH: UIButton!
    @IBOutlet weak var buttonI: UIButton!
    @IBOutlet weak var musicSwitch: UISwitch!
    @IBOutlet weak var playerAvatarImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        newLoad()
    }
    
    /**
     Convenience method for handling the new game on segue.
     - returns:
     Sets all gameboard buttons to clear, currentPlayer as player one
     and sets up the music player
    */
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
        musicSwitch.isOn = false
        setupMusicPlayer()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /**
     Handles the music player events when switch is clicked.
     
     - parameters:
        - sender: The UISwitch control.
     
     - returns:
     Switches between play and stop.
    */
    @IBAction func music(_ sender: UISwitch) {
        if player != nil {
            if player.isPlaying {
                player.stop()
            } else {
                player.numberOfLoops = -1
                player.prepareToPlay()
                player.play()
            }
        }
    }
    
    /**
     Handles the event called by each button on the game board grid.
     
     - parameters:
        - sender: The UI Button control.
    */
    @IBAction func square(_ sender: UIButton) {
        
        self.view.isUserInteractionEnabled = false
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
        self.view.isUserInteractionEnabled = true
    }
    
    /**
     Handles changing the current player. Will also call the aiResponse method of the
     game board and the updatePlayerLabel method.
    */
    func changePlayer () {
        if (currentPlayer.identifier == 1) {
            currentPlayer = playerTwo
            if (aiIsOn == true) {
                let next = gameBoard.aiResponse()
                print(next)
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    switch next {
                    case "A":
                        self.buttonA.sendActions(for: .touchUpInside)
                    case "B":
                        self.buttonB.sendActions(for: .touchUpInside)
                    case "C":
                        self.buttonC.sendActions(for: .touchUpInside)
                    case "D":
                        self.buttonD.sendActions(for: .touchUpInside)
                    case "E":
                        self.buttonE.sendActions(for: .touchUpInside)
                    case "F":
                        self.buttonF.sendActions(for: .touchUpInside)
                    case "G":
                        self.buttonG.sendActions(for: .touchUpInside)
                    case "H":
                        self.buttonH.sendActions(for: .touchUpInside)
                    case "I":
                        self.buttonI.sendActions(for: .touchUpInside)
                    default:
                        print("Error: AI response didn't return")
                    }
                }
            }
            
        } else {
            currentPlayer = playerOne
        }
        updatePlayerLabel()
    }
    
    /**
     Handles setting the UI controls label and image view to reflect the current player.
    */
    func updatePlayerLabel() {
        runTime.text = currentPlayer.name
        playerAvatarImage.image = UIImage(named: currentPlayer.symbol!)
    }
    
    /**
     Handles adding a winning score to the current player. Called by check result method.
    */
    func updatePlayerScores(identifier: Int) {
        switch identifier {
            case 1:
                playerOne.score = playerOne.score + 1
            case 2:
                playerTwo.score = playerTwo.score + 1
            default:break
        }
        
    }
    
    /**
     Handles all UI and programmatic events when the game ends.
    */
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
            updatePlayerScores(identifier: currentPlayer.identifier)
        }
        gameHistory.append(tempGame)
        
    }
    
    /**
     Loads the audio control and music asset
     
     - throws:
        an error if music asset isn;t found.
    */
    func setupMusicPlayer() {
        
        let sound = NSDataAsset(name: "cellosuite")
        
        do {
            player = try AVAudioPlayer(data: (sound?.data)!)
        } catch let error {
            print(error.localizedDescription)
        }
    }
}

/**
 Struct for the game board. Each board conatins methods for checking if a result has occured
 and responding as player two AI.
 
 - methods:
 checkResult
 aiResponse
 
 - variables: 
 A:Int, B:Int, C:Int, D,:Int E:Int, F:Int, G:Int, H:Int, I:Int
*/
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
    
    /**
     Handles calculations for determining the game result.
     
     - parameters: 
        - player: Caller passes the current player which is assigned the win.
     
     - returns: String result, either player win or draw.
    */
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
    
    /**
     Handles the response from AI. Using a three tier set of nested conditionals.
     The first response for the AI is to win. The second response is to stop the opposing
     player from winning. The third response is to increase opportunity and decrease the
     opposing opportunity.
     
     - returns: String for AI response
     */
    mutating func aiResponse() -> String {
        let dictionary:[String:Int] = ["A":A,"B":B,"C":C,"D":D,"E":E,"F":F,"G":G,"H":H,"I":I]
        let dictArray:[[String:Int]] = [
            ["A":A, "B":B, "C":C],
            ["D":D, "E":E, "F":F],
            ["G":G, "H":H, "I":I],
            ["A":A, "D":D, "G":G],
            ["B":B, "E":E, "H":H],
            ["C":C, "F":F, "I":I],
            ["A":A, "E":E, "I":I],
            ["G":G, "E":E, "C":C],
        ]
        var nextMove = ""
        
        //1st response
        for dict in dictArray {
            var calc = 0
            var key = ""
            for (name,value) in dict {
                calc += value
                if (value == 0) {
                    key = name
                }
            }
            if (calc == 8) {
                nextMove = key
                return nextMove
            }
        }
        
        //2nd response
        for dict in dictArray {
            var calc = 0
            var key = ""
            for (name,value) in dict {
                calc += value
                if (value == 0) {
                    key = name
                }
            }
            if (calc == 6) {
                nextMove = key
                return nextMove
            }
        }
        
        var highestCount = 0
        
        //3rd response
        for (name,value) in dictionary {
            var count = 0
            if (value == 0) {
                print("possible: " + name)
                switch name {
                case "A":
                    self.A = 5
                    if (self.I == 0) {
                        self.I = 7
                    }
                case "B":
                    self.B = 5
                case "C":
                    self.C = 5
                    if (self.G == 0) {
                        self.G = 7
                    }
                case "D":
                    self.D = 5
                case "E":
                    self.E = 5
                case "F":
                    self.F = 5
                case "G":
                    self.G = 5
                    if (self.C == 0) {
                        self.C = 7
                    }
                case "H":
                    self.H = 5
                case "I":
                    self.I = 5
                    if (self.A == 0) {
                        self.A = 7
                    }
                default :
                    print("No moves left")
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
                    print(calc)
                    if (calc == 5 || calc == 8 || calc == 9 || calc == 15) {
                        count = count + 1
                    }
                    if (calc == 12) {
                        count = count - 1
                    }
                    if (calc == 16) {
                        count = count - 2
                    }
                }
                if (count >= highestCount) {
                    nextMove = name
                    highestCount = count
                }
                switch name {
                case "A":
                    self.A = 0
                    if (self.I == 7) {
                        self.I = 0
                    }
                case "B":
                    self.B = 0
                case "C":
                    self.C = 0
                    if (self.G == 7) {
                        self.G = 0
                    }
                case "D":
                    self.D = 0
                case "E":
                    self.E = 0
                case "F":
                    self.F = 0
                case "G":
                    self.G = 0
                    if (self.C == 7) {
                        self.C = 0
                    }
                case "H":
                    self.H = 0
                case "I":
                    self.I = 0
                    if (self.A == 7) {
                        self.A = 0
                    }
                default :
                    print("No moves left")
                }
            }
            
        }
        return nextMove
    }
}

/**
 Struct for game results which are appended to the game history once a game has ended.
 These are displayed in the history UI table.
 */
struct Game {
    var result:String
}
