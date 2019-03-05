//
//  SelectTimeVC.swift
//  ReusablePopups
//
//  Created by Brandon Mahoney on 3/4/19.
//  Copyright © 2019 Brandon Mahoney. All rights reserved.
//

import UIKit

class SelectTimeVC: UIViewController {
    
    @IBOutlet weak var timeLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

    @IBAction func selectTimePressed(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "DatePopupVC", bundle: nil)
        let popup = storyboard.instantiateInitialViewController()! as! DatePopupVC
        popup.showTimePicker = true
        popup.delegate = self
        present(popup, animated: true)
    }
    
}


extension SelectTimeVC: PopupDelegate {
    
    func popupValueSelected(value: String) {
        timeLabel.text = value
    }
    
}
