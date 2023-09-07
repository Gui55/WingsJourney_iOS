//
//  LoginViewController.swift
//  WingsJourney
//
//  Created by Guilherme Medeiros Mergulhão on 06/09/23.
//

import UIKit
import SwiftUI

final class LoginViewController: UIViewController{
    
    private var loginView: LoginView? = nil
    private let viewModel = LoginViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buildView()
        setupActions()
    }
    
    private func buildView(){
        view = LoginView()
        loginView = view as? LoginView
    }
    
    private func setupActions(){
        loginView?.loginButton.addTarget(self, action: #selector(loginAction), for: .touchUpInside)
    }
    
    @objc private func loginAction(){
        let user = loginView?.userNameTextField.text ?? ""
        let password = loginView?.passwordTextField.text ?? ""
        
        viewModel.performLogin(user: user, password: password){ [weak self] value in
            if value{
                let gamesListViewController = GamesListViewController()
                self?.navigationController?.pushViewController(gamesListViewController, animated: true)
            } else {
                self?.loginView?.alertText.text = "Credenciais Erradas"
            }
        }
    }
    
}

struct LoginViewControllerRepresentable: UIViewControllerRepresentable{
    typealias UIViewControllerType = LoginViewController
    
    func makeUIViewController(context: Context) -> LoginViewController {
        LoginViewController()
    }
    
    func updateUIViewController(_ uiViewController: LoginViewController, context: Context) {
        
    }
}

struct LoginViewController_Previews: PreviewProvider {
    static var previews: some View {
        LoginViewControllerRepresentable()
    }
}
