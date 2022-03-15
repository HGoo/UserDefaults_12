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
    
    // MARK: - Publick Properties
    let primaryColor = UIColor(red: 210/255, green: 109/255, blue: 128/255, alpha: 1)
    let secondaryColor = UIColor(red: 50/255, green: 50/255, blue: 50/255, alpha: 1)
    
    // MARK: - Private Properties
    private var user = User()
  
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        addVerticalGradientLayer(topColor: primaryColor, bottomColor: secondaryColor)
        
        firstNameField.delegate = self
        secondNameField.delegate = self
        
        setUserData()
    }
    
    // MARK: - Methods
    func changeLable() {
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
            user.name = firstName
            user.surname = secondName
            //StorageManager.shared.saveUser(user)
            StorageManager.shared.saveUserToFile(user)
        }
        
        firstNameField.text = nil
        secondNameField.text = nil
        
    }
    
    // MARK: - Private Methods
    private func setUserData() {
        //user = StorageManager.shared.getUser()
        
        user = StorageManager.shared.getUserfromFile()
        userNameLable.text = user.name + " " + user.surname
    }
    
    // MARK: - IBActions
    @IBAction func doneButton(_ sender: UIButton) {
        
        sender.pulse()
        changeLable()
    }
}

