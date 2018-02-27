//
//  ViewController.swift
//  Binary Counter
//
//  Created by Noel Mendoza on 1/22/18.
//  Copyright © 2018 Noel Mendoza. All rights reserved.
//

import UIKit

class ViewController: UIViewController, BinaryCellDelegate, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var myTable: UITableView!
    @IBOutlet var totalLabel: UILabel!
    
    var exponents:[Double] = [1,10, pow(10, 2), pow(10, 3), pow(10, 4), pow(10, 5), pow(10, 6), pow(10, 7), pow(10, 8), pow(10, 9), pow(10, 10), pow(10, 11), pow(10, 12), pow(10, 13), pow(10, 14), pow(10, 15), pow(10, 16)]
    
    var total = 0.0
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return exponents.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BinaryCell", for: indexPath) as! BinaryCell
        
        cell.myValue = exponents[indexPath.row]
        cell.numberLabel.text = String(describing: exponents[indexPath.row])
        tableView.rowHeight = 33
        cell.delegate = self
        
        return cell
    }
    
    func addToTotal(senderVal: Double){
        self.total += senderVal
        totalLabel.text = "Total: \(self.total)"
        
    }
    
    func removeFromTotal(senderVal: Double){
        self.total -= senderVal
        totalLabel.text = "Total: \(self.total)"
    }
    
    override func viewDidLoad() {
        myTable.delegate = self
        myTable.dataSource = self
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

