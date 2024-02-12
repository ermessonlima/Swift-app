//
//  Alert.swift
//  AppAlcoolOuGasolina
//
//  Created by Ermesson Lima on 12/02/24.
//

import UIKit

class Alert  {

    let controller: UIViewController
    
    init(controller: UIViewController) {
        self.controller = controller
    }
    
 
    func showAlertInformation(title:String, message:String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "OK", style: .default)
        alertController.addAction(okButton)
        controller.present(alertController, animated: true)
    }

}
