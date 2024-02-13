//
//  CalculatorVC.swift
//  AppAlcoolOuGasolina
//
//  Created by Ermesson Lima on 12/02/24.
//

import UIKit

class CalculatorVC: UIViewController {
    
    var screen: CalculatorScreen?
    
    var alert: Alert?
    

    override func loadView() {
        
        screen = CalculatorScreen()
        view = screen
    }
    

    override func viewDidLoad() {
        super.viewDidLoad() 
        hideKeyboardWhenTappedAround()
        screen?.delegate(delegate: self)
        alert = Alert(controller: self)
  
    }
    
      func validateTextFields()-> Bool {
        guard let ethanolPrice = screen?.ethanolPriceTextField.text else {return false}
        guard let gasPrice = screen?.gasPriceTextField.text else {return false}
        
            
          if ethanolPrice.isEmpty && gasPrice.isEmpty {
              alert?.showAlertInformation(title: "Atencao", message: "Informe os valores do alcool e da gasolina")
              return false
          }
          
          if ethanolPrice.isEmpty {
              alert?.showAlertInformation(title: "Atencao", message: "Informe o valor do alcool")
              return false
          }
        
          if gasPrice.isEmpty {
              alert?.showAlertInformation(title: "Atencao", message: "Informe o valor da gasolinar")
              return false
          }
        
            return true
    }
    
    

}


extension CalculatorVC: CalculatorScreenDelegate {
    func tappedCalculateButton() {
 
        if validateTextFields() {
            
            let formatter = NumberFormatter()
            formatter.numberStyle = .decimal
            
            let ethanolPrice: Double = (formatter.number(from: screen?.ethanolPriceTextField.text ?? "0.0")
                                        as? Double) ?? 0.0
            
            let gasPrice: Double = (formatter.number(from: screen?.gasPriceTextField.text ?? "0.0")
                                    as? Double) ?? 0.0
            
            
            var vc: ResultVC?
            if ethanolPrice / gasPrice > 0.7 {
                vc = ResultVC(bestFuel: .gas)
              print("Melhor utilizar Gasolina!")
            } else {
                vc = ResultVC(bestFuel: .ethanol)
                print("Melhor utilizar Alcool!")
            }
            navigationController?.pushViewController(vc ?? UIViewController(), animated: true)
        }
        
    }
    
    func tappedBackButton() {
        navigationController?.popViewController(animated: true)
    }
}
