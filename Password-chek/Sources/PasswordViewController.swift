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
    }

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
