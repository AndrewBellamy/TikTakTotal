//
//  SymbolsViewController.swift
//  Tic Tac Total
//
//  Created by Andrew Bellamy on 4/4/17.
//  Copyright © 2017 Andrew Bellamy. All rights reserved.
//

import UIKit

class SymbolsViewController: UITableViewController {
    
        var symbolArray:[String] = ["1","2","3","4","5","6","7","8"]
    
        @IBOutlet var tableview: UITableView!
        override func viewDidLoad() {
            super.viewDidLoad()
            
            // Do any additional setup after loading the view.
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
            cell.textLabel?.text = symbolArray[indexPath.item]
            cell.imageView?.image = UIImage(named: symbolArray[indexPath.item])
            return cell
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

