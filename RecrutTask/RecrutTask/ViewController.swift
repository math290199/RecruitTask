//
//  ViewController.swift
//  RecrutTask
//
//  Created by Magnis-2 on 7/8/19.
//  Copyright © 2019 Magnis-2. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
  
    
    @IBOutlet weak var livePlace: UITextField!
    @IBOutlet weak var DatePicker: UITextField!
    @IBOutlet weak var phoneNumber: UITextField!
    @IBOutlet weak var studyPlace: UITextField!
   
    @IBOutlet weak var biography: UITextView!
    @IBOutlet weak var bornPlace: UITextField!
    
       private var datePicker:UIDatePicker?
    
    @IBAction func saveButton(_ sender: Any) {
    
        let file = "filetxt"
        
        
        var saveData = " "
        saveData =
        livePlace.text! + "\n" + DatePicker.text! + "\n" +
        bornPlace.text! + "\n" + studyPlace.text!  + "\n" +
        phoneNumber.text!  + "\n" + biography.text!
        
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            
            let fileURL = dir.appendingPathComponent(file)
            
            print (fileURL)
            do {
                try saveData.write(to: fileURL, atomically: false, encoding: .utf8)
            }
            catch {}
            
        }
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       // registerForKeyboardNotifications()
        datePicker = UIDatePicker()
        datePicker?.datePickerMode = .date
        datePicker?.addTarget(self,action: #selector(ViewController.dateChanged(datePicker:)),
                              for: .valueChanged)
        
        let tapGesture = UITapGestureRecognizer(target: self, action:
            #selector(ViewController.viewTapped(gestureRecognizer:)))
        view.addGestureRecognizer(tapGesture)
        DatePicker.inputView=datePicker

        
    }

    
    
    @objc func viewTapped(gestureRecognizer:UITapGestureRecognizer){
        view.endEditing(true)
    }
    @objc func dateChanged(datePicker: UIDatePicker){
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM d, yyyy"
        DatePicker.text = dateFormatter.string(from: datePicker.date)
    }
    
}

