//
//  AddDogViewController.swift
//  DogData
//
//  Created by Macbook on 18/04/2016.
//  Copyright © 2016 Chappy-App. All rights reserved.
//

import UIKit
import RealmSwift


class AddDogViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {


    @IBOutlet weak var picker: UIPickerView!
    @IBOutlet weak var nameTextField: UITextField!


    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.picker.dataSource = self
        self.picker.delegate = self
    
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 101
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
        
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(row)"
        
        
    }

    @IBAction func saveTapped(sender: AnyObject) {
    
        let dogAge = self.picker.selectedRowInComponent(0)
        let dogName = self.nameTextField.text!
        
        let dog = Dog()
        dog.name = dogName
        dog.age = dogAge
        
               
        let realm = try! Realm()
        
        try! realm.write {
            realm.add(dog)
        }
        
        self.navigationController?.popViewControllerAnimated(true)
     
    }
  
}
