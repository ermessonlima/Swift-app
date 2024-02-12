//
//  CalculatorVC.swift
//  AppAlcoolOuGasolina
//
//  Created by Ermesson Lima on 12/02/24.
//

import UIKit

class CalculatorVC: UIViewController {
    
    var screen: CalculatorScreen?
    
    
    
    
    override func loadView() {
        
        screen = CalculatorScreen()
        view = screen
    }
    

    override func viewDidLoad() {
        super.viewDidLoad() 
  
    }
    
    

}
