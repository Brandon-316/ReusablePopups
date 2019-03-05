//
//  SecondViewController.swift
//  ReusablePopups
//
//  Created by Brandon Mahoney on 3/4/19.
//  Copyright © 2019 Brandon Mahoney. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var dateLabel: UILabel!

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "datePopupSegue" {
            let destinationVC = segue.destination as! DatePopupVC
            destinationVC.showTimePicker = false
            
            //1. Assign to a function
//            destinationVC.onSave = onSave
            
            //2. Using a closure
            destinationVC.onSave = { (date) in
                self.dateLabel.text = date
            }
        }
        
    }
    
    func onSave(_ date: String) {
        dateLabel.text = date
    }


}

