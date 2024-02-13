//
//  ResultVC.swift
//  AppAlcoolOuGasolina
//
//  Created by Ermesson Lima on 13/02/24.
//

import UIKit

enum BestFuel: String {
    case gas = "Gasolina"
    case ethanol = "Alcool"
}

class ResultVC: UIViewController {
    
    var screen: ResultScreen?
    let bestFuel: BestFuel
    
    init(bestFuel: BestFuel) {
        self.bestFuel = bestFuel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        screen = ResultScreen()
        view = screen
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        screen?.delegate(delegate: self)
        screen?.resultLabel.text = bestFuel.rawValue
    }

}


extension ResultVC: ResultScreenDelegate {
    func tappedBackButton() {
        print("eeee")
        navigationController?.popViewController(animated: true)
    }
    
    
}
