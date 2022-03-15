//
//  Extention + TextFieldDelegate.swift
//  UserDefaults
//
//  Created by Николай Петров on 14.03.2022.
//

import UIKit

extension WelcomeViewController {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
  
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == firstNameField {
            textField.resignFirstResponder()
            secondNameField.becomeFirstResponder()
        } else {
            changeLable()
        }

        return true
    }
    
}
