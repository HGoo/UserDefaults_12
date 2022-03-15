//
//  Extention + Alert.swift
//  UserDefaults
//
//  Created by Николай Петров on 14.03.2022.
//

import UIKit

extension WelcomeViewController {
    func wrongFotmatAlert(fieldNmae: String = "") {
        let alert = UIAlertController(title: "Wrong Format!",
                                      message: "Please enter your \(fieldNmae)name",
                                      preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "Ok",
                                     style: .default,
                                     handler: nil)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
}
