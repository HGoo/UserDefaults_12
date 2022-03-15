//
//  LoadedScreen.swift
//  UserDefaults
//
//  Created by Николай Петров on 14.03.2022.
//

import UIKit

class LoadedScreen: UIView {

    
    override func draw(_ rect: CGRect) {
        
        let gradient = WelcomeViewController()
        gradient.addVerticalGradientLayer(topColor: gradient.primaryColor,
                                          bottomColor: gradient.secondaryColor)
    }
    

}
