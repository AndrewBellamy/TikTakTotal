//
//  SymbolsViewController.swift
//  Tic Tac Total
//
//  Created by Andrew Bellamy ID : 215240036 on 16/3/17
//  SIT206 Assignment 1
//  Copyright © 2017 Andrew Bellamy. All rights reserved.
//

import UIKit

class SymbolsViewController: UITableViewController {
    
    /**
     All the available assets for symbols.
    */
    var symbolArray:[String] = ["1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22"],
        requestingPlayer:Int?

    @IBOutlet var tableview: UITableView!
    @IBOutlet weak var SymbolNavBar: UINavigationItem!

    override func viewDidLoad() {
        super.viewDidLoad()
        //remove the current symbol of opposing player. No duplicates!
        if (requestingPlayer == 1) {
            SymbolNavBar.title = "Player One"
            symbolArray.remove(at: symbolArray.index(of: playerTwo.symbol!)!)
        } else if (requestingPlayer == 2) {
            SymbolNavBar.title = "Player Two"
            symbolArray.remove(at: symbolArray.index(of: playerOne.symbol!)!)
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tableview.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return symbolArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "symbolCell", for: indexPath)
        cell.imageView?.image = UIImage(named: symbolArray[indexPath.item])
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if (requestingPlayer == 1) {
            playerOne.symbol = symbolArray[indexPath.item]
        }
        if (requestingPlayer == 2) {
            playerTwo.symbol = symbolArray[indexPath.item]
        }
    }
        
}

