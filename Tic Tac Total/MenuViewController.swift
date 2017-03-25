//
//  MenuViewController.swift
//  Tic Tac Total
//
//  Created by Andrew Bellamy on 25/3/17.
//  Copyright © 2017 Andrew Bellamy. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func newGame(_ sender: UIButton) {
        performSegue(withIdentifier: "NewGameSegue", sender: nil)
    }

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
