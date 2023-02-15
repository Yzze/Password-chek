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
       label.translatesAutoresizingMaskIntoConstraints = false
       return label
    }()
    
    let textField: UITextField = {
       let textField = UITextField()
       textField.backgroundColor = .green
       textField.textAlignment = .center
       textField.isSecureTextEntry = true
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
       button.tintColor = .black
       button.setTitle("Start", for: .normal)
       button.addTarget(.none, action: #selector(PasswordViewController.buttonPressed),
                        for: .touchUpInside)
       button.translatesAutoresizingMaskIntoConstraints = false
       return button
   }()
}

func indexOf(character: Character, _ array: [String]) -> Int {
    return array.firstIndex(of: String(character))!
}

func characterAt(index: Int, _ array: [String]) -> Character {
    return index < array.count ? Character(array[index])
                               : Character("")
}

func generateBruteForce(_ string: String, fromArray array: [String]) -> String {
    var str: String = string

    if str.count <= 0 {
        str.append(characterAt(index: 0, array))
    }
    else {
        str.replace(at: str.count - 1,
                    with: characterAt(index: (indexOf(character: str.last!, array) + 1) % array.count, array))

        if indexOf(character: str.last!, array) == 0 {
            str = String(generateBruteForce(String(str.dropLast()), fromArray: array)) + String(str.last!)
        }
    }

    return str
}
