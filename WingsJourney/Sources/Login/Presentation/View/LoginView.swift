//
//  LoginView.swift
//  WingsJourney
//
//  Created by Guilherme Medeiros Mergulhão on 06/09/23.
//

import UIKit

class LoginView: UIView{

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(){
        super.init(frame: .zero)
        buildVisuals()
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        
        if traitCollection.userInterfaceStyle == .dark{
            backgroundColor = .black
        } else {
            backgroundColor = .white
        }
    }
    
    private func buildVisuals(){
        insertUserText()
        insertPasswordText()
        insertButton()
        insertAlert()
    }
    
    private func insertUserText(){
        addSubview(userNameTextField)
        constraintUserText()
    }
    
    private func insertPasswordText(){
        addSubview(passwordTextField)
        constraintPasswordText()
    }
    
    private func insertButton(){
        addSubview(loginButton)
        constraintButton()
    }
    
    private func insertAlert(){
        addSubview(alertText)
        constraintAlertLabel()
    }
    
    lazy var userNameTextField: UITextField = {
        let textField = UITextField(frame: CGRect(x:0, y:0, width: 500, height: 30))
        textField.placeholder = "Usuário"
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    lazy var passwordTextField: UITextField = {
        let textField = UITextField(frame: CGRect(x:0, y:0, width: 500, height: 30))
        textField.placeholder = "Senha"
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    lazy var loginButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .cyan
        button.setTitle("Login", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var alertText: UILabel = {
        let label = UILabel()
        label.textColor = .cyan
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private func constraintUserText(){
        NSLayoutConstraint.activate([
            userNameTextField.topAnchor.constraint(equalTo: topAnchor, constant: 150),
            userNameTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 50),
            userNameTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -50)
        ])
    }
    
    private func constraintPasswordText(){
        NSLayoutConstraint.activate([
            passwordTextField.topAnchor.constraint(equalTo: userNameTextField.bottomAnchor, constant: 50),
            passwordTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 50),
            passwordTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -50)
        ])
    }
    
    private func constraintButton(){
        NSLayoutConstraint.activate([
            loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 70),
            loginButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 50),
            loginButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -50)
        ])
    }
    
    private func constraintAlertLabel(){
        NSLayoutConstraint.activate([
            alertText.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 80),
            alertText.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 50),
            alertText.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -50),
        ])
    }
    
}
