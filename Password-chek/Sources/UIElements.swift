//
//  UIElements.swift
//  Password-chek
//
//  Created by Ян Жигурс on 15.02.2023.
//

import UIKit

class UiElements {
    let label: UILabel = {
        let label = UILabel()
        label.backgroundColor = .blue
        label.textColor = .white
        label.textAlignment = .center
        label.clipsToBounds = true
        label.layer.cornerRadius = 15
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let textField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .green
        textField.textAlignment = .center
        textField.isSecureTextEntry = true
        textField.clipsToBounds = true
        textField.layer.cornerRadius = 15
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
   }()
    
    let indicator: UIActivityIndicatorView = {
       let indicator = UIActivityIndicatorView()
       indicator.style = .medium
       indicator.translatesAutoresizingMaskIntoConstraints = false
       return indicator
   }()
    
    let button: UIButton = {
        let button = UIButton()
        button.backgroundColor = .red
        button.setTitle("Start", for: .normal)
        button.addTarget(.none, action: #selector(PasswordViewController.buttonPressed),
                        for: .touchUpInside)
        button.clipsToBounds = true
        button.layer.cornerRadius = 15
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
   }()
}

func indexOf(character: Character, _ array: [String]) -> Int {
    return array.firstIndex(of: String(character)) ?? 0
}

func characterAt(index: Int, _ array: [String]) -> Character {
    return index < array.count ? Character(array[index])
                               : Character("")
}

func generateBruteForce(_ string: String, fromArray array: [String]) -> String {
    var enteredPass: String = string

    if enteredPass.count <= 0 {
        enteredPass.append(characterAt(index: 0, array))
    }
    else {
        enteredPass.replace(at: enteredPass.count - 1,
                    with: characterAt(index: (indexOf(character: enteredPass.last ?? "0", array) + 1) % array.count, array))

        if indexOf(character: enteredPass.last ?? "0", array) == 0 {
            enteredPass = String(generateBruteForce(String(enteredPass.dropLast()), fromArray: array)) + String(enteredPass.last ?? "0")
        }
    }
    return enteredPass
}
