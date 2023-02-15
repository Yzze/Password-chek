//
//  ViewController.swift
//  Password-chek
//
//  Created by Ян Жигурс on 15.02.2023.
//

import UIKit

class PasswordViewController: UIViewController {

    let label = UiElements().label
    let textField = UiElements().textField
    let indicator = UiElements().indicator
    let button = UiElements().button
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewSettings()
        setupHierarchy()
        setupLayout()
    }
    
    private func setupViewSettings() {
        view.backgroundColor = .white
    }
    
    private func setupHierarchy() {
        view.addSubview(button)
        view.addSubview(textField)
        view.addSubview(label)
        view.addSubview(indicator)
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: view.topAnchor, constant: 450),
            button.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -150),
            button.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -350),
            button.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 150),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalTo: view.topAnchor, constant: 350),
            textField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -80),
            textField.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -450),
            textField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 80),
            textField.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: view.topAnchor, constant: 250),
            label.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -120),
            label.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -550),
            label.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 120),
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            indicator.topAnchor.constraint(equalTo: view.topAnchor, constant: 395),
            indicator.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -80),
            indicator.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -405),
            indicator.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 80),
        ])
    }

    // MARK: UI Action
    
    @objc func buttonPressed() {
        DispatchQueue.main.async {
            self.indicator.startAnimating()
        }
        
        DispatchQueue.global(qos: .background).async {
            func bruteForce(passwordToUnlock: String) {
                let ALLOWED_CHARACTERS:   [String] = String().printable.map { String($0) }
                var password: String = ""
                while password != passwordToUnlock {
                    password = generateBruteForce(password, fromArray: ALLOWED_CHARACTERS)
                    print(password)
                }
                print(password)
                DispatchQueue.main.async {
                    self.label.text = password
                    self.textField.isSecureTextEntry = false
                    self.indicator.stopAnimating()
                }
            }
            bruteForce(passwordToUnlock: self.textField.text ?? "")
        }
    }
}
