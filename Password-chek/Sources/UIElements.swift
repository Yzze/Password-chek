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
}
