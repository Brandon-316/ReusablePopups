//
//  DatePopupVC.swift
//  ReusablePopups
//
//  Created by Brandon Mahoney on 3/4/19.
//  Copyright © 2019 Brandon Mahoney. All rights reserved.
//

import UIKit

class DatePopupVC: UIViewController {
    
    //MARK: - Properties
    var showTimePicker: Bool = false
    var onSave: ((_ date: String) -> ())?
    
    var delegate: PopupDelegate?
    
    var formattedDate: String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter.string(from: datePicker.date)
    }
    var formattedTime: String {
        get {
            let formatter = DateFormatter()
            formatter.timeStyle = .short
            return formatter.string(from: datePicker.date)
        }
    }
    
    //MARK: - Outlets
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var saveButton: UIButton!
    

    //MARK: - Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()

        if showTimePicker {
            titleLabel.text = "Select Time"
            datePicker.datePickerMode = .time
            saveButton.setTitle("Save Time", for: .normal)
        }
        
    }
    
    //MARK: - Actions
    @IBAction func saveDatePressed(_ sender: Any) {
        NotificationCenter.default.post(name: .saveDateTime, object: self)
        
        if showTimePicker {
            onSave?(formattedTime)
            delegate?.popupValueSelected(value: formattedTime)
        } else {
            onSave?(formattedDate)
            delegate?.popupValueSelected(value: formattedDate)
        }
        
        self.dismiss(animated: true, completion: nil)
    }
    
}
