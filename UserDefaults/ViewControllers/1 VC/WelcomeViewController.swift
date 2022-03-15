//
//  ViewController.swift
//  UserDefaults
//
//  Created by Николай Петров on 14.03.2022.
//

import UIKit

class WelcomeViewController: UIViewController, UITextFieldDelegate {
    
    // MARK: - IBOutlets
    @IBOutlet var userNameLable: UILabel!
    @IBOutlet var firstNameField: UITextField!
    @IBOutlet var secondNameField: UITextField!
    
    // MARK: - Private Properties
    let primaryColor = UIColor(red: 210/255, green: 109/255, blue: 128/255, alpha: 1)
    let secondaryColor = UIColor(red: 50/255, green: 50/255, blue: 50/255, alpha: 1)
    
    // MARK: - Publick Properties
    
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        addVerticalGradientLayer(topColor: primaryColor, bottomColor: secondaryColor)
        
        userNameLable.isHidden = true
        firstNameField.delegate = self
        secondNameField.delegate = self
        
        if let userName = UserDefaults.standard.value(forKey: "fullName") {
            userNameLable.isHidden = false
            userNameLable.text = userName as? String
        }
    }
    
    // MARK: - Methods
    func changeLable() { //слишком большой метод
        guard let firstName = firstNameField.text, !(firstName.isEmpty) else {
            wrongFotmatAlert(fieldNmae: "first ")
            return
        }
        guard let secondName = secondNameField.text, !(secondName.isEmpty) else {
            wrongFotmatAlert(fieldNmae: "second ")
            return
        }

        if let _ = Double(firstName) {
            wrongFotmatAlert()
        } else if let _ = Double(secondName) {
            wrongFotmatAlert()
            secondNameField.text = nil
            return
        } else {
            userNameLable.text = firstName + "\n" + secondName
            userNameLable.isHidden = false
            saveUserData()
        }
        
        firstNameField.text = nil
        secondNameField.text = nil
        
    }
    
    // MARK: - Private Methods
    func saveUserData() {
        UserDefaults.standard.set(userNameLable.text, forKey: "fullName")
    }
    
    
    // MARK: - IBActions
    @IBAction func doneButton(_ sender: UIButton) {
        
        sender.pulse()
        changeLable()
        
    }
    
    // MARK: - Navigation
    
}


