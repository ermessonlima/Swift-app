//
//  ResultScreen.swift
//  AppAlcoolOuGasolina
//
//  Created by Ermesson Lima on 13/02/24.
//

import UIKit

protocol ResultScreenDelegate : AnyObject {
    func tappedBackButton()
}

class ResultScreen: UIView {
    

    private weak var delegate: ResultScreenDelegate?
    
    public func delegate(delegate: ResultScreenDelegate?) {
        self.delegate = delegate
    }
    
    lazy var backgroundImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "BG BLUR DARK")
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    lazy var logoAppImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "LOGO menor")
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    lazy var sentenceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 31)
        label.text = "Abasteça com:"
        return label
    }()
    
    lazy var resultLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 73)
        label.text = "Gasolina"
        return label
    }()
    
    lazy var calculationButton : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Calcular novamente", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        button.clipsToBounds = true
        button.layer.cornerRadius = 8
        button.backgroundColor = UIColor(red: 230/255, green: 0/255, blue: 127/255, alpha: 1.0)
       button.addTarget(self, action: #selector(tappedBackButton), for: .touchUpInside)
        return button
    }()
    
    @objc func tappedBackButton(){
        delegate?.tappedBackButton()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(backgroundImage)
        addSubview(logoAppImageView)
        addSubview(sentenceLabel)
        addSubview(resultLabel)
        addSubview(calculationButton)
        configContraints()
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configContraints() {
        NSLayoutConstraint.activate([
            backgroundImage.topAnchor.constraint(equalTo: topAnchor),
            backgroundImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundImage.trailingAnchor.constraint(equalTo: trailingAnchor),
            backgroundImage.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            
            
            logoAppImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 60),
            logoAppImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            logoAppImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            sentenceLabel.topAnchor.constraint(equalTo: logoAppImageView.bottomAnchor, constant: 180),
            sentenceLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
             
            resultLabel.topAnchor.constraint(equalTo: sentenceLabel.bottomAnchor, constant: 12),
            resultLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            calculationButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -125),
            calculationButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 60),
            calculationButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -60),
            calculationButton.heightAnchor.constraint(equalToConstant: 44)
            
        ])
    }
}
