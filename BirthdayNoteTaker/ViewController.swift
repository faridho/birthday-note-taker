//
//  ViewController.swift
//  BirthdayNoteTaker
//
//  Created by Faridho on 08/03/20.
//  Copyright © 2020 Faridho. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var birthdayTextField: UITextField!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var birthdayLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //call stored from database
        let storedName = UserDefaults.standard.object(forKey: "name")
        let storedBirthday = UserDefaults.standard.object(forKey: "birthday")
        
        //Casting - as? vs as!
        if let newName = storedName as? String {
            nameLabel.text = "Name: \(newName)"
        }
        
        if let newbBirthday = storedBirthday as? String {
            birthdayLabel.text = "Birthday: \(newbBirthday)"
        }
        
    }


    @IBAction func saveClicked(_ sender: Any) {
        //store database
        UserDefaults.standard.set(nameTextField.text!, forKey: "name")
        UserDefaults.standard.set(birthdayTextField.text!, forKey: "birthday")
        
        nameLabel.text = "Name: \(nameTextField.text!)"
        birthdayLabel.text = "Birthday: \(birthdayTextField.text!)"
    }
    
    
    @IBAction func deleteClicked(_ sender: Any) {
        let storedName = UserDefaults.standard.object(forKey: "name")
        let storedBirthday = UserDefaults.standard.object(forKey: "birthday")
        
        //"" vs nill
        if (storedName as? String) != nil {
            UserDefaults.standard.removeObject(forKey: "name")
            nameLabel.text = "Name: "
        }
        
        if (storedBirthday as? String) != nil {
            UserDefaults.standard.removeObject(forKey: "birthday")
            birthdayLabel.text = "Birthday: "
        }
    }
}

