//
//  Extention + Uibutton.swift
//  UserDefaults
//
//  Created by Николай Петров on 14.03.2022.
//

import UIKit

extension UIButton {
    func pulse() {
        let pulse =  CASpringAnimation(keyPath: "transform.scale")
        pulse.fromValue = 0.95
        pulse.toValue = 1
        layer.add(pulse, forKey: nil)
    }
}
